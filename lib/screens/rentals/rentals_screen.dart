import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 32),
            _buildShopGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1), // Index 1 for rentals
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppTheme.primaryContainer),
        onPressed: () {}, 
      ),
      title: const Text(
        'CAMS',
        style: TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.w900,
          fontSize: 24,
          color: AppTheme.primaryContainer,
          letterSpacing: -1.0,
          fontStyle: FontStyle.italic,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.surfaceHigh,
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network("https://lh3.googleusercontent.com/aida-public/AB6AXuA7XkrTdvCw-WVUmHtCLIP87WNj7qUH-AvN_5gDGHRAv3ILUzdpd4B7UFy_6Ug3DUDMrSAWjewR7WsV4yrS4l_OK1YEMdyNE08vbk5N1_M-Of9zISz9GZCNOJ-TaBEDI5S2rRbTuCneOu_jpgH-9SkePWVHN5NPvn-fOGpjoo-SNl-Ht8rK_5lwRPQx4pScIOpAlgo8ObOTvia_MRprCPgt-xmRDGOMfPZ7cM7Ebbia3teaQ-2Y867-M7KJE3kSOZ4mbJPcA6xq9VQ",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('PARTNERS', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 4.0, color: AppTheme.primaryContainer)),
                const SizedBox(height: 8),
                const Text('محلات التأجير', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white, height: 1.1)),
              ],
            ),
            Row(
              children: [
                _buildIconButton(Icons.search),
                const SizedBox(width: 8),
                _buildIconButton(Icons.tune),
              ],
            )
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'اكتشف أفضل معدات التصوير السينمائي من شركائنا المعتمدين في جميع أنحاء المملكة.',
          style: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.8), fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildShopGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.6,
      children: [
        _buildShopCard(
          context: context,
          id: '1',
          isTopRated: true,
          title: 'عدسة صنعاء',
          desc: 'أكبر تشكيلة من كاميرات Red و Arri للإيجار اليومي.',
          location: 'العليا، صنعاء',
          imageUrl: 'assets/images/rental_shop_1.jpg',
          isPrimaryAction: true,
        ),
        _buildShopCard(
          context: context,
          id: '2',
          title: 'سينما كرافت',
          desc: 'متخصصون في معدات الإضاءة والصوت للإنتاج السينمائي.',
          location: 'حي الروضة، صنعاء',
          imageUrl: 'assets/images/rental_shop_2.jpg',
        ),
        _buildShopCard(
          context: context,
          id: '3',
          title: 'فيجن برو',
          desc: 'حلول تقنية متكاملة لتغطية الفعاليات والمؤتمرات.',
          location: 'الدانة، صنعاء',
          imageUrl: 'assets/images/rental_shop_3.jpg',
        ),
        _buildShopCard(
          context: context,
          id: '4',
          title: 'استوديو ريز',
          desc: 'نوفر استوديوهات مجهزة بالكامل ومعدات تصوير فوتوغرافي.',
          location: 'العزيزية، صنعاء',
          imageUrl: 'assets/images/rental_shop_4.jpg',
        ),
      ],
    );
  }

  Widget _buildShopCard({
    required BuildContext context,
    required String id,
    required String title,
    required String desc,
    required String location,
    required String imageUrl,
    bool isTopRated = false,
    bool isPrimaryAction = false,
  }) {
    return GestureDetector(
      onTap: () => context.push('/rentals/shop/$id'),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.05)),
          boxShadow: isTopRated ? [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.15), blurRadius: 40, spreadRadius: -10)] : null,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF1E1E1E), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    ),
                  ),
                  if (isTopRated)
                    Positioned(
                      top: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
                        child: const Text('TOP RATED', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 8, color: Colors.white, letterSpacing: 1.0)),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(16.0).copyWith(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text(desc, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, height: 1.2), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppTheme.primaryContainer, size: 14),
                        const SizedBox(width: 4),
                        Text(location, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primaryContainer)),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        gradient: isPrimaryAction ? const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]) : null,
                        color: isPrimaryAction ? null : AppTheme.surfaceHigh,
                        borderRadius: BorderRadius.circular(12),
                        border: isPrimaryAction ? null : Border.all(color: AppTheme.primaryContainer.withOpacity(0.2)),
                        boxShadow: isPrimaryAction ? [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 10)] : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DETAILS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 12, color: isPrimaryAction ? Colors.white : AppTheme.primaryContainer)),
                          const SizedBox(width: 8),
                          Icon(Icons.search, size: 14, color: isPrimaryAction ? Colors.white : AppTheme.primaryContainer),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
