import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class RentalProductsScreen extends StatelessWidget {
  final String category;
  final String shopName;

  const RentalProductsScreen({
    super.key, 
    this.category = 'الكاميرات',
    this.shopName = 'عدسة صنعاء',
  });

  @override
  Widget build(BuildContext context) {
    final categoryData = _getCategoryData(category);

    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 100),
        child: Column(
          children: [
            _buildEditorialHeader(categoryData),
            const SizedBox(height: 32),
            _buildFilters(categoryData['filters'] as List<String>),
            const SizedBox(height: 32),
            _buildProductGrid(context, categoryData['products'] as List<Map<String, dynamic>>),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
    );
  }

  Map<String, dynamic> _getCategoryData(String category) {
    switch (category) {
      case 'إضاءة':
        return {
          'title': 'حلول الإضاءة',
          'desc': 'فن تشكيل الظل والضوء. معدات احترافية تمنح قصتك البعد السينمائي المطلوب.',
          'filters': ['كل المعدات', 'LED', 'Frensel', 'RGB'],
          'products': [
            {
              'title': 'Aputure 600d Pro',
              'desc': 'أقوى وحدة إضاءة LED بضوء النهار، مع مقاومة للطقس وتحكم لاسلكي متطور.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'POWER',
              'spec1Value': '600W',
              'spec2Label': 'CRI',
              'spec2Value': '96+',
              'imageUrl': 'assets/images/ring_light_store.jpg',
              'isActive': true,
            },
            {
              'title': 'Godox VL300',
              'desc': 'إضاءة صامتة وخفيفة الوزن، مثالية لتصوير المقابلات والفيديو الاحترافي.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'TEMP',
              'spec1Value': '5600K',
              'spec2Label': 'TLCI',
              'spec2Value': '95',
              'imageUrl': 'assets/images/lens_mobile_3.jpg',
              'isActive': true,
            },
          ],
        };
      case 'درونات':
        return {
          'title': 'أسطول الدرونات',
          'desc': 'رؤية شاملة من آفاق جديدة. صور للقطاتك الجوية بأحدث تكنولوجيا الطيران.',
          'filters': ['كل الدرونات', 'Consumer', 'Enterprise', 'FPV'],
          'products': [
            {
              'title': 'DJI Mavic 3 Pro',
              'desc': 'ثلاث كاميرات قوية في طائرة واحدة، مع وقت طيران طويل وجودة 5.1K Apple ProRes.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'TIME',
              'spec1Value': '43 MIN',
              'spec2Label': 'RANGE',
              'spec2Value': '15 KM',
              'imageUrl': 'assets/images/lens_mobile_1.jpg',
              'isActive': true,
            },
            {
              'title': 'DJI Avata',
              'desc': 'تجربة طيران غامرة (FPV) تتيح لك الطيران في الأماكن الضيقة بمرونة لا تضاهى.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'WEIGHT',
              'spec1Value': '410G',
              'spec2Label': 'FO V',
              'spec2Value': '155°',
              'imageUrl': 'assets/images/photographer_work_1.jpg',
              'isActive': true,
            },
          ],
        };
       case 'إكسسوارات':
        return {
          'title': 'إكسسوارات',
          'desc': 'التفاصيل التي تصنع الفرق. مجموعة مختارة من الملحقات الضرورية لكل مصور محترف.',
          'filters': ['الكل', 'ذواكر', 'فلاتر', 'حقائب'],
          'products': [
            {
              'title': 'ProGrade Digital',
              'desc': 'بطاقات ذاكرة عالية السرعة مصممة للتعامل مع أعلى معدلات البيانات والحرارة.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'CAP',
              'spec1Value': '512GB',
              'spec2Label': 'SPEED',
              'spec2Value': 'V90',
              'imageUrl': 'assets/images/wireless_mic_store.jpg',
              'isActive': true,
            },
          ],
        };
       case 'حوامل':
        return {
          'title': 'أنظمة التثبيت',
          'desc': 'أساس الثبات في كل لقطة. من ترايبود الفيديو الثقيل إلى الجيمبال السلس.',
          'filters': ['الكل', 'ترايبود', 'جيمبال', 'سلايدر'],
          'products': [
            {
              'title': 'DJI Ronin RS3 Pro',
              'desc': 'مثبت كاميرا ذكي مع تكنولوجيا LiDAR للتركيز التلقائي وقدرة حمل عالية.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'LOAD',
              'spec1Value': '4.5KG',
              'spec2Label': 'BATTERY',
              'spec2Value': '12H',
              'imageUrl': 'assets/images/gimbal_x300_store.jpg',
              'isActive': true,
            },
          ],
        };
      default: // الكاميرات
        return {
          'title': 'مجموعة الكاميرات',
          'desc': 'إرث من الضوء والعدسات. اختر الأداة التي تليق برؤيتك الإبداعية من تشكيلتنا المختارة.',
          'filters': ['كل المعدات', 'DSLR', 'Mirrorless', 'Cinema'],
          'products': [
            {
              'title': 'Canon 90D',
              'desc': 'كاميرا قوية تجمع بين السرعة والدقة، مثالية لتصوير الحياة البرية والرياضة بجودة 4K.',
              'statusText': 'متاح',
              'statusColor': AppTheme.primaryContainer,
              'spec1Label': 'SENSOR',
              'spec1Value': 'APS-C',
              'spec2Label': 'RES',
              'spec2Value': '32.5MP',
              'imageUrl': 'assets/images/sony_camera.jpg',
              'isActive': true,
            },
            {
              'title': 'Sony A7III',
              'desc': 'الخيار الأول لصناع المحتوى والسينمائيين بفضل الأداء العالي في الإضاءة المنخفضة.',
              'statusText': 'محجوز',
              'statusColor': Colors.blueGrey,
              'spec1Label': 'SENSOR',
              'spec1Value': 'FULL FRAME',
              'spec2Label': 'ISO',
              'spec2Value': '51200',
              'imageUrl': 'assets/images/8k_cinema_camera.png',
              'isActive': false,
            },
          ],
        };
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest.withOpacity(0.9),
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer),
        onPressed: () => context.pop(),
      ),
      title: const Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: AppTheme.primaryContainer, fontStyle: FontStyle.italic)),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Text('متجر $shopName / $category', style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant)),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/images/photographer_mohammad_1.jpg', fit: BoxFit.cover),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEditorialHeader(Map<String, dynamic> data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('مجموعة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white, height: 1.1)),
              Text(category, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, color: AppTheme.primaryContainer, height: 1.1)),
              const SizedBox(height: 8),
              Text(data['desc'], style: const TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant, height: 1.5)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
             Text('تأسس عام 2024', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant)),
             SizedBox(height: 8),
             Text('دقة الغالق', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant)),
          ],
        )
      ],
    );
  }

  Widget _buildFilters(List<String> filters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final isActive = f == (filters.isNotEmpty ? filters[0] : '');
          return Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? AppTheme.primaryContainer : AppTheme.surfaceHigh,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              f,
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: isActive ? Colors.white : AppTheme.onSurfaceVariant,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, List<Map<String, dynamic>> products) {
    return GridView.count(
      crossAxisCount: 1, 
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 24,
      childAspectRatio: 0.9,
      children: products.map((p) => _buildProductCard(
        context: context,
        title: p['title'],
        desc: p['desc'],
        statusText: p['statusText'],
        statusColor: p['statusColor'],
        spec1Label: p['spec1Label'],
        spec1Value: p['spec1Value'],
        spec2Label: p['spec2Label'],
        spec2Value: p['spec2Value'],
        imageUrl: p['imageUrl'],
        isActive: p['isActive'],
      )).toList(),
    );
  }

  Widget _buildProductCard({
    required BuildContext context,
    required String title,
    required String desc,
    required String statusText,
    required Color statusColor,
    required String spec1Label,
    required String spec1Value,
    required String spec2Label,
    required String spec2Value,
    required String imageUrl,
    required bool isActive,
    bool isMaintenance = false,
  }) {
    return GestureDetector(
      onTap: isActive ? () => context.push('/rentals/product/1') : null,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(colors: [Color.fromRGBO(255, 92, 0, 0.15), Colors.transparent], radius: 0.7),
                    ),
                    child: ColorFiltered(
                       colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(isActive ? 0.0 : 0.6),
                        BlendMode.saturation,
                      ),
                      child: Image.asset(imageUrl, fit: BoxFit.contain),
                    ),
                  ),
                  if (!isActive && !isMaintenance)
                    Container(color: Colors.black.withOpacity(0.4)),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, letterSpacing: 1.0)),
                              const SizedBox(height: 8),
                              Text(desc, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant), maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), border: Border.all(color: statusColor.withOpacity(0.2)), borderRadius: BorderRadius.circular(4)),
                          child: Text(statusText, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: statusColor, letterSpacing: 1.0)),
                        )
                      ],
                    ),
                    const Divider(color: Colors.white12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(spec1Label, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant.withOpacity(0.6))),
                                Text(spec1Value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                              ],
                            ),
                            const SizedBox(width: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(spec2Label, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.onSurfaceVariant.withOpacity(0.6))),
                                Text(spec2Value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isActive ? Colors.white : Colors.transparent,
                            border: isActive ? null : Border.all(color: AppTheme.outlineVariant.withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text('التفاصيل', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: isActive ? AppTheme.surfaceLowest : AppTheme.onSurfaceVariant.withOpacity(0.4))),
                              const SizedBox(width: 4),
                              Icon(Icons.search, size: 12, color: isActive ? AppTheme.surfaceLowest : AppTheme.onSurfaceVariant.withOpacity(0.4)),
                            ],
                          ),
                        )
                      ],
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
