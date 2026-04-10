import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class PhotographerDetailScreen extends StatelessWidget {
  final String id;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? desc;
  final List<Map<String, String>>? portfolio;

  const PhotographerDetailScreen({
    super.key,
    required this.id,
    this.name,
    this.location,
    this.imageUrl,
    this.desc,
    this.portfolio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest, // Using background mapping
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildProfileHero(),
                const SizedBox(height: 48),
                _buildToolsAndCoverage(),
                const SizedBox(height: 48),
                _buildPortfolioGallery(context),
                const SizedBox(height: 48),
                _buildClientsSection(),
                const SizedBox(height: 48),
                _buildCalendarSection(),
              ],
            ),
          ),
          _buildFloatingAction(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      titleSpacing: 24,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => context.pop(),
      ),
      title: const Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white, letterSpacing: 2.0)),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppTheme.surfaceHighest.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(child: Text('FILTER', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primaryContainer))),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.camera_alt, color: AppTheme.primaryContainer),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _buildProfileHero() {
    final displayName = name ?? 'أحمد السينمائي';
    final displayLocation = location ?? 'صنعاء';
    final displayImage = imageUrl ?? 'assets/images/photographer_mohammad_1.jpg';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200, height: 200, decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.2), shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 100)])),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.2), width: 2),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(displayImage, fit: BoxFit.cover),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text('MASTER CINEMATOGRAPHER', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary, letterSpacing: 2.0)),
        const SizedBox(height: 8),
        Text(displayName, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 40, color: Colors.white, height: 1.1)),
        const SizedBox(height: 16),
        Text(desc ?? 'متخصص في التقاط اللحظات الهاربة وتحويلها إلى لوحات بصرية خالدة. خبرة 10 سنوات في التصوير السينمائي والبورتريه الدرامي.', textAlign: TextAlign.center, style: const TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 16, height: 1.6)),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: AppTheme.primary, size: 16),
                  const SizedBox(width: 8),
                  Text(displayLocation, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.star, color: AppTheme.primary, size: 16),
                  SizedBox(width: 8),
                  Text('4.9 (120)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToolsAndCoverage() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.camera_enhance, color: AppTheme.primaryContainer),
                  SizedBox(width: 12),
                  Text('Tools of the Trade | الأدوات', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildToolItem(Icons.photo_camera, 'Sony A7R IV'),
                  _buildToolItem(Icons.lens, '35mm f/1.4'),
                  _buildToolItem(Icons.wb_iridescent, 'Aputure 600d'),
                  _buildToolItem(Icons.fluorescent, 'Ronin RS3'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Coverage | التغطية', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
              const SizedBox(height: 24),
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.2), width: 1.5),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset('assets/images/sanaa_map.png', fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Column(
                      children: [
                        _buildMapControl(Icons.add),
                        const SizedBox(height: 8),
                        _buildMapControl(Icons.remove),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_searching, color: AppTheme.primary, size: 14),
                          SizedBox(width: 8),
                          Text('SANA\'A, YEMEN', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('متوفر للتغطية السينمائية في صنعاء وجميع محافظات الجمهورية', style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMapControl(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: AppTheme.surfaceLowest.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  Widget _buildToolItem(IconData icon, String name) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: AppTheme.onSurfaceVariant, size: 24),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }

  Widget _buildPortfolioGallery(BuildContext context) {
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
                const Text('VISUAL ANTHOLOGY', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 10, color: AppTheme.primary, letterSpacing: 2.0)),
                const SizedBox(height: 4),
                const Text('معرض الأعمال', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
              ],
            ),
            const Text('مشاهدة الكل', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary)),
          ],
        ),
        const SizedBox(height: 24),
        if (portfolio != null && portfolio!.isNotEmpty)
          Column(
            children: [
              // Show in 2-column grid for the first few, then full width
              if (portfolio!.length >= 2)
                Row(
                  children: [
                    Expanded(child: _buildGalleryItem(portfolio![0]['url']!, portfolio![0]['label']!, portfolio![0]['description'] ?? 'لا يوجد وصف متاح', 1.5, context)),
                    const SizedBox(width: 8),
                    Expanded(child: _buildGalleryItem(portfolio![1]['url']!, portfolio![1]['label']!, portfolio![1]['description'] ?? 'لا يوجد وصف متاح', 1.5, context)),
                  ],
                ),
              if (portfolio!.length == 1)
                _buildGalleryItem(portfolio![0]['url']!, portfolio![0]['label']!, portfolio![0]['description'] ?? 'لا يوجد وصف متاح', 1.0, context),
              
              ...List.generate(
                portfolio!.length > 2 ? portfolio!.length - 2 : 0,
                (index) {
                  final item = portfolio![index + 2];
                  return Column(
                    children: [
                      const SizedBox(height: 8),
                      _buildGalleryItem(item['url']!, item['label']!, item['description'] ?? 'لا يوجد وصف متاح', index % 2 == 0 ? 1.0 : 0.5, context),
                    ],
                  );
                },
              ),
            ],
          )
        else
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: _buildGalleryItem('assets/images/portfolio_wedding.png', 'تصوير أعراس فاخرة', 'وصف العمل غير متوفر حالياً', 1.5, context)),
                  const SizedBox(width: 8),
                  Expanded(child: _buildGalleryItem('assets/images/portfolio_street.png', 'حياة الشارع القديمة', 'وصف العمل غير متوفر حالياً', 1.5, context)),
                ],
              ),
              const SizedBox(height: 8),
              _buildGalleryItem('assets/images/portfolio_product.png', 'تصوير منتجات تجاري', 'وصف العمل غير متوفر حالياً', 1.0, context),
              const SizedBox(height: 8),
              _buildGalleryItem('assets/images/portfolio_nature.png', 'طبيعة خلابة من اليمن', 'وصف العمل غير متوفر حالياً', 0.5, context),
            ],
          ),
      ],
    );
  }

  Widget _buildGalleryItem(String url, String label, String description, double heightRatio, BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/portfolio_detail', extra: {
        'imageUrl': url,
        'title': label,
        'description': description,
      }),
      child: AspectRatio(
        aspectRatio: heightRatio == 1.5 ? 3 / 4 : (heightRatio == 1.0 ? 1 : 16 / 9),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: url,
                child: Image.asset(url, fit: BoxFit.cover),
              ),
              Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.black87, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.center))),
              Positioned(
                bottom: 16,
                left: 16,
                child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClientsSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: AppTheme.surfaceLowest, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          const Text('شركات عمل معها | TRUSTED BY', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant, letterSpacing: 2.0)),
          const SizedBox(height: 32),
          Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: const [
              Text('VOGUE', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.grey)),
              Text('CANON', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.grey)),
              Text('ADIDAS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('تقويم الحجز', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white)),
            Row(
              children: [
                _buildCalLegend(Colors.green, 'متاح'),
                const SizedBox(width: 12),
                _buildCalLegend(Colors.red, 'محجوز'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: AppTheme.surfaceHigh, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.chevron_right, color: AppTheme.onSurfaceVariant),
                  const Text('أكتوبر 2024', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  const Icon(Icons.chevron_left, color: AppTheme.onSurfaceVariant),
                ],
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.0,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(28, (index) {
                  // Simplified generation
                  bool isAvailable = index % 3 != 0;
                  return Container(
                    decoration: BoxDecoration(
                      color: isAvailable ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: isAvailable ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2)),
                    ),
                    child: Center(child: Text('${index + 1}', style: TextStyle(color: isAvailable ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 12))),
                  );
                }),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCalLegend(Color color, String label) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }

  Widget _buildFloatingAction(BuildContext context) {
    final displayName = name ?? 'أحمد السينمائي';
    final displayImage = imageUrl ?? 'assets/images/photographer_mohammad_1.jpg';

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [AppTheme.surfaceLowest, Colors.transparent])),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/chat_detail/$id', extra: {
                  'name': displayName,
                  'imageUrl': displayImage,
                  'isPublic': false,
                });
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(color: const Color(0xFF353534).withOpacity(0.4), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white.withOpacity(0.1))),
                child: const Icon(Icons.chat_bubble, color: Colors.white),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(child: Text('تم إرسال طلب الحجز إلى $displayName بنجاح!', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                        ],
                      ),
                      backgroundColor: Colors.green.shade600,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.3), blurRadius: 30)],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('طلب حجز', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1.0)),
                      SizedBox(width: 12),
                      Icon(Icons.event_available, color: Colors.white),
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
