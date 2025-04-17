import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/country_model.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(const UserInfoState());

  void setCountry(CountryModel country) {
    emit(state.copyWith(selectedCountry: country));
  }

  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setIsAgreedWithConfRules(bool value) {
    emit(state.copyWith(confRules: value));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  void setPhoneNumber(String phoneNumber) {
    emit(state.copyWith(phoneNumber: phoneNumber));
  }
}
