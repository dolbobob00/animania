import 'package:go_router/go_router.dart';
import '../presentation/pages/home/home.dart';
import '../presentation/pages/splash/splash.dart';

class Routes {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
