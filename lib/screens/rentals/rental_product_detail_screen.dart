import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class RentalProductDetailScreen extends StatelessWidget {
  final String id;
  const RentalProductDetailScreen({super.key, required this.id});

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
                _buildProductHero(),
                const SizedBox(height: 32),
                _buildProductHeader(),
                const SizedBox(height: 32),
                _buildTechSpecs(),
                const SizedBox(height: 32),
                _buildPricing(),
                const SizedBox(height: 32),
                _buildRentalHistory(),
              ],
            ),
          ),
          _buildBottomActions(),
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
        icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer),
        onPressed: () => context.pop(),
      ),
      title: const Text('تفاصيل Canon 90D', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryContainer)),
      actions: [
        const Icon(Icons.share, color: AppTheme.onSurfaceVariant, size: 20),
        const SizedBox(width: 16),
        Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.3))),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/photographer_work_1.jpg', fit: BoxFit.cover),
        ),
      ],
    );
  }

  Widget _buildProductHero() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: AppTheme.surfaceLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Color.fromRGBO(255, 92, 0, 0.15), blurRadius: 60, spreadRadius: -15)],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
           Image.asset('assets/images/landscape_photographers_chat.png', fit: BoxFit.cover, width: double.infinity, height: double.infinity, opacity: const AlwaysStoppedAnimation(0.9)),
           Positioned(
             top: 24,
             left: 24,
             child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
               decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(24)),
               child: Row(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                   const SizedBox(width: 8),
                   const Text('متاح', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white, letterSpacing: 1.0)),
                 ],
               ),
             ),
           )
        ],
      ),
    );
  }

  Widget _buildProductHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('كاينون EOS 90D', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
            Row(
              children: const [
                Icon(Icons.star, color: AppTheme.primaryContainer, size: 16),
                SizedBox(width: 4),
                Text('4.9', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryContainer)),
              ],
            )
          ],
        ),
        const SizedBox(height: 12),
        const Text('كاميرا DSLR قوية مصممة لالتقاط صور مفصلة وفيديو بدقة 4K. مثالية للحياة البرية والرياضة وإنشاء المحتوى الاحترافي.', style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant, height: 1.5)),
      ],
    );
  }

  Widget _buildTechSpecs() {
    return Row(
      children: [
        Expanded(child: _buildSpecCard(Icons.photo_camera, 'الدقة', '32.5 ميجابكسل', true)),
        const SizedBox(width: 12),
        Expanded(child: _buildSpecCard(Icons.camera_roll, 'المستشعر', 'APS-C', true)),
        const SizedBox(width: 12),
        Expanded(child: _buildSpecCard(Icons.videocam, 'الفيديو', '4K UHD', false)),
      ],
    );
  }

  Widget _buildSpecCard(IconData icon, String label, String value, bool withBorder) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(16),
        border: withBorder ? const Border(right: BorderSide(color: Color.fromRGBO(255, 92, 0, 0.2), width: 2)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryContainer, size: 24),
          const SizedBox(height: 16),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildPricing() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('خيارات التأجير', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 2.0)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.today, color: AppTheme.primaryContainer, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       Text('السعر اليومي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                       Text('دورة 24 ساعة قياسية', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
              const Text('150 ج.م', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryContainer)),
            ],
          ),
        ),
         const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.calendar_view_week, color: AppTheme.primaryContainer, size: 20),
                  ),
                  const SizedBox(width: 16),
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                       Text('السعر الأسبوعي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                       Text('حزمة احترافية لمدة 7 أيام', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
               const Text('850 ج.م', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryContainer)),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRentalHistory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('سجل التأجير', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 2.0)),
            Text('عرض الكل', style: TextStyle(fontSize: 10, color: AppTheme.primaryContainer, decoration: TextDecoration.underline)),
          ],
        ),
        const SizedBox(height: 16),
        _buildHistoryItem('مشروع "ليلة المدينة"', '12 أكتوبر - 15 أكتوبر • User_X99', false),
        const SizedBox(height: 12),
        _buildHistoryItem('تصوير زفاف أليكس', '28 سبتمبر - 30 سبتمبر • Ahmed_V', true),
      ],
    );
  }

  Widget _buildHistoryItem(String title, String subtitle, bool isOpacity) {
    return Opacity(
      opacity: isOpacity ? 0.6 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
             Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.outlineVariant, shape: BoxShape.circle)),
             const SizedBox(width: 12),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white)),
                   Text(subtitle, style: const TextStyle(fontSize: 8, color: AppTheme.onSurfaceVariant)),
                 ],
               ),
             ),
             const Icon(Icons.history, color: AppTheme.onSurfaceVariant, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
       child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF131313).withOpacity(0.6),
          border: const Border(top: BorderSide(color: Colors.white10)),
        ),
        child: Row(
          children: [
             Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.2)), boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)]),
                child: const Icon(Icons.forum, color: Colors.white, size: 24),
             ),
             const SizedBox(width: 16),
             Expanded(
               child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 20)],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                       Icon(Icons.calendar_month, color: Colors.white, size: 20),
                       SizedBox(width: 12),
                       Text('طلب حجز', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 14, color: Colors.white, letterSpacing: 1.0)),
                    ],
                  ),
               ),
             )
          ],
        ),
       ),
    );
  }
}
