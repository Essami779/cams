import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';
import '../../widgets/story_viewer.dart';

class PublicChannelScreen extends StatelessWidget {
  const PublicChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: const PublicChatView(),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF131313),
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppTheme.primaryContainer),
        onPressed: () {},
      ),
      title: const Text(
        'القناة العامة',
        style: TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: AppTheme.onSurface,
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.search, color: Colors.grey), onPressed: () {}),
        IconButton(icon: const Icon(Icons.add_circle, color: AppTheme.primaryContainer), onPressed: () {}),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 8.0),
          child: Center(
            child: Text(
              'CAMS',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w900,
                fontSize: 24,
                color: AppTheme.primaryContainer,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PublicChatView extends StatelessWidget {
  const PublicChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildFilterTabs(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 100),
              children: [
                _buildStoriesSection(context),
                const SizedBox(height: 24),
                _buildFeedSection(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  Widget _buildFilterTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
      child: Row(
        children: [
          _buildFilterTab('الكل', isActive: true),
          const SizedBox(width: 12),
          _buildFilterTab('إعلانات'),
          const SizedBox(width: 12),
          _buildFilterTab('أعمال المصورين'),
          const SizedBox(width: 12),
          _buildFilterTab('نصائح الصيانة'),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        gradient: isActive
            ? const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : null,
        color: isActive ? null : AppTheme.surfaceHigh,
        borderRadius: BorderRadius.circular(24),
        border: isActive ? null : Border.all(color: AppTheme.outlineVariant.withOpacity(0.1)),
        boxShadow: isActive ? [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)] : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 14,
          color: isActive ? Colors.white : AppTheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildStoriesSection(BuildContext context) {
    final stories = [
      StoryData(
        userName: 'طه العريقي',
        userRole: 'مهندس صيانة',
        userAvatar: 'assets/images/tech_ahmad_cinematic.jpg',
        type: StoryType.text,
        textContent: 'عند تنظيف حساس الكاميرا، احرص دائماً على استخدام منفاخ الهواء أولاً قبل استخدام المساحات المبللة لتجنب الخدوش.',
        timeAgo: 'منذ ساعتين',
      ),
      StoryData(
        userName: 'محمد خال',
        userRole: 'مصور فوتوغرافي',
        userAvatar: 'assets/images/photographer_mohammad_3.jpg',
        type: StoryType.image,
        imageUrl: 'assets/images/photographer_work_1.jpg',
        timeAgo: 'منذ 15 دقيقة',
      ),
      StoryData(
        userName: 'العم خالد',
        userRole: 'محل تأجير',
        userAvatar: 'assets/images/rental_shop_1.jpg',
        type: StoryType.text,
        textContent: 'وصلت حديثاً مجموعة عدسات Sigma Art الجديدة لكاميرات Sony و Canon. احجزها الآن لبداية الأسبوع.',
        timeAgo: 'منذ ساعة',
      ),
    ];

    void showStory(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => StoryViewer(stories: [stories[index]], initialIndex: 0),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddStoryItem(),
          const SizedBox(width: 20),
          _buildStoryItem(
            name: stories[0].userName,
            role: stories[0].userRole,
            imageUrl: stories[0].userAvatar,
            onTap: () => showStory(0),
          ),
          const SizedBox(width: 20),
          _buildStoryItem(
            name: stories[1].userName,
            role: stories[1].userRole,
            imageUrl: stories[1].userAvatar,
            onTap: () => showStory(1),
          ),
          const SizedBox(width: 20),
          _buildStoryItem(
            name: stories[2].userName,
            role: stories[2].userRole,
            imageUrl: stories[2].userAvatar,
            onTap: () => showStory(2),
          ),
        ],
      ),
    );
  }

  Widget _buildAddStoryItem() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.surfaceHigh,
                border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.4), width: 2, style: BorderStyle.solid), // Cannot easily do dashed border without custom painter, using solid
              ),
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.matrix([
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      0.75, 0,
                  ]),
                  child: Image.asset(
                    'assets/images/user_avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryContainer,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.add, color: Colors.white, size: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'قصتك',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant),
        ),
      ],
    );
  }

  Widget _buildStoryItem({required String name, required String role, required String imageUrl, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryContainer, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryContainer.withOpacity(0.4),
                  blurRadius: 12,
                )
              ],
            ),
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.onSurface),
          ),
          Text(
            role,
            style: const TextStyle(fontSize: 8, color: AppTheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => context.push('/chat_detail/6', extra: {'name': 'إعلان: DJI Mavic 3 Pro', 'isPublic': true, 'imageUrl': 'assets/images/user_avatar.png'}),
            child: _buildDjiAdPost(),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => context.push('/chat_detail/7', extra: {'name': 'عرض: العم خالد للإيجار', 'isPublic': true, 'imageUrl': 'assets/images/العم خالد.png'}),
            child: _buildRentalOfferPost(),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => context.push('/chat_detail/8', extra: {'name': 'REEL: محمد خال', 'isPublic': true}),
            child: _buildReelPost(),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () => context.push('/chat_detail/9', extra: {'name': 'نصيحة: م. طه العريقي', 'isPublic': true}),
            child: _buildMaintenanceTipPost(),
          ),
        ],
      ),
    );
  }

  Widget _buildDjiAdPost() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.05)),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20)],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/lens_mobile_1.jpg', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('DJI Store Yemen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text('منذ ساعتين • إعلان مروّج', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.more_vert, color: AppTheme.onSurfaceVariant),
              ],
            ),
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset('assets/images/lens_mobile_2.jpg', fit: BoxFit.cover),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
                  child: const Text('NEW ARRIVAL', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('وصول طائرة DJI Mavic 3 Pro الجديدة', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.onSurface)),
                const SizedBox(height: 8),
                Text('أفضل طائرة بدون طيار للتصوير السينمائي متوفرة الآن في اليمن. ثلاث كاميرات، دقة 5.1K، ووقت طيران يصل إلى 43 دقيقة.', style: TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.5)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildActionIcon(Icons.favorite, '1.2k', AppTheme.primaryContainer),
                        const SizedBox(width: 16),
                        _buildActionIcon(Icons.chat_bubble, '45', AppTheme.primaryContainer),
                        const SizedBox(width: 16),
                        _buildActionIcon(Icons.share, null, AppTheme.primaryContainer),
                      ],
                    ),
                    _buildPrimaryButton('طلب المنتج'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRentalOfferPost() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.05)),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 20)],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(color: AppTheme.surfaceHighest, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/العم خالد.png', fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('العم خالد للإيجار', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text('منذ 5 ساعات • عرض خاص', style: TextStyle(fontSize: 10, color: AppTheme.onSurfaceVariant)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.bookmark, color: AppTheme.onSurfaceVariant),
              ],
            ),
          ),
          SizedBox(
            height: 256,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset('assets/images/rental_shop_2.jpg', fit: BoxFit.cover),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset('assets/images/rental_shop_3.jpg', fit: BoxFit.cover, color: Colors.black.withOpacity(0.4), colorBlendMode: BlendMode.darken),
                      Container(
                        color: AppTheme.primaryContainer.withOpacity(0.2),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25%', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900, fontFamily: 'Space Grotesk')),
                            Text('خصم خاص', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('تأجير Canon 90D لفترة محدودة', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.onSurface)),
                const SizedBox(height: 8),
                Text('استأجر كاميرا Canon 90D مع عدسة 18-135mm بسعر مميز جداً. العرض ساري حتى نهاية الأسبوع الحالي.', style: TextStyle(fontSize: 14, color: AppTheme.onSurfaceVariant, height: 1.5)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildActionIcon(Icons.favorite, '892', AppTheme.primaryContainer),
                        const SizedBox(width: 16),
                        _buildActionIcon(Icons.chat_bubble, '12', AppTheme.primaryContainer),
                      ],
                    ),
                    _buildPrimaryButton('احجز الآن'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReelPost() {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/photographer_work_1.jpg', fit: BoxFit.cover),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black26, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppTheme.primaryContainer, width: 2)),
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset('assets/images/photographer_mohammad_3.jpg', fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text('محمد خال', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
                            child: const Text('REEL', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w900)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'سحر العاصمة القديمة صنعاء من زاوية لم ترها من قبل. تم التصوير بكاميرا Sony A7IV',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.music_note, color: AppTheme.primary, size: 16),
                          SizedBox(width: 4),
                          Text('Sanaa Nights - Original Audio', style: TextStyle(color: AppTheme.primary, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    _buildGlassAction(Icons.favorite, '12.4k', AppTheme.primaryContainer),
                    const SizedBox(height: 16),
                    _buildGlassAction(Icons.chat_bubble, '156', Colors.white),
                    const SizedBox(height: 16),
                    _buildGlassAction(Icons.share, null, Colors.white),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassAction(IconData icon, String? label, Color iconColor) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF353534).withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor),
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ]
      ],
    );
  }

  Widget _buildMaintenanceTipPost() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(16),
        border: const Border(right: BorderSide(color: AppTheme.primaryContainer, width: 4)),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppTheme.primaryContainer.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.build, color: AppTheme.primaryContainer, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('نصيحة الصيانة الأسبوعية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text('بواسطة م. طه العريقي', style: TextStyle(color: AppTheme.primary, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('كيف تحمي حساس الكاميرا (Sensor) من الغبار؟', style: TextStyle(color: AppTheme.primary, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('تجنب تغيير العدسات في الأماكن المفتوحة ذات الرياح القوية، واجعل جسم الكاميرا دائماً متجهاً للأسفل عند التبديل لمنع تساقط ذرات الغبار داخلها.', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 14, height: 1.5)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.thumb_up, color: AppTheme.primaryContainer, size: 16),
                    const SizedBox(width: 4),
                    const Text('2.3k شكر', style: TextStyle(color: AppTheme.primaryContainer, fontSize: 10, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 24),
                    const Icon(Icons.visibility, color: AppTheme.onSurfaceVariant, size: 16),
                    const SizedBox(width: 4),
                    Text('10k مشاهدة', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String? text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        if (text != null) ...[
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        ]
      ],
    );
  }

  Widget _buildPrimaryButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.3), blurRadius: 10)],
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

