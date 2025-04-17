import 'package:animania/src/presentation/pages/auth_reg/reg_options/email/email_reg.dart';
import 'package:animania/src/presentation/pages/auth_reg/reg_options/phone/phone_page.dart';
import 'package:animania/src/presentation/pages/auth_reg/reg_options/phone/send_msg.dart';
import 'package:go_router/go_router.dart';
import '../data/models/food_model.dart';
import '../presentation/pages/auth_reg/reg/reg_page.dart';
import '../presentation/pages/food/details.dart';
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
      GoRoute(
          path: '/foodDetails',
          name: 'food_details',
          builder: (context, state) {
            final foodModel = state.extra as FoodModel;
            return FoodDetails(
              foodModel: foodModel,
            );
          }),
      GoRoute(
        path: '/registration',
        name: 'registration',
        builder: (context, state) => const RegistrationPage(),
        routes: [
          GoRoute(
            path: '/reg_email',
            name: 'registration_with_email',
            builder: (context, state) => const EmailReg(),
            routes: [
              GoRoute(
                path: '/phone',
                name: 'phone_initialize',
                builder: (context, state) => const PhonePage(),
                routes: [
                  GoRoute(
                    path: '/send_msg',
                    name: 'send_msg',
                    builder: (context, state) => const SendMsgChoose(),
                  ),
                ],
              ),
            ],
          ),
        ],
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
