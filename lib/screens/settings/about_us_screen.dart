import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHero(context),
            _buildVisionMission(),
            _buildServices(),
            _buildWhyUs(),
            _buildClosing(),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest.withOpacity(0.8),
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppTheme.onSurface),
        onPressed: () => context.pop(),
      ),
       title: const Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: AppTheme.primaryContainer, letterSpacing: 1.0)),
      actions: [
         IconButton(
           icon: const Icon(Icons.info_outline, color: AppTheme.onSurfaceVariant),
           onPressed: () {},
         )
      ],
    );
  }

  Widget _buildHero(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
           Image.asset("assets/images/rental_shop_1.jpg",
             fit: BoxFit.cover,
             opacity: const AlwaysStoppedAnimation(0.4)
           ),
           Container(
             decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, AppTheme.surfaceLowest],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
             )
           ),
           SafeArea(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                         style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 40, color: Colors.white, height: 1.2),
                         children: [
                           TextSpan(text: 'خلف كل لقطة عظيمة.. '),
                           TextSpan(text: 'قصة', style: TextStyle(color: AppTheme.primaryContainer)),
                         ]
                      )
                    ),
                    const SizedBox(height: 24),
                    const Text(
                       'ونحن هنا لنكون جزءاً من قصتك القادمة. إبداعك يستحق احترافية تليق به.',
                       textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 16, color: AppTheme.onSurfaceVariant, height: 1.5, fontWeight: FontWeight.w300)
                    ),
                    const SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.3), blurRadius: 20)],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 20)),
                        child: const Text('ابدأ رحلتك', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, letterSpacing: 2.0)),
                      ),
                    )
                 ],
               ),
             ),
           )
        ],
      ),
    );
  }

  Widget _buildVisionMission() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Transform.translate(
        offset: const Offset(0, -40),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.surfaceLow,
                borderRadius: BorderRadius.circular(24),
                border: const Border(left: BorderSide(color: AppTheme.primaryContainer, width: 4)),
                boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 30)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.visibility, color: AppTheme.primaryContainer, size: 40),
                  SizedBox(height: 24),
                  Text('نحو مجتمع فوتوغرافي متكامل بلا حدود', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white, height: 1.3)),
                  SizedBox(height: 16),
                  Text('رؤية CAMS تتجاوز مجرد توفير المعدات؛ نحن نسعى لنكون الوجهة الرقمية الأولى التي تجمع المبدعين في بيئة احترافية تضمن لهم النمو والاستدامة، حيث تلتقي التكنولوجيا بالفن لخلق مستقبل بصري مذهل.', style: TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.8)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppTheme.surfaceHigh,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 30)],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.05), shape: BoxShape.circle),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.auto_awesome, color: AppTheme.primaryContainer, size: 40),
                      SizedBox(height: 24),
                      Text('تمكين الإبداع من خلال التكنولوجيا', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white, height: 1.3)),
                      SizedBox(height: 16),
                      Text('مهمتنا هي تذليل كافة العقبات التقنية واللوجستية أمام المصورين. من خلال حلولنا الذكية القائمة على الشفافية المطلقة، نمكنك من التركيز على ما تجيده حقاً: التقاط اللحظة.', style: TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.8)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServices() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
      child: Column(
        children: [
          const Text('ماذا نقدم؟', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, color: Colors.white)),
          const SizedBox(height: 8),
          Container(width: 80, height: 4, decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 48),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
             mainAxisSpacing: 32,
             crossAxisSpacing: 16,
             childAspectRatio: 0.9,
             children: [
               _buildServiceCard(Icons.smart_toy, 'تأجير ذكي', 'أحدث المعدات بلمسة زر'),
               _buildServiceCard(Icons.storefront, 'سوق مفتوح', 'بيع وشراء بكل ثقة'),
               _buildServiceCard(Icons.home_repair_service, 'عيادة صيانة', 'رعاية فائقة لمعداتك'),
               _buildServiceCard(Icons.groups, 'منصة للمواهب', 'مجتمع ينمو بإبداعك'),
             ],
          )
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String subtitle) {
     return Column(
       children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(color: AppTheme.surfaceHigh, shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.1))),
            child: Icon(icon, color: AppTheme.primaryContainer, size: 40),
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant.withOpacity(0.7))),
       ],
     );
  }

  Widget _buildWhyUs() {
    return Container(
      width: double.infinity,
      color: AppTheme.surfaceLow,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text('لماذا نحن مختلفون؟', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, color: Colors.white)),
           const SizedBox(height: 40),
           _buildWhyItem('الدقة التقنية', 'نستخدم أحدث الخوارزميات لضمان جودة المعدات وتطابق المواصفات.'),
           const SizedBox(height: 24),
           _buildWhyItem('الشمولية', 'نظام بيئي متكامل يغطي كافة احتياجات المصور من الألف إلى الياء.'),
           const SizedBox(height: 24),
           _buildWhyItem('الثقة والأمان', 'حماية كاملة للمعاملات المالية وحقوق جميع الأطراف في المجتمع.'),
           const SizedBox(height: 48),
           Container(
             height: 250,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 20)]),
             clipBehavior: Clip.antiAlias,
             child: Image.asset("assets/images/photographer_work_1.jpg", 
               fit: BoxFit.cover,
               width: double.infinity
             ),
           )
        ],
      ),
    );
  }

  Widget _buildWhyItem(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.2), shape: BoxShape.circle),
          child: Center(child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primaryContainer, shape: BoxShape.circle))),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
              const SizedBox(height: 8),
              Text(desc, style: const TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.5)),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildClosing() {
     return Padding(
       padding: const EdgeInsets.all(24.0),
       child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1B1B).withOpacity(0.6),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.1), blurRadius: 40)],
                  border: Border.all(color: Colors.white10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network("https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=1200&q=80", fit: BoxFit.cover),
              ),
              const SizedBox(height: 32),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white, height: 1.3),
                  children: [
                    TextSpan(text: 'المنصة الذكية العالمية (GSP):\n'),
                    TextSpan(text: 'هندسة الابتكار برؤية محلية', style: TextStyle(color: AppTheme.primaryContainer)),
                  ]
                ),
              ),
              const SizedBox(height: 24),
              const Text('تفتخر CAMS بكونها مدعومة تقنياً من قبل "المنصة الذكية العالمية" (GSP)، حيث يتم تطوير المحركات الذكية وخوارزميات إدارة الموارد التي تضمن لك تجربة سلسة، آمنة، وفائقة السرعة. نحن ندمج الخبرات العالمية مع الاحتياجات المحلية لنصنع فارقاً حقيقياً.', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.8)),
            ],
          ),
       ),
     );
  }
}
