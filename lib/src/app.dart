import 'package:animania/src/domain/services/geolocation_service.dart';
import 'package:animania/src/presentation/cubits/geolocation_cubit/cubit/geolocation_cubit.dart';
import 'package:animania/src/presentation/cubits/restaurant_list_cubit/cubit/restaurant_list_cubit.dart';
import 'package:animania/src/presentation/cubits/user_info_cubit/cubit/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'configs/routes.dart';
import 'configs/themes.dart';
import 'data/repositories/geolocation_repository.dart';
import 'data/repositories/restaurant_repository.dart';
import 'presentation/cubits/food_category_cubit/food_category_cubit.dart';
import 'presentation/cubits/theme_cubit.dart';
import 'data/constants.dart';

final getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => GeolocationCubit(
            getIt<IGeolocationRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserInfoCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantListCubit(
            getIt<IRestaurantRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => getIt<FoodCategoryCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppThemeType>(
        builder: (context, themeType) {
          return MaterialApp.router(
            theme: AppThemes.getThemeData(themeType),
            routerConfig: Routes.router,
          );
        },
      ),
    );
  }
}
