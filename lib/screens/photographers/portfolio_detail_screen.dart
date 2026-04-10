import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import 'dart:ui';

class PortfolioDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const PortfolioDetailScreen({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryContainer.withOpacity(0.15),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero Image
                Hero(
                  tag: imageUrl,
                  child: AspectRatio(
                    aspectRatio: 0.8,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                // Details Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryContainer,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'EXHIBITION DETAIL',
                            style: TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                              color: AppTheme.primaryContainer,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.info_outline, color: AppTheme.primary, size: 24),
                                const SizedBox(height: 16),
                                Text(
                                  description,
                                  style: const TextStyle(
                                    color: AppTheme.onSurfaceVariant,
                                    fontSize: 16,
                                    height: 1.8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 120), // Spacer for bottom
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 24,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
