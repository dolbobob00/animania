import 'package:animania/src/domain/services/geolocation_service.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';
import '../../data/repositories/banner_repository.dart';
import '../../data/repositories/food_repository.dart';
final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Network
  getIt.registerSingleton<DioClient>(DioClient());

  // Repositories
  getIt.registerLazySingleton<BannerRepository>(
    () => BannerRepository(getIt<DioClient>().dio),
  );
  
  getIt.registerLazySingleton<FoodRepository>(
    () => FoodRepository(getIt<DioClient>().dio),
  );

  getIt.registerLazySingleton<IGeolocationService>(
    () => GeolocationService(),
  );
}
