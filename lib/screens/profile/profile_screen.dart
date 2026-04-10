import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildProfileHeader(),
                    const SizedBox(height: 16),
                    _buildQuickAccessBar(),
                    const SizedBox(height: 40),
                    _buildVisualSeparator(),
                    const SizedBox(height: 40),
                    _buildActivityFeed(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color(0xFF131313),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.camera_front, color: AppTheme.primaryContainer),
              const SizedBox(width: 8),
              const Text(
                'CAMS',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  letterSpacing: 2.0,
                  color: AppTheme.primaryContainer,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: const Color(0xFF1E1E1E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: const Text('تأكيد تسجيل الخروج', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold)),
                      content: const Text('هل أنت متأكد من أنك تريد تسجيل الخروج من حسابك؟', style: TextStyle(color: AppTheme.onSurfaceVariant)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء', style: TextStyle(color: AppTheme.onSurfaceVariant)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFC62828),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            context.go('/');
                          },
                          child: const Text('خروج', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.grey),
                tooltip: 'تسجيل الخروج',
              ),
              IconButton(
                onPressed: () => context.push('/settings'),
                icon: const Icon(Icons.settings, color: Colors.grey),
                tooltip: 'الإعدادات',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Focus Ring (Pulse Animation Mock via simple container for now, though we could use an AnimationController)
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.8, end: 1.2),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, double value, child) {
                return Container(
                  width: 128 * value,
                  height: 128 * value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.2 - (value - 0.8) * 0.4),
                      width: 1,
                    ),
                  ),
                );
              },
              onEnd: () {
                // To truly loop we'd need a StatefulWidget, but this gives a subtle initial pulse
              },
            ),
            Container(
              width: 112,
              height: 112,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.surfaceHigh,
                border: Border.all(color: AppTheme.primaryContainer, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(56),
                child: Image.asset("assets/images/photographer_mohammad_1.jpg",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 48, color: Colors.grey),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryContainer,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.surfaceLowest, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(Icons.verified, size: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'أحمد السعدني',
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: -0.5,
            color: AppTheme.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month, size: 12, color: AppTheme.onSurfaceVariant),
            const SizedBox(width: 4),
            const Text(
              'انضم منذ ٢٠٢٢',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                color: AppTheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(width: 12),
            Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle)),
            const SizedBox(width: 12),
            const Icon(Icons.location_on, size: 12, color: AppTheme.onSurfaceVariant),
            const SizedBox(width: 4),
            const Text(
              'الرياض، السعودية',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                color: AppTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAccessBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x991C1B1B), // surface-container-low with 60% opacity
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryContainer.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildQuickAccessButton(icon: Icons.camera_roll, label: 'استئجاراتي'),
          _buildQuickAccessButton(icon: Icons.build, label: 'صيانتي'),
          _buildQuickAccessButton(icon: Icons.shopping_bag, label: 'مشترياتي'),
          _buildQuickAccessButton(icon: Icons.group, label: 'متابعاتي'),
          _buildQuickAccessButton(icon: Icons.favorite, label: 'المفضلة'),
        ],
      ),
    );
  }

  Widget _buildQuickAccessButton({required IconData icon, required String label}) {
    return _QuickAccessButton(icon: icon, label: label);
  }

  Widget _buildVisualSeparator() {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppTheme.surfaceVariant.withOpacity(0.5),
            Colors.transparent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  Widget _buildActivityFeed() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'آخر التحديثات',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1.0,
                color: AppTheme.primary,
              ),
            ),
            Text(
              'تصفية',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 12,
                color: AppTheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildNotificationCard(
          icon: Icons.history,
          iconColor: AppTheme.primaryContainer,
          title: 'تذكير بإرجاع المعدات',
          time: 'منذ ٢ ساعة',
          body: 'يرجى إرجاع كاميرا Sony A7S III قبل الساعة ٤:٠٠ مساءً لتجنب رسوم التأخير.',
          borderColor: AppTheme.primaryContainer,
        ),
        const SizedBox(height: 16),
        _buildNotificationCard(
          icon: Icons.done_all,
          iconColor: AppTheme.primary,
          title: 'اكتمال صيانة الدرون',
          time: 'منذ ٥ ساعات',
          body: 'درون DJI Mavic 3 جاهز للاستلام من مركز الصيانة الرئيسي.',
          borderColor: AppTheme.primary,
        ),
        const SizedBox(height: 16),
        _buildNotificationCard(
          icon: Icons.local_offer,
          iconColor: AppTheme.onSurfaceVariant,
          title: 'عرض حصري جديد',
          time: 'منذ يوم',
          body: 'خصم ٣٠٪ على جميع فلاتر ND في محل "كاميرا زون" لفترة محدودة.',
          borderColor: Colors.white.withOpacity(0.1),
          iconBgColor: AppTheme.surfaceVariant,
        ),
        const SizedBox(height: 16),
        _buildNotificationCard(
          icon: Icons.mail,
          iconColor: AppTheme.primaryContainer,
          title: 'رسالة جديدة',
          time: 'أمس',
          body: 'وصلتك رسالة من "سارة محمود" بخصوص طلب استئجار العدسة.',
          borderColor: AppTheme.primaryContainer,
        ),
      ],
    );
  }

  Widget _buildNotificationCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    required String body,
    required Color borderColor,
    Color? iconBgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: Border(
          right: BorderSide(color: borderColor, width: 4), // right border for RTL
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor ?? iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppTheme.onSurface,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 10,
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 12,
                    height: 1.6,
                    color: AppTheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAccessButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const _QuickAccessButton({required this.icon, required this.label});

  @override
  State<_QuickAccessButton> createState() => _QuickAccessButtonState();
}

class _QuickAccessButtonState extends State<_QuickAccessButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {},
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: const Cubic(0.05, 0.7, 0.1, 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _isHovered ? AppTheme.primaryContainer.withOpacity(0.2) : AppTheme.surfaceHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(widget.icon, color: AppTheme.primaryContainer, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
