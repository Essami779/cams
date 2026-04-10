import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class RentalProductsScreen extends StatelessWidget {
  const RentalProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 100),
        child: Column(
          children: [
            _buildEditorialHeader(),
            const SizedBox(height: 32),
            _buildFilters(),
            const SizedBox(height: 32),
            _buildProductGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 1), // Index 1 for rentals
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest.withOpacity(0.9),
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppTheme.primaryContainer),
        onPressed: () {},
      ),
      title: const Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: AppTheme.primaryContainer, fontStyle: FontStyle.italic)),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Text('متجر العم خالد / الكاميرات', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.onSurfaceVariant)),
                const SizedBox(width: 12),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuA7XkrTdvCw-WVUmHtCLIP87WNj7qUH-AvN_5gDGHRAv3ILUzdpd4B7UFy_6Ug3DUDMrSAWjewR7WsV4yrS4l_OK1YEMdyNE08vbk5N1_M-Of9zISz9GZCNOJ-TaBEDI5S2rRbTuCneOu_jpgH-9SkePWVHN5NPvn-fOGpjoo-SNl-Ht8rK_5lwRPQx4pScIOpAlgo8ObOTvia_MRprCPgt-xmRDGOMfPZ7cM7Ebbia3teaQ-2Y867-M7KJE3kSOZ4mbJPcA6xq9VQ', fit: BoxFit.cover),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEditorialHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('مجموعة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, color: Colors.white, height: 1.1)),
              Text('الكاميرات', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, color: AppTheme.primaryContainer, height: 1.1)),
              SizedBox(height: 8),
              Text('إرث من الضوء والعدسات. اختر الأداة التي تليق برؤيتك الإبداعية من تشكيلتنا المختارة.', style: TextStyle(fontSize: 12, color: AppTheme.onSurfaceVariant, height: 1.5)),
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

  Widget _buildFilters() {
    final filters = ['كل المعدات', 'دي إس إل آر', 'بدون مرآة', 'كلاسيكي'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          final isActive = f == 'كل المعدات';
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

  Widget _buildProductGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // Stacking them like cards on mobile to match the design width-wise, or grid on desktop. Let's make it 1 per row for mobile.
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 24,
      childAspectRatio: 0.9,
      children: [
        _buildProductCard(
          context: context,
          title: 'Canon 90D',
          desc: 'كاميرا قوية تجمع بين السرعة والدقة، مثالية لتصوير الحياة البرية والرياضة بجودة 4K.',
          statusText: 'متاح',
          statusColor: AppTheme.primaryContainer,
          spec1Label: 'SENSOR',
          spec1Value: 'APS-C',
          spec2Label: 'RES',
          spec2Value: '32.5MP',
          imageUrl: 'https://lh3.googleusercontent.com/aida/ADBb0uhdlWLaxBWbwtUPGO8iud7t5aIL1ZW9CvJARHmzFzvkoHNJe4ca1C_1BlUbNFrI9r6wGmb_Ub3HqSwoky5eNJES2kJ6iFLhevmdSFRaVI-I3TLoAppAUS_rgng4lwdDy7YfIUnfc6FHue73x5K24YgHEEx0tGPkLDGeymCFsekuzV_-2Zm8S1mhpqQOu6M-IKSEMobD0dul8dcvB8MUogqzLVampoCknP02p-Y1z8PVV-HowROROn8R2VgtPimN_3iI_uvHbkJH',
          isActive: true,
        ),
        _buildProductCard(
          context: context,
          title: 'Sony A7III',
          desc: 'الخيار الأول لصناع المحتوى والسينمائيين بفضل الأداء العالي في الإضاءة المنخفضة.',
          statusText: 'محجوز',
          statusColor: Colors.blueGrey,
          spec1Label: 'SENSOR',
          spec1Value: 'FULL FRAME',
          spec2Label: 'ISO',
          spec2Value: '51200',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA3I1u7jcuK9DX6SU9QRVepoqsxmOwssGk37hKBNYLqGHjf4juWpCRVIUlkxC5Cxp3OFJh6IUPIMh8vZ8llJ9wrs5FDLf_Bl0EhiE-Tk9FRULiqU5pzaaIVd3n_A1YQ9Ilj-Ne7FxPH12qSyGpl849kWkFMQBdChfXIYRUJN-sNYsy-ZEZRdjfTFGymMgkRpZx2wkxPBnTYaPND1YHprKC3naY718Z-gy49OZCQ-2_WDVFdpXWUTalCHsNCKuhaN17PdsjTPWIEY_Q',
          isActive: false,
        ),
        _buildProductCard(
          context: context,
          title: 'Nikon Z6 II',
          desc: 'توازن مثالي بين التصوير الفوتوغرافي والفيديو بفضل معالج مزدوج ونظام تركيز دقيق.',
          statusText: 'تحت الصيانة',
          statusColor: const Color(0xFFffb4ab),
          spec1Label: 'FPS',
          spec1Value: '14 FPS',
          spec2Label: 'AF',
          spec2Value: 'EYE-DETECTION',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8',
          isActive: false,
          isMaintenance: true,
        ),
        _buildProductCard(
           context: context,
          title: 'Fujifilm X-T4',
          desc: 'تجربة كلاسيكية مع تكنولوجيا حديثة. ألوان فنية ومثبت صورة داخلي متطور.',
          statusText: 'متاح',
          statusColor: AppTheme.primaryContainer,
          spec1Label: 'FILM',
          spec1Value: 'SIMULATION',
          spec2Label: 'IBIS',
          spec2Value: '6.5 STOPS',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDktcmORHDPSHGXMHQ2GGavJmdB46sYpiLnzQVh6AtoHghYMtO5icQH0M80oQ1JgsqeMpKty7vI2D-BuwL9RQoZNSWabxV_ak2JgiuzrG0WytzDQP5Esi-2wUxQEbFxGq0wx_mgKvvWcoXQeKV85aBTdRBXJ7sP_3qnEyOgcvSPT9oADOkDc_gcYyRcf-1QF-3V0PMR-kxHEd4j4zgKw-hM-9fhjsTjoqJA2iJwnz205Ny4NYpai1wrH-q20E3P3Ifysijz-z501Vw',
          isActive: true,
        ),
      ],
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
