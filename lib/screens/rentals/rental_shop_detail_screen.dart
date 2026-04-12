import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../core/dummy_data.dart';
import '../../widgets/custom_bottom_nav.dart';

class RentalShopDetailScreen extends StatelessWidget {
  final String id;
  const RentalShopDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final shop = DummyData.rentalShops.firstWhere(
      (s) => s['id'] == id,
      orElse: () => DummyData.rentalShops.first,
    );

    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context, shop),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 100, bottom: 100),
        child: Column(
          children: [
            _buildHeroSection(shop),
            const SizedBox(height: 48),
            _buildCategoryBento(context),
            const SizedBox(height: 48),
            _buildFeaturedSection(context),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1), // Index 1 for rentals
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, Map<String, dynamic> shop) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest.withOpacity(0.7),
      flexibleSpace: ClipRect(
        child: Container(
             decoration: const BoxDecoration(color: Colors.transparent),
        ),
      ),
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(color: AppTheme.surfaceHigh, shape: BoxShape.circle),
          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(shop['name'], style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),
      actions: [
        const Icon(Icons.share, color: Colors.white, size: 20),
        const SizedBox(width: 12),
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.2))),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/photographer_mohammad_1.jpg', fit: BoxFit.cover),
        )
      ],
    );
  }

  Widget _buildHeroSection(Map<String, dynamic> shop) {
    return Container(
      height: 256,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20)],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(shop['image'], fit: BoxFit.cover, color: Colors.blueGrey.withOpacity(0.6), colorBlendMode: BlendMode.modulate),
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.surfaceLowest.withOpacity(0.9), Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3))),
                        child: Container(
                          decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.camera_enhance, color: AppTheme.primaryContainer, size: 36),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(child: Text(shop['name'], style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white, fontStyle: FontStyle.italic), overflow: TextOverflow.ellipsis)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
                                  child: const Text('VERIFIED', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                                )
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: AppTheme.onSurfaceVariant, size: 12),
                                const SizedBox(width: 4),
                                Expanded(child: Text(shop['location'], style: const TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant), overflow: TextOverflow.ellipsis)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('${shop['rating']}', style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, color: AppTheme.primaryContainer)),
                        const Text('RATING', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 32,
                      color: AppTheme.outlineVariant.withOpacity(0.3),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                     Column(
                      children: const [
                        Text('1.2k', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                        Text('RENTALS', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryBento(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('تصفح الأقسام', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
            Expanded(child: Container(height: 1, color: AppTheme.outlineVariant.withOpacity(0.2), margin: const EdgeInsets.symmetric(horizontal: 16))),
            const Icon(Icons.filter_list, color: AppTheme.primaryContainer, size: 16),
          ],
        ),
        const SizedBox(height: 24),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
          children: [
            _buildCategoryCard(context, icon: Icons.camera_alt, title: 'كاميرات', count: '42 وحدة متوفرة', index: '01'),
            _buildCategoryCard(context, icon: Icons.flash_on, title: 'إضاءة', count: '18 طقماً جاهزاً', index: '02'),
            _buildCategoryCard(
              context, 
              icon: _buildDroneIcon(), 
              title: 'درونات', 
              count: '6 وحدات في المخزون', 
              index: '03'
            ),
            _buildCategoryCard(context, icon: Icons.backpack, title: 'إكسسوارات', count: '85 قطعة متوفرة', index: '04'),
            _buildCategoryCard(context, icon: Icons.vibration, title: 'حوامل', count: '12 حاملاً جاهزاً', index: '05'),
          ],
        )
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context, {required dynamic icon, required String title, required String count, required String index}) {
    return GestureDetector(
      onTap: () => context.push('/rentals/products', extra: {'category': title, 'shopName': 'عدسة صنعاء'}), // Passing shop name and category
      child: Container(
         decoration: BoxDecoration(
           color: AppTheme.surfaceLow,
           borderRadius: BorderRadius.circular(16),
           border: Border.all(color: Colors.transparent), // hover will add border in true web but here we assume tapping
         ),
         padding: const EdgeInsets.all(16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   if (icon is IconData)
                    Icon(icon, color: AppTheme.primaryContainer, size: 32)
                   else
                    icon as Widget,
                  Text(index, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, color: AppTheme.onSurfaceVariant)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(count, style: const TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                ],
              )
           ],
         ),
      ),
    );
  }

  Widget _buildFeaturedSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('الأكثر طلباً', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, fontStyle: FontStyle.italic, color: Colors.white)),
            Row(
              children: [
                const Text('عرض الكل', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primaryContainer)),
                const SizedBox(width: 4),
                const Icon(Icons.north_east, color: AppTheme.primaryContainer, size: 16),
              ],
            )
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLowest,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/images/sony_camera.jpg', fit: BoxFit.cover),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(child: Text('سلسلة سوني الاحترافية', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primaryContainer, letterSpacing: 1.0), overflow: TextOverflow.ellipsis)),
                         Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: const [
                              Icon(Icons.star, color: AppTheme.primaryContainer, size: 12),
                              SizedBox(width: 2),
                              Text('5.0', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('كاميرا سوني Alpha a7R IV بدون مرآة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, height: 1.2)),
                    const SizedBox(height: 8),
                    const Text('أعلى كاميرا بدون مرآة دقة في سلسلة ألفا، مثالية للتصوير السينمائي.', style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 16),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('السعر اليومي', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.0)),
                              Text('450 ريال / يوم', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 13, color: AppTheme.primaryContainer)),
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryContainer,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                          ),
                          icon: const Text('احجز الآن', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          label: const Icon(Icons.calendar_today, color: Colors.white, size: 14),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDroneIcon() {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.toys, color: AppTheme.primaryContainer, size: 32),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppTheme.surfaceLow,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.videocam, color: AppTheme.primaryContainer, size: 12),
          ),
        ],
      ),
    );
  }
}
