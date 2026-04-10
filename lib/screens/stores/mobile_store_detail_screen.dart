import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class MobileStoreDetailScreen extends StatelessWidget {
  final String id;
  const MobileStoreDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductVisual(),
                const SizedBox(height: 32),
                _buildProductIdentity(),
                const SizedBox(height: 32),
                _buildSpecsBento(),
                const SizedBox(height: 32),
                _buildFeaturesList(),
                const SizedBox(height: 32),
                _buildLocationSection(),
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
      backgroundColor: AppTheme.surfaceLowest.withOpacity(0.6),
      elevation: 0,
      centerTitle: true,
      title: const Text('تفاصيل المنتج', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share, color: AppTheme.primaryContainer),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildProductVisual() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(24)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [AppTheme.primaryContainer.withOpacity(0.15), Colors.transparent], stops: const [0.0, 0.7]),
            ),
          ),
          Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuA3I1u7jcuK9DX6SU9QRVepoqsxmOwssGk37hKBNYLqGHjf4juWpCRVIUlkxC5Cxp3OFJh6IUPIMh8vZ8llJ9wrs5FDLf_Bl0EhiE-Tk9FRULiqU5pzaaIVd3n_A1YQ9Ilj-Ne7FxPH12qSyGpl849kWkFMQBdChfXIYRUJN-sNYsy-ZEZRdjfTFGymMgkRpZx2wkxPBnTYaPND1YHprKC3naY718Z-gy49OZCQ-2_WDVFdpXWUTalCHsNCKuhaN17PdsjTPWIEY_Q', fit: BoxFit.contain, width: 200, height: 200),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(16)),
              child: const Text('PROFESSIONAL GEAR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductIdentity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('DJI OM 5', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, color: Colors.white, height: 1.1)),
              const SizedBox(height: 8),
              const Text('مانع اهتزاز محمول للجوال، مثالي لتصوير الفيديوهات الاحترافية.', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 14, height: 1.5)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('\$150', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: AppTheme.primaryContainer)),
            Text('شامل الضريبة', style: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.6), fontSize: 10)),
          ],
        )
      ],
    );
  }

  Widget _buildSpecsBento() {
    return Row(
      children: [
        _buildSpecCard(Icons.monitor_weight, 'الوزن', '290 جرام'),
        const SizedBox(width: 12),
        _buildSpecCard(Icons.battery_charging_full, 'البطارية', '6 ساعات'),
        const SizedBox(width: 12),
        _buildSpecCard(Icons.phonelink_setup, 'التوافق', '6.5 إنش'),
        const SizedBox(width: 12),
        _buildSpecCard(Icons.precision_manufacturing, 'النوع', '3 محاور'),
      ],
    );
  }

  Widget _buildSpecCard(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Icon(icon, color: AppTheme.primaryContainer, size: 24),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 32, height: 2, color: AppTheme.primaryContainer),
            const SizedBox(width: 8),
            const Text('المميزات التقنية', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 16),
        _buildFeatureItem(Icons.face, 'تتبع الوجه والذكاء الاصطناعي الذكي', true),
        _buildFeatureItem(Icons.panorama, 'تصوير بانوراما بلمسة واحدة', false),
        _buildFeatureItem(Icons.slow_motion_video, 'وضع الحركة البطيئة السينمائي', false),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String label, bool active) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: Border(right: BorderSide(color: active ? AppTheme.primaryContainer : Colors.transparent, width: 4)),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryContainer),
          const SizedBox(width: 16),
          Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white))),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(24), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.2), shape: BoxShape.circle),
                child: const Icon(Icons.location_on, color: AppTheme.primaryContainer, size: 20),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('موقع البائع', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                  const Text('صنعاء – شارع الزبيري', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 12)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 160,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppTheme.surfaceHigh),
            clipBehavior: Clip.antiAlias,
            child: Image.network('https://lh3.googleusercontent.com/aida/ADBb0uhdlWLaxBWbwtUPGO8iud7t5aIL1ZW9CvJARHmzFzvkoHNJe4ca1C_1BlUbNFrI9r6wGmb_Ub3HqSwoky5eNJES2kJ6iFLhevmdSFRaVI-I3TLoAppAUS_rgng4lwdDy7YfIUnfc6FHue73x5K24YgHEEx0tGPkLDGeymCFsekuzV_-2Zm8S1mhpqQOu6M-IKSEMobD0dul8dcvB8MUogqzLVampoCknP02p-Y1z8PVV-HowROROn8R2VgtPimN_3iI_uvHbkJH', fit: BoxFit.cover, color: Colors.grey, colorBlendMode: BlendMode.saturation),
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
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1B1B).withOpacity(0.8),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.05), blurRadius: 48, offset: const Offset(0, -8))],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.2))),
              child: const Icon(Icons.chat_bubble, color: AppTheme.primaryContainer),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 10)],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('طلب المنتج الآن', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.shopping_cart, color: Colors.white),
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
