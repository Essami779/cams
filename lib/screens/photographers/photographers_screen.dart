import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class PhotographersScreen extends StatelessWidget {
  const PhotographersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildLensFlares(),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 24, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 32),
                _buildPhotographersGrid(context),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(
          currentIndex: 1), // Using index 1 for crew/photographers
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppTheme.surfaceLowest,
      elevation: 0,
      titleSpacing: 24,
      leading: null,
      automaticallyImplyLeading: false,
      title: const Row(
        children: [
          Icon(Icons.camera_alt, color: AppTheme.primaryContainer),
          SizedBox(width: 8),
          Text(
            'CAMS',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: AppTheme.primaryContainer,
              letterSpacing: 4.0,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        Container(
          margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppTheme.surfaceHigh,
            borderRadius: BorderRadius.circular(8),
            border:
                Border.all(color: AppTheme.outlineVariant.withOpacity(0.15)),
          ),
          child: const Row(
            children: [
              Icon(Icons.tune, color: AppTheme.primaryContainer, size: 16),
              SizedBox(width: 4),
              Text('FILTER',
                  style: TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLensFlares() {
    return Positioned(
      top: -40,
      right: -40,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppTheme.primaryContainer.withOpacity(0.1),
              Colors.transparent
            ],
            stops: const [0.0, 0.7],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'المصورين',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Colors.white,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 8),
        Container(
            width: 48,
            height: 4,
            decoration: BoxDecoration(
                color: AppTheme.primaryContainer,
                borderRadius: BorderRadius.circular(2))),
      ],
    );
  }

  Widget _buildPhotographersGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 0.58,
      children: [
        _buildPhotographerCard(
          context: context,
          name: 'أحمد العمري',
          desc: 'متخصص في تصوير الطبيعة والتوثيق السينمائي للمناظر الجبلية.',
          location: ' صنعاء ',
          imageUrl: 'assets/images/ai_photographer.jpg',
          tags: ['DRONE', 'CANON 90D'],
        ),
        _buildPhotographerCard(
          context: context,
          name: 'سارة خالد',
          desc: 'خبيرة في تصوير البورتريه والموضة بأسلوب عصري وألوان حيوية.',
          location: ' صنعاء ',
          imageUrl: 'assets/images/photographer_mohammad_2.png',
          tags: ['SONY A7R IV', 'PRIME LENS'],
        ),
        _buildPhotographerCard(
          context: context,
          name: 'محمد خالد ',
          desc: 'مصور حياة الشارع والتوثيق المعماري للمدن الحديثة والقديمة.',
          location: ' صنعاء ',
          imageUrl: 'assets/images/photographer_mohammad_3.jpg',
          tags: ['LEICA Q2', '35MM'],
        ),
        _buildPhotographerCard(
          context: context,
          name: 'منصور العبدالله',
          desc: 'مصور رياضي متخصص في الفعاليات السريعة وسباقات الهجن.',
          location: ' صنعاء ',
          imageUrl: 'assets/images/photographer_mansour.png',
          tags: ['NIKON Z9', '400MM LENS'],
        ),
      ],
    );
  }

  Widget _buildPhotographerCard({
    required BuildContext context,
    required String name,
    required String desc,
    required String location,
    required String imageUrl,
    required List<String> tags,
  }) {
    return GestureDetector(
      onTap: () => context.push('/crew/1', extra: {
        'name': name,
        'location': location,
        'imageUrl': imageUrl,
      }),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryContainer.withOpacity(0.05),
              blurRadius: 20,
              spreadRadius: -5,
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(imageUrl, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.surfaceLow, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppTheme.surfaceLowest.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.search,
                          color: AppTheme.primaryContainer, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(name,
                        style: const TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(desc,
                        style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.onSurfaceVariant,
                            height: 1.4),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 12, color: AppTheme.primary),
                        const SizedBox(width: 4),
                        Expanded(
                            child: Text(location,
                                style: const TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primary,
                                    letterSpacing: 1.0),
                                overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: tags
                          .map((t) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                    color: AppTheme.surfaceHighest,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(t,
                                    style: const TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ))
                          .toList(),
                    ),
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
