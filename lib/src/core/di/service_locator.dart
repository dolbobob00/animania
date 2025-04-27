import 'package:animania/src/domain/services/geolocation_service.dart';
import 'package:animania/src/presentation/cubits/geolocation_cubit/cubit/geolocation_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../data/repositories/geolocation_repository.dart';
import '../../presentation/cubits/food_category_cubit/food_category_cubit.dart';
import '../../presentation/cubits/restaurant_list_cubit/cubit/restaurant_list_cubit.dart';
import '../network/dio_client.dart';
import '../../data/repositories/banner_repository.dart';
import '../../data/repositories/food_repository.dart';
import '../../data/repositories/restaurant_repository.dart';
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Network
  getIt.registerSingleton<DioClient>(DioClient());

  // Services
  getIt.registerLazySingleton<IGeolocationService>(
    () => GeolocationService(),
  );

  // Repositories
  getIt.registerLazySingleton<BannerRepository>(
    () => BannerRepository(getIt<DioClient>().dio),
  );
  
  getIt.registerLazySingleton<FoodRepository>(
    () => FoodRepository(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<IRestaurantRepository>(
    () => RestaurantRepository(getIt<DioClient>().dio),
  );

  // Cubits
  getIt.registerFactory<RestaurantListCubit>(
    () => RestaurantListCubit(getIt<RestaurantRepository>()),
  );

  getIt.registerFactory<FoodCategoryCubit>(
    () => FoodCategoryCubit(getIt<FoodRepository>()),
  );

  getIt.registerLazySingleton<IGeolocationRepository>(
    () => GeolocationRepository(),
  );

  getIt.registerFactory<GeolocationCubit>(
    () => GeolocationCubit(getIt<IGeolocationRepository>()),
  );
}
