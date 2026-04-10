import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class ExpertsPortalScreen extends StatelessWidget {
  const ExpertsPortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 48),
            _buildTechniciansGrid(context),
            const SizedBox(height: 64),
            _buildFeaturedSection(),
            const SizedBox(height: 48),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2), // Example index
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1C1B1B), Colors.transparent],
          ),
        ),
      ),
      titleSpacing: 24,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppTheme.primaryContainer),
        onPressed: () {},
      ),
      title: const Text(
        'بوابة الصيانة',
        style: TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          color: AppTheme.primaryContainer,
          fontSize: 20,
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search, color: Colors.grey), onPressed: () {}),
        IconButton(icon: const Icon(Icons.tune, color: Colors.grey), onPressed: () {}),
        const SizedBox(width: 8),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3), width: 2),
          ),
          padding: const EdgeInsets.all(2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/photographer_mohammad_1.jpg', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EXPERTS PORTAL',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w900,
            fontSize: 32,
            fontStyle: FontStyle.italic,
            letterSpacing: -1.0,
            color: AppTheme.primaryContainer,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'قائمة الفنيين المعتمدين لصيانة المعدات السينمائية المتقدمة. دقة في الأداء، سرعة في التنفيذ.',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 14,
            color: AppTheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTechniciansGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // HTML is grid-cols-1 md:grid-cols-2. Mobile is 1
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.8,
      children: [
        _buildTechCard(
          context: context,
          name: 'م. سمير المنصور',
          desc: 'خبير في معايرة العدسات السينمائية وإصلاح أنظمة الإضاءة المعقدة لأكثر من ١٠ سنوات.',
          location: 'الرياض',
          imageUrl: 'assets/images/tech_ahmad_cinematic.jpg',
          icons: [Icons.photo_camera, Icons.lightbulb, Icons.precision_manufacturing],
        ),
        _buildTechCard(
          context: context,
          name: 'م. سارة الحربي',
          desc: 'متخصصة في صيانة طائرات الدرون وأنظمة التحكم عن بعد الخاصة بالتصوير الجوي.',
          location: 'جدة',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8',
          icons: [Icons.flight, Icons.settings_input_component, Icons.videocam],
        ),
        _buildTechCard(
          context: context,
          name: 'م. فهد العتيبي',
          desc: 'فني متخصص في صيانة الحساسات الرقمية وتنظيف الغرف المعقمة.',
          location: 'الدمام',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw',
          icons: [Icons.memory, Icons.cleaning_services],
        ),
        _buildTechCard(
          context: context,
          name: 'م. ناصر الزهراني',
          desc: 'خبير في برمجيات الكاميرات السينمائية وتحديث أنظمة التشغيل والشبكات.',
          location: 'نيوم',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8',
          icons: [Icons.terminal, Icons.router],
        ),
      ],
    );
  }

  Widget _buildTechCard({
    required BuildContext context,
    required String name,
    required String desc,
    required String location,
    required String imageUrl,
    required List<IconData> icons,
  }) {
    return _HoverCard(
      onTap: () => context.push('/maintenance/expert/1'), // mock ID
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xCC1E1E1E), // glass-card
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.05), blurRadius: 40, spreadRadius: -10),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              width: 96,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
                color: AppTheme.surfaceLowest,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                color: Colors.grey, // Grayscale
                colorBlendMode: BlendMode.saturation,
              ),
            ),
            const SizedBox(width: 20),
            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(name, style: const TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.zoom_in, color: AppTheme.primaryContainer, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(desc, style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant, height: 1.4), maxLines: 3, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: AppTheme.primary),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(location, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primary, letterSpacing: 1.0), maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: icons.map((icon) {
                      return Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(8)),
                        child: Icon(icon, size: 16, color: AppTheme.primaryContainer),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(40),
        border: const Border(
          right: BorderSide(color: AppTheme.primaryContainer, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('FOCUS OF THE MONTH', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primaryContainer, letterSpacing: 2.0)),
          const SizedBox(height: 16),
          const Text('قسم صيانة العدسات المتطور', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
          const SizedBox(height: 16),
          Text(
            'نوفر الآن أحدث تقنيات المعايرة الليزرية للعدسات الأنامورفيك (Anamorphic) في مركزنا الرئيسي بالرياض. احجز موعدك الآن مع خبرائنا.',
            style: TextStyle(color: AppTheme.onSurfaceVariant, height: 1.6),
          ),
          const SizedBox(height: 24),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8', fit: BoxFit.cover, opacity: const AlwaysStoppedAnimation(0.8)),
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text('حجز معايرة فورية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class _HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const _HoverCard({required this.child, required this.onTap});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
