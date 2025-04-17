import 'package:geolocator/geolocator.dart';

abstract class IGeolocationService {
  Future<bool> checkLocationPermission();
  Future<bool> requestLocationPermission();
  Future<bool> isLocationEnabled();
  Future<void> openLocationSettings();
  Future<Position?> getCurrentPosition();
}

class GeolocationService implements IGeolocationService {
  final locSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 10,
  );

  @override
  Future<bool> checkLocationPermission() {
    return Geolocator.checkPermission().then(
      (permission) {
        return permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse;
      },
    );
  }

  @override
  Future<Position?> getCurrentPosition() {
    return Geolocator.getCurrentPosition(
      locationSettings: locSettings,
    ).then(
      (position) {
        return position;
      },
    ).catchError((error) {
      // Handle error if needed
      return null;
    });
  }

  @override
  Future<bool> isLocationEnabled() {
    return Geolocator.isLocationServiceEnabled().then(
      (isEnabled) {
        return isEnabled;
      },
    );
  }

  @override
  Future<void> openLocationSettings() {
    return Geolocator.openLocationSettings().then(
      (value) {},
    );
  }

  @override
  Future<bool> requestLocationPermission() {
    return Geolocator.requestPermission().then(
      (permission) {
        return permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse;
      },
    );
  }
}
