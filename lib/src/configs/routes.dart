import 'package:go_router/go_router.dart';
import '../presentation/pages/home/home.dart';
import '../presentation/pages/splash/splash.dart';
import '../presentation/pages/cart/cart_page.dart';
import '../presentation/pages/map/map_page.dart';
import '../presentation/pages/info/info_page.dart';
import '../presentation/pages/scaffold_with_nav.dart';

class Routes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNav(
            currentIndex: navigationShell.currentIndex,
            child: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cart',
                name: 'cart',
                builder: (context, state) => const CartPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/map',
                name: 'map',
                builder: (context, state) => const MapPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/info',
                name: 'info',
                builder: (context, state) => const InfoPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
