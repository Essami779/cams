import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 48, bottom: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 48),
            _buildComplaintForm(),
            const SizedBox(height: 48),
            _buildFAQSection(),
            const SizedBox(height: 48),
            _buildActivityFeed(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3), // Or whatever fits Support/Profile
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
       leading: const SizedBox.shrink(),
       leadingWidth: 0,
       centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer),
                onPressed: () => context.pop(),
              ),
              const Text('خدمة العملاء', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.primaryContainer)),
            ],
          ),
          const Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, color: AppTheme.primaryContainer, letterSpacing: -1.0)),
        ],
      )
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SUPPORT PORTAL', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.primary, letterSpacing: 4.0)),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 40, color: Colors.white, height: 1.2),
            children: [
              TextSpan(text: 'كيف يمكننا\n'),
              TextSpan(text: 'مساعدتك', style: TextStyle(color: AppTheme.primaryContainer)),
              TextSpan(text: ' اليوم؟'),
            ]
          )
        )
      ],
    );
  }

  Widget _buildComplaintForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 32, height: 4, decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            const Text('تقديم شكوى جديدة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLow,
            borderRadius: BorderRadius.circular(16),
            border: const Border(left: BorderSide(color: Color.fromRGBO(255, 92, 0, 0.2), width: 2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Expanded(child: _buildDropdownField('نوع المشكلة', 'المصورين')),
                   const SizedBox(width: 16),
                   Expanded(child: _buildTextField('اسم الشخص أو الجهة', 'أدخل الاسم هنا...')),
                ],
              ),
              const SizedBox(height: 24),
              _buildTextArea('وصف المشكلة', 'يرجى كتابة تفاصيل المشكلة بدقة...'),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Text('إرسال الشكوى', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                    label: const Icon(Icons.send, color: Colors.white, size: 16),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
              const Icon(Icons.expand_more, color: AppTheme.primaryContainer, size: 16),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
           decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
          child: Text(hint, style: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.5), fontSize: 12)),
        )
      ],
    );
  }

  Widget _buildTextArea(String label, String hint) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant)),
        const SizedBox(height: 8),
        Container(
          height: 120,
           decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
          child: Stack(
            children: [
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Text(hint, style: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.5), fontSize: 12)),
               ),
               Positioned(
                 bottom: 12,
                 left: 12,
                 child: Container(
                   width: 40,
                   height: 40,
                   decoration: BoxDecoration(color: AppTheme.surfaceLowest.withOpacity(0.5), shape: BoxShape.circle),
                   child: const Icon(Icons.mic, color: AppTheme.primaryContainer, size: 20),
                 )
               )
            ],
          )
        )
      ],
    );
  }

  Widget _buildFAQSection() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(width: 32, height: 4, decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(2))),
            const SizedBox(width: 8),
            const Text('الأسئلة الشائعة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
          ],
        ),
        const SizedBox(height: 24),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 2.5,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildFAQCard(Icons.construction, 'كيف أتابع حالة الصيانة؟', 'يمكنك متابعة حالة معداتك من خلال قسم "معداتي" في القائمة الرئيسية.'),
            _buildFAQCard(Icons.payments, 'ما هي طرق الدفع المتاحة؟', 'ندعم مدى، فيزا، ماستركارد، وأبل باي لجميع العمليات.'),
            _buildFAQCard(Icons.camera, 'كيف أستأجر كاميرا من التطبيق؟', 'اختر الكاميرا المفضلة، حدد الأيام، وقم بتأكيد الهوية عبر نفاذ.'),
            _buildFAQCard(Icons.assignment_return, 'سياسة الاسترجاع للمستعمل؟', 'نوفر ضمان فحص لمدة 48 ساعة على جميع المعدات المستعملة.'),
          ],
        )
      ],
    );
  }

  Widget _buildFAQCard(IconData icon, String question, String answer) {
    return Container(
      padding: const EdgeInsets.all(16),
       decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(12)),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Icon(icon, color: AppTheme.primaryContainer, size: 20),
           const SizedBox(width: 12),
           Expanded(
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Text(question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(answer, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
               ],
             ),
           )
         ],
       ),
    );
  }

  Widget _buildActivityFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(width: 32, height: 4, decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(2))),
                const SizedBox(width: 8),
                const Text('آخر النشاطات', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              ],
            ),
             const Text('LATEST UPDATES', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              _buildActivityItem(icon: Icons.send, iconColor: AppTheme.primaryContainer, title: 'تم إرسال شكواك بخصوص المصور (محمد علي) - بانتظار الرد', time: 'منذ ساعتين', showDot: true),
              const Divider(color: Colors.white10, height: 1),
              _buildActivityItem(icon: Icons.check_circle, iconColor: Colors.green, title: 'تم الرد على شكواك بخصوص محل التأجير (العم خالد): تم حل المشكلة', time: 'أمس'),
              const Divider(color: Colors.white10, height: 1),
              _buildActivityItem(icon: Icons.hourglass_top, iconColor: Colors.amber, title: 'شكواك بخصوص تطبيق CAMS ما زالت قيد المراجعة', time: 'منذ يومين'),
              const Divider(color: Colors.white10, height: 1),
              _buildActivityItem(icon: Icons.block, iconColor: AppTheme.onSurfaceVariant, title: 'تم غلق شكواك بخصوص متجر المعدات لعدم وجود رد', time: 'منذ أسبوع', opacity: 0.6),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildActivityItem({
     required IconData icon,
     required Color iconColor,
     required String title,
     required String time,
     bool showDot = false,
     double opacity = 1.0,
  }) {
    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: iconColor.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.white, height: 1.4)),
                  const SizedBox(height: 4),
                  Text(time, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant)),
                ],
              ),
            ),
            if (showDot)
               Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primaryContainer, shape: BoxShape.circle)),
          ],
        ),
      ),
    );
  }
}
