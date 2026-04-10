import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class CinemaStoreDetailScreen extends StatelessWidget {
  final String id;
  const CinemaStoreDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImageGallery(),
                const SizedBox(height: 32),
                _buildProductInfo(),
                const SizedBox(height: 24),
                _buildPriceCard(),
                const SizedBox(height: 24),
                _buildSellerCard(),
                const SizedBox(height: 32),
                _buildTechnicalSpecs(),
                const SizedBox(height: 48),
                _buildDetailedDescription(),
                const SizedBox(height: 48),
                _buildLocationSidebar(),
              ],
            ),
          ),
          _buildFloatingAction(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
        onPressed: () => context.pop(),
      ),
      title: const Text('THE FLASH', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, color: AppTheme.primaryContainer, letterSpacing: 2.0)),
      actions: const [
        Icon(Icons.share, color: Colors.white, size: 20),
        SizedBox(width: 16),
        Icon(Icons.favorite_border, color: Colors.white, size: 20),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildImageGallery() {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
          child: Stack(
            children: [
               Positioned.fill(
                child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw', fit: BoxFit.cover),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppTheme.surfaceHighest.withOpacity(0.8), borderRadius: BorderRadius.circular(4), border: Border.all(color: AppTheme.primary.withOpacity(0.2))),
                  child: const Text('4K RAW • 120 FPS', style: TextStyle(color: AppTheme.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildThumbnail('https://lh3.googleusercontent.com/aida/ADBb0uhdlWLaxBWbwtUPGO8iud7t5aIL1ZW9CvJARHmzFzvkoHNJe4ca1C_1BlUbNFrI9r6wGmb_Ub3HqSwoky5eNJES2kJ6iFLhevmdSFRaVI-I3TLoAppAUS_rgng4lwdDy7YfIUnfc6FHue73x5K24YgHEEx0tGPkLDGeymCFsekuzV_-2Zm8S1mhpqQOu6M-IKSEMobD0dul8dcvB8MUogqzLVampoCknP02p-Y1z8PVV-HowROROn8R2VgtPimN_3iI_uvHbkJH', active: true),
            const SizedBox(width: 12),
            _buildThumbnail('https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8'),
            const SizedBox(width: 12),
            _buildThumbnail('https://lh3.googleusercontent.com/aida/ADBb0uhdlWLaxBWbwtUPGO8iud7t5aIL1ZW9CvJARHmzFzvkoHNJe4ca1C_1BlUbNFrI9r6wGmb_Ub3HqSwoky5eNJES2kJ6iFLhevmdSFRaVI-I3TLoAppAUS_rgng4lwdDy7YfIUnfc6FHue73x5K24YgHEEx0tGPkLDGeymCFsekuzV_-2Zm8S1mhpqQOu6M-IKSEMobD0dul8dcvB8MUogqzLVampoCknP02p-Y1z8PVV-HowROROn8R2VgtPimN_3iI_uvHbkJH'),
          ],
        ),
      ],
    );
  }

  Widget _buildThumbnail(String url, {bool active = false}) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppTheme.surfaceHigh,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: active ? AppTheme.primaryContainer : AppTheme.outlineVariant.withOpacity(0.2), width: active ? 2 : 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(url, fit: BoxFit.cover, color: active ? null : Colors.grey, colorBlendMode: active ? null : BlendMode.saturation),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('CINEMA SERIES X', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.primary, letterSpacing: 4.0)),
        const SizedBox(height: 8),
        const Text('FLASH CORE-V1', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 40, color: Colors.white, height: 1.1)),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.star, color: AppTheme.primaryContainer, size: 16),
            const Icon(Icons.star, color: AppTheme.primaryContainer, size: 16),
            const Icon(Icons.star, color: AppTheme.primaryContainer, size: 16),
            const Icon(Icons.star, color: AppTheme.primaryContainer, size: 16),
            const Icon(Icons.star_half, color: AppTheme.primaryContainer, size: 16),
            const SizedBox(width: 8),
            Text('(48 Review)', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant.withOpacity(0.8), letterSpacing: 1.0)),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLowest,
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: AppTheme.primaryContainer, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('السعر الحالي', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: const [
              Text('24,500', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 48, color: AppTheme.primaryContainer)),
              SizedBox(width: 8),
              Text('ر.س', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppTheme.primaryContainer)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSellerCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: AppTheme.surfaceHighest, shape: BoxShape.circle, border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.2))),
                clipBehavior: Clip.antiAlias,
                child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw', fit: BoxFit.cover),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('استوديو العدسة الذهبية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('الرياض، المنطقة الصناعية', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const Icon(Icons.chevron_left, color: AppTheme.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildTechnicalSpecs() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2.0,
      children: [
        _buildSpecItem('المستشعر', 'Full Frame CMOS'),
        _buildSpecItem('الدقة', '8K @ 60 FPS'),
        _buildSpecItem('المدى الديناميكي', '16+ Stops'),
        _buildSpecItem('الوزن', '1.2 KG (Body)'),
      ],
    );
  }

  Widget _buildSpecItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDetailedDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(padding: const EdgeInsets.only(bottom: 8), decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primaryContainer, width: 2))), child: const Text('الوصف التفصيلي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primaryContainer, letterSpacing: 1.0))),
            const SizedBox(width: 24),
            const Text('المراجعات', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
            const SizedBox(width: 24),
            const Text('الضمان', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
          ],
        ),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontFamily: 'Manrope', fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.6),
            children: [
              TextSpan(text: 'صُممت كاميرا '),
              TextSpan(text: 'FLASH CORE-V1 ', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
              TextSpan(text: 'لتكون الأداة المثالية لصناع الأفلام الذين لا يقبلون بأنصاف الحلول. بفضل مستشعرها الثوري، توفر عمقاً لونياً وتفاصيل سينمائية تضاهي أكبر استوديوهات هوليوود.\n\nتتميز الكاميرا بنظام تبريد داخلي نشط يضمن استمرارية العمل في أقسى الظروف المناخية دون فقدان في الأداء.'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildFeatureRow('دعم كامل لعدسات PL-Mount و EF-Mount'),
        _buildFeatureRow('نظام فوكس تلقائي ذكي بتتبع العين'),
        _buildFeatureRow('مدخلات XLR احترافية للصوت'),
        _buildFeatureRow('شاشة لمس 5 بوصة بدقة HDR'),
      ],
    );
  }

  Widget _buildFeatureRow(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppTheme.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.white))),
        ],
      ),
    );
  }

  Widget _buildLocationSidebar() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('موقع الاستلام', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, letterSpacing: 1.0)),
          const SizedBox(height: 16),
          Container(
            height: 150,
            decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(8)),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw', fit: BoxFit.cover, opacity: const AlwaysStoppedAnimation(0.6)),
                const Center(
                  child: Icon(Icons.location_on, color: AppTheme.primaryContainer, size: 32),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Icon(Icons.info_outline, color: AppTheme.onSurfaceVariant, size: 16),
              SizedBox(width: 8),
              Expanded(child: Text('الشحن متاح لجميع مناطق المملكة عبر "وميض إكسبريس" أو الاستلام المباشر من الفرع الرئيسي بالرياض.', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, height: 1.5))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFloatingAction() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1B1B).withOpacity(0.8),
          border: Border(top: BorderSide(color: AppTheme.primaryContainer.withOpacity(0.1))),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat, color: Colors.white, size: 16),
                label: const Text('دردشة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppTheme.outlineVariant.withOpacity(0.3)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.4), blurRadius: 20)],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart, color: Colors.white, size: 20),
                  label: const Text('طلب المنتج الآن', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 2.0)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
