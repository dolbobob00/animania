import 'package:animania/src/presentation/pages/auth_reg/reg_options/email/email_reg.dart';
import 'package:animania/src/presentation/pages/auth_reg/reg_options/phone/phone_page.dart';
import 'package:animania/src/presentation/pages/auth_reg/reg_options/phone/send_msg.dart';
import 'package:animania/src/presentation/pages/restaraunt/restaurants.dart';
import 'package:go_router/go_router.dart';
import '../data/models/food_model.dart';
import '../data/models/restaurant_model.dart';
import '../presentation/pages/auth_reg/reg/reg_page.dart';
import '../presentation/pages/food/details.dart';
import '../presentation/pages/geolocation/need_geolocation.dart';
import '../presentation/pages/home/home.dart';
import '../presentation/pages/profile/profile_page.dart';
import '../presentation/pages/restaraunt/restaurant_details.dart';
import '../presentation/pages/restaraunt/restaurant_list.dart';
import '../presentation/pages/search/search_page.dart';
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
      GoRoute(
        path: '/need_geolocation',
        name: 'need_geolocation',
        builder: (context, state) => const NeedGeolocationPage(),
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
                path: '/restaurants',
                name: 'restaurantsFull',
                builder: (context, state) => const Restaurants(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => const SearchPage(),
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
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/foodDetails',
        name: 'food_details',
        builder: (context, state) {
          final foodModel = state.extra as FoodModel;
          return FoodDetails(
            foodModel: foodModel,
          );
        },
      ),
      GoRoute(
        path: '/restaurants_list',
        name: 'restaurants',
        builder: (context, state) => const RestaurantList(),
        routes: [
          GoRoute(
            path: '/restaurant_details',
            name: 'restaurantDetails',
            builder: (context, state) {
              final restaurantModel = state.extra as RestaurantModel;
              return RestaurantDetails(
                restaurantModel: restaurantModel,
              );
            },
          ),
        ],
      ),
    ],
  );
}
