import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeroSection(),
                    const SizedBox(height: 24),
                    _buildBentoGrid(context),
                    const SizedBox(height: 32),
                    _buildTechnicalFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color(0xFF131313),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white70),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: Colors.white70),
                onPressed: () => context.go('/chat'),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const Text(
            'CAMS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: 'Space Grotesk',
              color: AppTheme.primaryContainer,
              letterSpacing: 2,
            ),
          ),
          // Spacer
          const SizedBox(width: 64),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 192,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
            child: Image.asset("assets/images/camera_lens.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.surface, Colors.transparent, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(text: 'استكشف عالم ', style: TextStyle(color: Colors.white)),
                      TextSpan(text: 'السينما', style: TextStyle(color: AppTheme.primaryContainer)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'معدات احترافية، خدمات  ومجتمع متكامل للمبدعين.',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBentoGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildBentoCard(
                context: context,
                height: 148,
                icon: Icons.storefront,
                title: 'المحلات للتأجير',
                subtitle: 'تصفح أكبر قائمة محلات تأجير المعدات',
                route: '/rentals',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildBentoCard(
                context: context,
                height: 148,
                icon: Icons.photo_camera,
                title: 'المصورين',
                subtitle: 'احجز نخبة المحترفين',
                route: '/crew',
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildBentoCard(
                context: context,
                height: 148,
                icon: Icons.forum,
                title: 'الدردشة',
                subtitle: 'تواصل مع مجتمع المصورين',
                route: '/chat',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBentoCard({
    required BuildContext context,
    required double height,
    required IconData icon,
    required String title,
    required String subtitle,
    required String route,
    bool isFeatured = false,
  }) {
    return _BentoCardStateful(
      height: height,
      icon: icon,
      title: title,
      subtitle: subtitle,
      route: route,
      isFeatured: isFeatured,
    );
  }

  Widget _buildTechnicalFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLowest,
        borderRadius: BorderRadius.circular(8),
        border: const Border(
          right: BorderSide(color: AppTheme.primaryContainer, width: 2),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.memory, color: AppTheme.primaryContainer.withOpacity(0.5), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'CAMS Technical Support v.4.0 • Active Infrastructure'.toUpperCase(),
              style: const TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 10,
                color: AppTheme.onSurfaceVariant,
                letterSpacing: 2.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BentoCardStateful extends StatefulWidget {
  final double height;
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  final bool isFeatured;

  const _BentoCardStateful({
    required this.height,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
    required this.isFeatured,
  });

  @override
  State<_BentoCardStateful> createState() => _BentoCardStatefulState();
}

class _BentoCardStatefulState extends State<_BentoCardStateful> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () => context.push(widget.route),
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: const Cubic(0.05, 0.7, 0.1, 1.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.height,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _isHovered ? AppTheme.surfaceHigh : AppTheme.surfaceLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryContainer.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(widget.icon, color: AppTheme.primaryContainer, size: widget.isFeatured ? 32 : 24),
                    ),
                    if (widget.isFeatured)
                      Icon(Icons.north_east, color: _isHovered ? AppTheme.primaryContainer : Colors.white24),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: widget.isFeatured ? 20 : 18,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: widget.isFeatured ? 12 : 10,
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
