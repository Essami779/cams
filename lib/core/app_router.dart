import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/rentals/rentals_screen.dart';
import '../screens/rentals/rental_shop_detail_screen.dart';
import '../screens/rentals/rental_products_screen.dart';
import '../screens/rentals/rental_product_detail_screen.dart';
import '../screens/photographers/photographers_screen.dart';
import '../screens/photographers/photographer_detail_screen.dart';
import '../screens/photographers/portfolio_detail_screen.dart';
import '../screens/support/support_screen.dart';
import '../screens/maintenance/experts_portal_screen.dart';
import '../screens/maintenance/expert_details_screen.dart';
import '../screens/maintenance/maintenance_request_screen.dart';
import '../screens/chat/chat_screen.dart';
import '../screens/chat/public_channel_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/settings/about_us_screen.dart';
import '../screens/placeholder_screen.dart';
import '../screens/stores/mobile_store_screen.dart';
import '../screens/stores/mobile_store_detail_screen.dart';
import '../screens/stores/cinema_store_screen.dart';
import '../screens/stores/cinema_store_detail_screen.dart';
import '../screens/chat/chat_detail_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/rentals',
        builder: (context, state) => const RentalsScreen(),
      ),
      GoRoute(
        path: '/rentals/shop/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RentalShopDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/rentals/products',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return RentalProductsScreen(
            category: extra['category'] as String? ?? 'الكاميرات',
            shopName: extra['shopName'] as String? ?? 'عدسة صنعاء',
          );
        },
      ),
      GoRoute(
        path: '/rentals/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return RentalProductDetailScreen(id: id);
        },
      ),
      GoRoute(
        path: '/crew',
        builder: (context, state) => const PhotographersScreen(),
      ),
      GoRoute(
        path: '/crew/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra as Map<String, dynamic>?;
          return PhotographerDetailScreen(
            id: id,
            name: extra?['name'],
            location: extra?['location'],
            imageUrl: extra?['imageUrl'],
            portfolio: extra?['portfolio'] as List<Map<String, String>>?,
            desc: extra?['desc'],
          );
        },
      ),
      GoRoute(
        path: '/maintenance',
        builder: (context, state) => const ExpertsPortalScreen(),
      ),
      GoRoute(
        path: '/maintenance/expert/:id',
        builder: (context, state) => const ExpertDetailsScreen(),
      ),
      GoRoute(
        path: '/maintenance/request',
        builder: (context, state) => const MaintenanceRequestScreen(),
      ),
      GoRoute(
        path: '/stores',
        builder: (context, state) => const CinemaStoreScreen(),
      ),
      GoRoute(
        path: '/stores/cinema/:id',
        builder: (context, state) => CinemaStoreDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/stores/mobile',
        builder: (context, state) => const MobileStoreScreen(),
      ),
      GoRoute(
        path: '/stores/mobile/:id',
        builder: (context, state) => MobileStoreDetailScreen(id: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const ChatScreen(),
      ),
      GoRoute(
        path: '/public_channel',
        builder: (context, state) => const PublicChannelScreen(),
      ),
      GoRoute(
        path: '/chat_detail/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return ChatDetailScreen(
            id: id,
            name: extra['name'] as String? ?? 'محادثة',
            imageUrl: extra['imageUrl'] as String?,
            isPublic: extra['isPublic'] as bool? ?? false,
          );
        },
      ),
      GoRoute(
        path: '/alerts',
        builder: (context, state) => const PlaceholderScreen(title: 'التنبيهات', navIndex: 3),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/support',
        builder: (context, state) => const SupportScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: '/portfolio_detail',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return PortfolioDetailScreen(
            imageUrl: extra['imageUrl'] as String,
            title: extra['title'] as String,
            description: extra['description'] as String,
          );
        },
      ),
    ],
  );
}
