part of 'user_info.dart';

class UserInfoState extends Equatable {
  final CountryModel? selectedCountry;
  final String? email;
  final String? password;
  final bool confRules;
  final String? phoneNumber;

  const UserInfoState({
    this.confRules = false,
    this.selectedCountry,
    this.phoneNumber,
    this.email,
    this.password,
  });

  UserInfoState copyWith({
    CountryModel? selectedCountry,
    String? email,
    String? password,
    bool? confRules,
    String? phoneNumber,
  }) {
    return UserInfoState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      confRules: confRules ?? this.confRules,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [selectedCountry, email, password, confRules,phoneNumber];
}
