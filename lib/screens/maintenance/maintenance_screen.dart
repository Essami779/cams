import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/dummy_data.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildDashboardSection(context),
                        const SizedBox(height: 24),
                        _buildTechniciansGrid(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3), // Using index 3 for 'ALERTS' currently or if it's top level, the app router maps something to ALERTS 
      // Honestly it doesn't matter much for BottomNav correctness unless they navigate, which they do. 'ALERTS' is at index 3 in CustomBottomNav.
      // Wait, there is no Maintenance bottom nav button in the Flutter app. Let's just use -1 to hide selection or index 3.
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF131313),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.primaryContainer.withOpacity(0.15),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryContainer.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer), // Added back button just in case, or menu. The HTML uses menu.
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              const Text(
                'بوابة الصيانة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Space Grotesk',
                  color: AppTheme.primaryContainer,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.filter_list, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardSection(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width > 600;
    
    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTeamStatus(),
          const SizedBox(height: 16),
          _buildUrgentRequest(),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(flex: 2, child: _buildTeamStatus()),
          const SizedBox(width: 16),
          Expanded(flex: 1, child: _buildUrgentRequest()),
        ],
      );
    }
  }

  Widget _buildTeamStatus() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          right: BorderSide(
            color: AppTheme.primaryContainer,
            width: 4,
          ),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -80,
            top: -80,
            child: Container(
              width: 256,
              height: 256,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryContainer.withOpacity(0.05),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حالة الفريق',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Manrope',
                      textBaseline: TextBaseline.alphabetic,
                      color: AppTheme.primary.withOpacity(0.8),
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'جاهزية كاملة للمهام',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      height: 1.1,
                      letterSpacing: -1,
                      color: AppTheme.onSurface,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(
                    child: Text(
                      '٢٤ فنياً متاحاً الآن في جميع المناطق.',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 13,
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    '24/7',
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.onSurface.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUrgentRequest() {
    return Container(
      height: 192,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryContainer.withOpacity(0.2),
            blurRadius: 40,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.bolt, size: 48, color: Color(0xFF370E00)),
          SizedBox(height: 8),
          Text(
            'طلب صيانة عاجل',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              color: Color(0xFF370E00), // on-primary-fixed
              height: 1.2,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'استجابة خلال ١٥ دقيقة',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF370E00),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechniciansGrid(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width > 600;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: DummyData.technicians.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        final tech = DummyData.technicians[index];
        return _buildTechCard(context, tech, isWide);
      },
    );
  }

  Widget _buildTechCard(BuildContext context, Map<String, dynamic> tech, bool isWide) {
    return _TechCard(tech: tech, isWide: isWide);
  }
}

class _TechCard extends StatefulWidget {
  final Map<String, dynamic> tech;
  final bool isWide;
  const _TechCard({required this.tech, required this.isWide});

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: _isHovered ? AppTheme.surfaceHigh : AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: widget.isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 192,
                  child: _buildImage(),
                ),
                Expanded(child: _buildInfo()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 192,
                  child: _buildImage(),
                ),
                _buildInfo(),
              ],
            ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isHovered = true),
        onTapUp: (_) => setState(() => _isHovered = false),
        onTapCancel: () => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: content,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedScale(
          scale: _isHovered ? 1.0 : 1.05,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: ColorFiltered(
            colorFilter: _isHovered
                ? const ColorFilter.mode(Colors.transparent, BlendMode.saturation)
                : const ColorFilter.matrix([
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      1, 0,
                  ]),
            child: Image.asset(
              widget.tech['image'],
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                (_isHovered ? AppTheme.surfaceHigh : AppTheme.surfaceLow),
                Colors.transparent,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        ),
        if (widget.tech.containsKey('level') && widget.tech['level'] != null)
          Positioned(
            bottom: 8,
            right: 8, // note: HTML had bottom-2 right-2
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.tech['level'],
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF370E00),
                  fontFamily: 'Manrope',
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tech['name'],
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: AppTheme.primary.withOpacity(0.8)),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            widget.tech['location'],
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                              color: AppTheme.primary.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.open_in_new,
                color: _isHovered ? AppTheme.primaryContainer : Colors.grey,
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            widget.tech['description'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Manrope',
              fontSize: 14,
              height: 1.6,
              color: AppTheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (widget.tech['tags'] as List<String>).map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Text(
                  tag, // note html had just the tags e.g. "Camera"
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                    color: AppTheme.secondary,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
