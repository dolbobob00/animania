import 'package:animania/src/domain/services/geolocation_service.dart';
import 'package:animania/src/presentation/cubits/geolocation_cubit/cubit/geolocation_cubit.dart';
import 'package:animania/src/presentation/cubits/user_info_cubit/cubit/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'configs/routes.dart';
import 'configs/themes.dart';
import 'presentation/cubits/theme_cubit.dart';
import 'data/constants.dart';

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
            context.read<IGeolocationService>(),
          ),
        ),
        BlocProvider(
          create: (context) => UserInfoCubit(),
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
