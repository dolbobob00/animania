import 'package:geolocator/geolocator.dart';

abstract class IGeolocationRepository {
  Future<Position> getCurrentPosition();
  Future<bool> checkPermission();
  Future<bool> requestPermission();
  Future<bool> isLocationEnabled();
  Future<void> openLocationSettings();
}

class GeolocationRepository implements IGeolocationRepository {
  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || 
           permission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always || 
           permission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> isLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }
}
