import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';
import '../../widgets/custom_bottom_nav.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: Stack(
        children: [
          // Ambient Glow Textures
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: -96,
            child: Container(
              width: 384,
              height: 384,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryContainer.withOpacity(0.05),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                child: Container(),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: -96,
            child: Container(
              width: 384,
              height: 384,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryContainer.withOpacity(0.05),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                child: Container(),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildProfileAnchor(),
                        const SizedBox(height: 48),
                        
                        _buildSectionTitle('تعديل الحساب'),
                        _buildSettingsGroup([
                          _buildSettingsTile(
                            icon: Icons.person_outline,
                            title: 'المعلومات الشخصية',
                            subtitle: 'الاسم، البريد الإلكتروني، رقم الهاتف',
                            showChevron: true,
                          ),
                          _buildDivider(),
                          _buildSettingsTile(
                            icon: Icons.lock_outline,
                            title: 'كلمة المرور',
                            subtitle: 'تحديث وإدارة مفاتيح الأمان',
                            showChevron: true,
                          ),
                        ]),
                        
                        const SizedBox(height: 16),
                        
                        _buildSectionTitle('تخصيص التنبيهات'),
                        _buildSettingsGroup([
                          _buildSettingsTile(
                            icon: Icons.notifications_active_outlined,
                            title: 'تنبيهات الصوت',
                            trailing: Switch(
                              value: true,
                              onChanged: (val) {},
                              activeColor: Colors.white,
                              activeTrackColor: AppTheme.primaryContainer,
                              inactiveTrackColor: AppTheme.surfaceVariant,
                            ),
                          ),
                          _buildDivider(),
                          _buildSettingsTile(
                            icon: Icons.campaign_outlined,
                            title: 'العروض والتحديثات',
                            trailing: Switch(
                              value: false,
                              onChanged: (val) {},
                              activeColor: Colors.white,
                              activeTrackColor: AppTheme.primaryContainer,
                              inactiveTrackColor: AppTheme.surfaceVariant,
                            ),
                          ),
                        ]),

                        const SizedBox(height: 16),

                        _buildSectionTitle('التفضيلات'),
                        _buildSettingsGroup([
                          _buildSettingsTile(
                            icon: Icons.dark_mode_outlined,
                            title: 'المظهر',
                            subtitle: 'الوضع الداكن نشط حالياً',
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceVariant,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'DARK',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.onSurface,
                                ),
                              ),
                            ),
                          ),
                          _buildDivider(),
                          _buildSettingsTile(
                            icon: Icons.translate,
                            title: 'اللغة',
                            subtitle: 'العربية (Arabic)',
                            showChevron: true,
                          ),
                        ]),

                        const SizedBox(height: 16),
                        
                        _buildSectionTitle('الدعم الفني'),
                        _buildSettingsGroup([
                          _buildSettingsTile(
                            icon: Icons.contact_support_outlined,
                            title: 'اتصل بنا',
                            showChevron: true,
                          ),
                          _buildDivider(),
                          _buildSettingsTile(
                            icon: Icons.policy_outlined,
                            title: 'سياسة الخصوصية',
                            showChevron: true,
                          ),
                        ]),
                        
                        const SizedBox(height: 48),
                        
                        _buildLogoutButton(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_forward, color: AppTheme.onSurface),
                onPressed: () => context.pop(),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 8),
              const Text(
                'الإعدادات',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Space Grotesk',
                  color: AppTheme.onSurface,
                ),
              ),
            ],
          ),
          const Text(
            'CAMS',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              fontFamily: 'Space Grotesk',
              color: AppTheme.primaryContainer,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAnchor() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          right: BorderSide(
            color: AppTheme.primaryContainer,
            width: 4,
          ),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primary.withOpacity(0.2), width: 2),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: const Icon(Icons.person, size: 40, color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: -4,
                right: -4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryContainer,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.surfaceLow, width: 2),
                  ),
                  child: const Icon(Icons.verified, size: 14, color: Color(0xFF521800)),
                ),
              )
            ],
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'OPERATOR 01',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Space Grotesk',
                  letterSpacing: -0.5,
                  color: AppTheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'admin_access_v2.4.0',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppTheme.primaryContainer,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'Space Grotesk',
          letterSpacing: 2.0,
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceLow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.white.withOpacity(0.05),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    bool showChevron = false,
    Widget? trailing,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.onSurface,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing,
            if (showChevron)
              const Icon(Icons.chevron_left, color: AppTheme.onSurfaceVariant, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [AppTheme.primaryContainer, Color(0xFF802A00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryContainer.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: const Color(0xFF1E1E1E),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: const Text(
                      'تأكيد تسجيل الخروج',
                      style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                      'هل أنت متأكد من أنك تريد تسجيل الخروج التام من حسابك؟',
                      style: TextStyle(color: AppTheme.onSurfaceVariant),
                    ),
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
                          Navigator.pop(context); // Close dialog
                          context.go('/'); // Navigate to splash screen
                        },
                        child: const Text('خروج', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'تسجيل الخروج',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF521800), // on-primary-container
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'System Build v2.4.0-Final-Stable'.toUpperCase(),
          style: TextStyle(
            fontSize: 10,
            color: AppTheme.onSurfaceVariant.withOpacity(0.4),
            letterSpacing: 2,
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
