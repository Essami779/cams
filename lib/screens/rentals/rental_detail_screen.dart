import 'package:flutter/material.dart';
import '../../core/dummy_data.dart';
import '../../core/theme.dart';
import '../../widgets/custom_app_bar.dart';

class RentalDetailScreen extends StatelessWidget {
  final String id;

  const RentalDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Find the matching shop
    final shop = DummyData.rentalShops.firstWhere(
      (s) => s['id'] == id,
      orElse: () => DummyData.rentalShops.first,
    );

    return Scaffold(
      appBar: const CustomAppBar(title: 'تفاصيل المحل', showBackButton: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Head Image
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    shop['image'],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(color: Colors.grey),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppTheme.surface.withOpacity(1.0),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shop['name'],
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: AppTheme.primaryContainer, size: 20),
                          const SizedBox(width: 8),
                          Text(shop['location'], style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نبذة عن المحل',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    shop['description'],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5, color: AppTheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  
                  // Tags
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: (shop['tags'] as List<String>).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceHigh,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppTheme.primaryContainer.withOpacity(0.3)),
                        ),
                        child: Text(tag, style: Theme.of(context).textTheme.labelSmall),
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 48),
                  // CTA
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Implement rent request logic
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: const Text('استأجر الآن'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
