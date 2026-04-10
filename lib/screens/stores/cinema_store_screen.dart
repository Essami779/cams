import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class CinemaStoreScreen extends StatelessWidget {
  const CinemaStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _buildFilters(),
            const SizedBox(height: 16),
            _buildSecondaryFilters(),
            const SizedBox(height: 32),
            _buildProductGrid(context),
            const SizedBox(height: 32),
            _buildBanner(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2), // Index 2 for store
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        onPressed: () {}, // Handled by standard navigation or just icon design
      ),
      title: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.videocam, color: AppTheme.primaryContainer, size: 20),
          SizedBox(width: 8),
          Text(
            'THE FLASH',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: AppTheme.primaryContainer,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.surfaceHigh,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.filter_list, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text('FILTER', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white)),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // RTL logic might be applied automatically, forcing start works for consistency
      children: [
        const Text(
          'معدات الكاميرا والإنتاج السينمائي',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Colors.white,
            letterSpacing: -1.0,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 96,
          height: 4,
          decoration: BoxDecoration(
            color: AppTheme.primaryContainer,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    final filters = ['الكل', 'كاميرات', 'عدسات', 'إضاءة', 'درونات'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final isActive = f == 'الكل';
          return Container(
            margin: const EdgeInsets.only(left: 12),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? AppTheme.primaryContainer : AppTheme.surfaceHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              f,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : AppTheme.onSurfaceVariant,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSecondaryFilters() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(8)),
            child: const Text('جديد', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          const SizedBox(width: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Text('مستعمل', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant)),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.6, // Taller cards
      children: [
        _buildProductCard(
          context: context,
          badge: 'Pro Choice',
          title: 'كاميرا سينمائية 8K',
          desc: 'دقة تصوير فائقة مع نطاق ديناميكي واسع للإنتاج السينمائي الاحترافي.',
          price: '45,000 ر.س',
          imageUrl: 'assets/images/8k_cinema_camera.png',
        ),
        _buildProductCard(
          context: context,
          badge: 'جديد',
          badgeColor: AppTheme.surfaceHighest,
          title: 'عدسة برايم 35mm',
          desc: 'فتحة عدسة F/1.4 لأداء استثنائي في الإضاءة المنخفضة وعزل رائع.',
          price: '8,500 ر.س',
          imageUrl: 'assets/images/lens_mobile_1.jpg',
        ),
        _buildProductCard(
          context: context,
          title: 'درون تصوير جوي',
          desc: 'ثبات عالي وتصوير بدقة 4K مع نظام تتبع ذكي للعناصر المتحركة.',
          price: '12,200 ر.س',
          imageUrl: 'assets/images/gimbal_x300_store.jpg',
        ),
        _buildProductCard(
          context: context,
          title: 'طقم إضاءة LED',
          desc: 'إضاءة احترافية قابلة للتحكم في درجة اللون والسطوع عبر التطبيق.',
          price: '3,400 ر.س',
          imageUrl: 'assets/images/ring_light_store.jpg',
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required BuildContext context,
    required String title,
    required String desc,
    required String price,
    required String imageUrl,
    String? badge,
    Color badgeColor = AppTheme.primaryContainer,
  }) {
    return GestureDetector(
      onTap: () => context.push('/stores/cinema/1'),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(color: AppTheme.surfaceLowest),
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                  if (badge != null)
                    Positioned(
                      top: 12,
                      right: 12, // In RTL, this is technically left visual in some flutter versions if not handled, but we use directional or just right.
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(4)),
                        child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white), overflow: TextOverflow.ellipsis)),
                            const Icon(Icons.info_outline, color: AppTheme.primaryContainer, size: 16),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(desc, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    Text(price, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 14, color: AppTheme.primaryContainer)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceHigh,
        borderRadius: BorderRadius.circular(16),
        border: const Border(right: BorderSide(color: AppTheme.primaryContainer, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('تجهيز استوديو كامل؟', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: AppTheme.primaryContainer)),
          const SizedBox(height: 12),
          const Text('احصل على استشارة مجانية من خبرائنا لتجهيز موقعك بأحدث التقنيات السينمائية العالمية.', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 12, height: 1.5)),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: AppTheme.primaryContainer,
              side: BorderSide.none,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('تواصل معنا', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
