import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';
import 'public_channel_screen.dart'; // Import to use PublicChatView

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  bool _isPublic = false; // Toggle state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildTabToggle(),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.05, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: _isPublic ? const PublicChatView() : _buildPrivateListView(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: !_isPublic ? _buildFab() : null, // Hide FAB in public view
      bottomNavigationBar: const CustomBottomNav(currentIndex: 3),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF131313),
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppTheme.primaryContainer),
        onPressed: () {},
      ),
      title: Text(
        _isPublic ? 'الدردشة العامة' : 'الدردشة الخاصة',
        style: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppTheme.primaryContainer,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.grey),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildTabToggle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Container(
        height: 54,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildToggleButton('خاصة', !_isPublic),
            ),
            Expanded(
              child: _buildToggleButton('عامة', _isPublic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () => setState(() => _isPublic = (text == 'عامة')),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [AppTheme.primaryContainer, Color(0xFF802A00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          boxShadow: isSelected
              ? [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
            fontFamily: 'Space Grotesk',
          ),
        ),
      ),
    );
  }

  Widget _buildPrivateListView() {
    return Column(
      key: const ValueKey('private_list'),
      children: [
        _buildFilterPills(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              _buildChatItem(
                name: 'عدسة صنعاء | أحمد',
                time: '10:30 ص',
                message: 'هل قمت بتعديل الصور الخاصة بجلسة تصوير المنتج؟',
                imageUrl: 'assets/images/photographer_mohammad_1.jpg',
                unreadCount: 3,
                isActive: true,
                onTap: () => context.push('/chat_detail/1', extra: {'name': 'عدسة الرياض | أحمد', 'imageUrl': 'assets/images/photographer_mohammad_1.jpg', 'isPublic': false}),
              ),
              const SizedBox(height: 12),
              _buildChatItem(
                name: 'فني صيانة الكاميرات',
                time: 'أمس',
                message: 'تم استلام القطعة، سأوافيك بالتفاصيل غداً.',
                imageUrl: 'assets/images/tech_ahmad_cinematic.jpg',
                isRead: true,
                isGrayscale: true,
                onTap: () => context.push('/chat_detail/2', extra: {'name': 'فني صيانة الكاميرات', 'imageUrl': 'assets/images/tech_ahmad_cinematic.jpg', 'isPublic': false}),
              ),
              const SizedBox(height: 12),
              _buildChatItem(
                name: 'متجر الفلاش الحديث',
                time: '١٢ أكتوبر',
                message: 'تم شحن طلبك رقم #45923 بنجاح.',
                iconData: Icons.shopping_bag,
                isRead: true,
                onTap: () => context.push('/chat_detail/3', extra: {'name': 'متجر الفلاش الحديث', 'isPublic': false}),
              ),
              const SizedBox(height: 12),
              _buildChatItem(
                name: 'سارة للإنتاج المرئي',
                time: 'الأسبوع الماضي',
                message: 'شكراً لتعاملك معنا.',
                imageUrl: 'assets/images/photographer_mohammad_2.png',
                isRead: true,
                isGrayscale: true,
                onTap: () => context.push('/chat_detail/4', extra: {'name': 'سارة للإنتاج المرئي', 'imageUrl': 'assets/images/photographer_mohammad_2.png', 'isPublic': false}),
              ),
              const SizedBox(height: 12),
              _buildChatItem(
                name: 'مجموعة مصوري المناظر الطبيعية',
                time: '١ سبتمبر',
                message: 'خالد: أرسلت المواقع الجديدة...',
                iconData: Icons.groups,
                opacity: 0.5,
                onTap: () => context.push('/chat_detail/5', extra: {'name': 'مجموعة مصوري المناظر الطبيعية', 'isPublic': true}),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterPills() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          _buildPill('الكل', isActive: true),
          const SizedBox(width: 8),
          _buildPill('غير مقروءة'),
          const SizedBox(width: 8),
          _buildPill('المجموعات'),
          const SizedBox(width: 8),
          _buildPill('المؤرشفة'),
        ],
      ),
    );
  }

  Widget _buildPill(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryContainer : AppTheme.surfaceHigh,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isActive
            ? [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 15)]
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
          color: isActive ? const Color(0xFF370E00) : AppTheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String time,
    required String message,
    String? imageUrl,
    IconData? iconData,
    int unreadCount = 0,
    bool isActive = false,
    bool isRead = false,
    bool isGrayscale = false,
    double opacity = 1.0,
    VoidCallback? onTap,
  }) {
    return _SnappyTap(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isActive ? AppTheme.surfaceHigh : AppTheme.surfaceLow,
            borderRadius: BorderRadius.circular(16),
            border: isActive
                ? const Border(
                    right: BorderSide(color: AppTheme.primaryContainer, width: 4))
                : null,
          ),
          child: Row(
            children: [
              _buildAvatar(imageUrl, iconData, isActive, isGrayscale),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppTheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                            color: isActive ? AppTheme.primary : AppTheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                              color: AppTheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (unreadCount > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppTheme.surfaceHigh, width: 2),
                            ),
                            child: Text(
                              '$unreadCount',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF370E00),
                              ),
                            ),
                          ),
                        if (isRead)
                          const Icon(Icons.done_all, color: AppTheme.primary, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(String? imageUrl, IconData? iconData, bool isActive, bool isGrayscale) {
    return Stack(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isActive ? Border.all(color: AppTheme.primaryContainer.withOpacity(0.2), width: 2) : null,
            color: AppTheme.surfaceHighest,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: imageUrl != null
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      isGrayscale ? Colors.grey : Colors.transparent,
                      BlendMode.saturation,
                    ),
                    child: Image.asset(imageUrl, fit: BoxFit.cover),
                  )
                : Icon(iconData ?? Icons.person, color: iconData == Icons.shopping_bag ? AppTheme.primaryContainer : AppTheme.onSurfaceVariant, size: 32),
          ),
        ),
        if (isActive)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: AppTheme.primaryContainer,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.surfaceHigh, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFab() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryContainer, Color(0xFF802A00)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryContainer.withOpacity(0.3),
            blurRadius: 32,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: const Icon(Icons.edit_square, color: Color(0xFF370E00), size: 28),
    );
  }
}

class _SnappyTap extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _SnappyTap({required this.child, this.onTap});

  @override
  State<_SnappyTap> createState() => _SnappyTapState();
}

class _SnappyTapState extends State<_SnappyTap> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap ?? () {},
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: const Cubic(0.05, 0.7, 0.1, 1.0),
        child: widget.child,
      ),
    );
  }
}

