import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final int navIndex;

  const PlaceholderScreen({
    super.key,
    required this.title,
    this.navIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title, showBackButton: true),
      bottomNavigationBar: CustomBottomNav(currentIndex: navIndex),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.construction, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              '$title قيد التطوير',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
