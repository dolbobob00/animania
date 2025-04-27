import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/repositories/geolocation_repository.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final IGeolocationRepository _repository;

  GeolocationCubit(this._repository) : super(const GeolocationState()) {
    checkLocationStatus();
  }

  Future<void> checkLocationStatus() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final hasPermission = await _repository.checkPermission();
      final isEnabled = await _repository.isLocationEnabled();

      if (hasPermission && isEnabled) {
        await getCurrentLocation();
      }

      emit(state.copyWith(
        hasPermission: hasPermission,
        isLocationEnabled: isEnabled,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> requestPermission() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final hasPermission = await _repository.requestPermission();
      emit(state.copyWith(
        hasPermission: hasPermission,
        isLoading: false,
      ));

      if (hasPermission) {
        await checkLocationStatus();
      }
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      final position = await _repository.getCurrentPosition();
      emit(state.copyWith(
        adress: '${position.latitude}, ${position.longitude}',
      ));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> openLocationSettings() async {
    await _repository.openLocationSettings();
  }
}
