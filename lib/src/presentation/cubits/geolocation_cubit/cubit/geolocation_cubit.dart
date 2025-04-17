import 'package:animania/src/domain/services/geolocation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit(this.geolocationService)
      : super(
          GeolocationInitial(),
        );
  final IGeolocationService geolocationService;
}
