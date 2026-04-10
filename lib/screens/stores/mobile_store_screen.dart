import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class MobileStoreScreen extends StatelessWidget {
  const MobileStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(height: 32),
            _buildFilters(),
            const SizedBox(height: 32),
            _buildProductGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2), // Index 2 for store
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      titleSpacing: 24,
      leading: null,
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          Icon(Icons.videocam, color: AppTheme.primaryContainer),
          SizedBox(width: 8),
          Text(
            'THE FLASH',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 20,
              color: AppTheme.primaryContainer,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              const Text('FILTER', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
              const SizedBox(width: 4),
              const Icon(Icons.tune, color: Colors.grey, size: 20),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'معدات التصوير بالجوال',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 96,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    final filters = ['الكل', 'موانع اهتزاز', 'إضاءة حلقية', 'ميكروفونات', 'عدسات'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final isActive = f == 'الكل';
          return Container(
            margin: const EdgeInsets.only(left: 12),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              gradient: isActive ? const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]) : null,
              color: isActive ? null : AppTheme.surfaceHigh,
              border: isActive ? null : Border.all(color: AppTheme.outlineVariant.withOpacity(0.15)),
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

  Widget _buildProductGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.65,
      children: [
        _buildProductCard(
          context: context,
          isPro: true,
          title: 'مانع اهتزاز X-300',
          desc: 'ثبات سينمائي فائق مع ميزة التتبع الذكي للوجه والأجسام.',
          price: '499 ريال',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA3I1u7jcuK9DX6SU9QRVepoqsxmOwssGk37hKBNYLqGHjf4juWpCRVIUlkxC5Cxp3OFJh6IUPIMh8vZ8llJ9wrs5FDLf_Bl0EhiE-Tk9FRULiqU5pzaaIVd3n_A1YQ9Ilj-Ne7FxPH12qSyGpl849kWkFMQBdChfXIYRUJN-sNYsy-ZEZRdjfTFGymMgkRpZx2wkxPBnTYaPND1YHprKC3naY718Z-gy49OZCQ-2_WDVFdpXWUTalCHsNCKuhaN17PdsjTPWIEY_Q',
        ),
        _buildProductCard(
          context: context,
          title: 'إضاءة حلقة الفلاش',
          desc: 'تحكم كامل في درجات الحرارة والسطوع للحصول على بشرة مثالية.',
          price: '250 ريال',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8',
        ),
        _buildProductCard(
          context: context,
          title: 'ميكروفون لاسلكي S2',
          desc: 'صوت نقي خالي من الضجيج بمدى يصل إلى 50 متر.',
          price: '320 ريال',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw',
        ),
        _buildProductCard(
          context: context,
          title: 'طقم عدسات سينما',
          desc: 'عدسات ماكرو وواسعة الزاوية بزجاج بصري عالي الدقة.',
          price: '180 ريال',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8',
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
    bool isPro = false,
  }) {
    return GestureDetector(
      onTap: () => context.push('/stores/mobile/1'),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  ),
                  if (isPro)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF353534).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('PRO', style: TextStyle(color: AppTheme.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white, height: 1.2)),
                      const SizedBox(height: 4),
                      Text(desc, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryContainer)),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(color: AppTheme.surfaceHigh, shape: BoxShape.circle),
                        child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
