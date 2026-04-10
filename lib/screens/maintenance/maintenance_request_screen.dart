import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart';

class MaintenanceRequestScreen extends StatefulWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  State<MaintenanceRequestScreen> createState() => _MaintenanceRequestScreenState();
}

class _MaintenanceRequestScreenState extends State<MaintenanceRequestScreen> {
  String _selectedType = 'Camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLowest,
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceLowest,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryContainer),
          onPressed: () => context.pop(),
        ),
        title: const Text('MAINTENANCE REQUEST', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.primaryContainer, letterSpacing: -0.5)),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Center(child: Text('CAMS', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, color: AppTheme.primaryContainer, fontStyle: FontStyle.italic))),
          )
        ],
      ),
      body: Stack(
        children: [
          // Simulated noise overlay via an opacity layer if needed
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 32),
                _buildEquipmentTypeSelection(),
                const SizedBox(height: 32),
                _buildInputSection('اسم المعدة', 'Canon 90D'),
                const SizedBox(height: 32),
                _buildImageUpload(),
                const SizedBox(height: 32),
                _buildTextAreaSection('وصف المشكلة كتابةً', 'يرجى كتابة تفاصيل العطل هنا...'),
                const SizedBox(height: 40),
                _buildVoiceRecordingBtn(),
              ],
            ),
          ),
          _buildFloatingAction(context),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('طلب صيانة', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white)),
        const SizedBox(height: 8),
        Container(width: 48, height: 4, color: AppTheme.primaryContainer),
      ],
    );
  }

  Widget _buildEquipmentTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('حدد نوع المعدة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _buildTypeCard('Camera', Icons.photo_camera)),
            const SizedBox(width: 12),
            Expanded(child: _buildTypeCard('Drone', Icons.air)),
            const SizedBox(width: 12),
            Expanded(child: _buildTypeCard('Lighting', Icons.lightbulb)),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeCard(String title, IconData icon) {
    final isActive = _selectedType == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primaryContainer.withOpacity(0.1) : AppTheme.surfaceLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isActive ? AppTheme.primaryContainer : Colors.transparent),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: isActive ? AppTheme.primaryContainer : AppTheme.onSurface),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isActive ? AppTheme.primaryContainer : AppTheme.onSurface, letterSpacing: -0.5)),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surfaceHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(width: 4, decoration: const BoxDecoration(color: AppTheme.primaryContainer, borderRadius: BorderRadius.horizontal(left: Radius.circular(12)))), // Left border indicator for RTL if focused? Keeping it static for now
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.5)),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                    style: const TextStyle(color: AppTheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('صور للمعدة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 12),
        Row(
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppTheme.surfaceHighest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.3), style: BorderStyle.none),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo, color: AppTheme.onSurfaceVariant, size: 28),
                  SizedBox(height: 4),
                  Text('UPLOAD', style: TextStyle(color: AppTheme.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppTheme.surfaceHigh),
              clipBehavior: Clip.antiAlias,
              child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCpG7rLRNWYnsLuD5gfY72gmkYKlmaw0IWEKEY8q-hX0Fw57MTTCtgBEiB15GroDRen7HhMARpGbBj9o2gdV6dscRIn35tPci26xg3PL5N6CxskVyMcCLYv0GJkxQwZOwHnGkkIT1tpZnwo3TRoIQYeqd-GttjwOwEFjKmQygUeHkQryVrwSCb40llotM9F11LQNpzBoGPu6_Zi8X1ZMr7-DkI5Jx5UvN7-l6r94LfGzxPVo-9_UlXjMHAQPzYo3olDlPA-pu0mjm8', fit: BoxFit.cover, color: Colors.grey, colorBlendMode: BlendMode.saturation),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextAreaSection(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.onSurfaceVariant, letterSpacing: 1.5)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(color: AppTheme.surfaceHighest, borderRadius: BorderRadius.circular(12)),
          child: TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppTheme.onSurfaceVariant.withOpacity(0.5)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
            ),
            style: const TextStyle(color: AppTheme.onSurface),
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceRecordingBtn() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: AppTheme.surfaceLow, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.outlineVariant.withOpacity(0.1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppTheme.primaryContainer.withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.mic, color: AppTheme.primaryContainer),
          ),
          const SizedBox(width: 16),
          const Text('وصف المشكلة بتسجيل صوتي', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.onSurface)),
        ],
      ),
    );
  }

  Widget _buildFloatingAction(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xFF353534).withOpacity(0.6)), // Glass panel equivalent
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppTheme.primaryContainer, Color(0xFF802A00)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: AppTheme.primaryContainer.withOpacity(0.2), blurRadius: 30)],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('إرسال الطلب', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(width: 12),
              Icon(Icons.send, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
