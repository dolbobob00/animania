part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  final bool hasPermission;
  final bool isLocationEnabled;
  final String? countryCode;
  final String? countryName;
  final String? adress;
  final bool isLoading;
  final String? error;

  const GeolocationState({
    this.adress,
    this.hasPermission = false,
    this.isLocationEnabled = false,
    this.countryCode,
    this.countryName,
    this.isLoading = false,
    this.error,
  });

  GeolocationState copyWith({
    bool? hasPermission,
    bool? isLocationEnabled,
    String? countryCode,
    String? countryName,
    bool? isLoading,
    String? error,
    String? adress,
  }) {
    return GeolocationState(
      adress: adress ?? this.adress,
      hasPermission: hasPermission ?? this.hasPermission,
      isLocationEnabled: isLocationEnabled ?? this.isLocationEnabled,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        hasPermission,
        isLocationEnabled,
        countryCode,
        countryName,
        isLoading,
        error,
        adress,
      ];
}
