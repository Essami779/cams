import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class ExpertDetailsScreen extends StatelessWidget {
  const ExpertDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceLowest.withOpacity(0.8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.grey),
          onPressed: () => context.pop(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3))),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/images/tech_ahmad_cinematic.jpg', fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            const Text('أحمد الصاوي', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          ],
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          _buildEdgeGlows(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfileHero(),
                const SizedBox(height: 48),
                _buildBioSection(),
                const SizedBox(height: 32),
                _buildSpecializations(),
              ],
            ),
          ),
          _buildFloatingAction(context),
        ],
      ),
    );
  }

  Widget _buildEdgeGlows() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              width: 200,
              height: 200,
              child: Container(decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.05), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.05), blurRadius: 100)])),
            ),
            Positioned(
              bottom: 100,
              left: -50,
              width: 200,
              height: 200,
              child: Container(decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.05), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.05), blurRadius: 100)])),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHero() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 256, height: 256, decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.1), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.1), blurRadius: 100)])),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.2), width: 2),
                    boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 20)],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/images/photographer_work_1.jpg', fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: -8,
                  right: -8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
                    child: const Text('PRO EXPERT', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', fontStyle: FontStyle.italic)),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text('أحمد الصاوي', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white)),
        const SizedBox(height: 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: AppTheme.primary, size: 16),
            SizedBox(width: 4),
            Text('الرياض، المملكة العربية السعودية', style: TextStyle(color: AppTheme.primary, fontSize: 14)),
          ],
        ),
      ],
    );
  }

  Widget _buildBioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 16, color: AppTheme.primaryContainer),
            const SizedBox(width: 8),
            const Text('النبذة المهنية', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey, letterSpacing: 1.5)),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'متخصص في إعادة تأهيل وصيانة الكاميرات السينمائية من الفئات العليا (ARRI, RED, Sony Venice). أمتلك مهارات دقيقة في معايرة العدسات (Lens Calibration) وإصلاح الدوائر الإلكترونية المعقدة. خبرة تزيد عن ١٥ عاماً في أكبر استوديوهات الإنتاج.',
          style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 16, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildSpecializations() {
    final specs = ['كاميرات سينمائية', 'أنظمة الإضاءة LED', 'أجهزة تسجيل الصوت', 'معايرة العدسات', 'أنظمة البث المباشر'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 4, height: 16, color: AppTheme.primaryContainer),
            const SizedBox(width: 8),
            const Text('المعدات التي يحترف صيانتها', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey, letterSpacing: 1.5)),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: specs.map((s) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), border: Border.all(color: Colors.white.withOpacity(0.1)), borderRadius: BorderRadius.circular(12)),
            child: Text(s, style: const TextStyle(color: Colors.white, fontSize: 14)),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildFloatingAction(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [AppTheme.surfaceLowest, Colors.transparent])),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(color: const Color(0xFF353534).withOpacity(0.4), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withOpacity(0.1))),
              child: const Icon(Icons.chat, color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () => context.push('/maintenance/request'),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 30)],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('طلب صيانة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      SizedBox(width: 12),
                      Icon(Icons.engineering, color: Colors.white),
                    ],
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
