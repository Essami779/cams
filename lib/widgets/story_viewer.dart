import 'package:flutter/material.dart';
import 'dart:ui';
import '../core/theme.dart';

enum StoryType { image, text }

class StoryData {
  final String userName;
  final String userRole;
  final String userAvatar;
  final String? imageUrl;
  final String? textContent;
  final StoryType type;
  final String timeAgo;

  StoryData({
    required this.userName,
    required this.userRole,
    required this.userAvatar,
    this.imageUrl,
    this.textContent,
    required this.type,
    required this.timeAgo,
  });
}

class StoryViewer extends StatefulWidget {
  final List<StoryData> stories;
  final int initialIndex;

  const StoryViewer({
    super.key,
    required this.stories,
    this.initialIndex = 0,
  });

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _progressController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });

    _startProgress();
  }

  void _startProgress() {
    _progressController.reset();
    _progressController.forward();
  }

  void _nextStory() {
    if (_currentIndex < widget.stories.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startProgress();
    } else {
      Navigator.of(context).pop();
    }
  }

  void _previousStory() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      _startProgress();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 10) {
            Navigator.of(context).pop();
          }
        },
        child: Stack(
          children: [
            // Story Content
            PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                final story = widget.stories[index];
                return _buildStoryContent(story);
              },
            ),

            // Navigation Tap Areas
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: _previousStory,
                    child: Container(color: Colors.transparent),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: _nextStory,
                    child: Container(color: Colors.transparent),
                  ),
                ),
              ],
            ),

            // Top Progress Bar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: List.generate(
                        widget.stories.length,
                        (index) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: index < _currentIndex
                                    ? 1.0
                                    : (index == _currentIndex ? _progressController.value : 0.0),
                                backgroundColor: Colors.white24,
                                valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryContainer),
                                minHeight: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // User Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(widget.stories[_currentIndex].userAvatar),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.stories[_currentIndex].userName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${widget.stories[_currentIndex].userRole} • ${widget.stories[_currentIndex].timeAgo}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryContent(StoryData story) {
    if (story.type == StoryType.image) {
      return Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(story.imageUrl!, fit: BoxFit.cover),
          // Subtle gradient to make text readable
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1A1A), Color(0xFF000000)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceHigh.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3)),
                ),
                child: Text(
                  story.textContent!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Space Grotesk',
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Icon(
                story.userRole.contains('مهندس') ? Icons.build_circle : 
                story.userRole.contains('مصور') ? Icons.camera_alt : Icons.store,
                size: 48,
                color: AppTheme.primaryContainer.withOpacity(0.5),
              ),
            ],
          ),
        ),
      );
    }
  }
}
