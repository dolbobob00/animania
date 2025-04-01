import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/services/theme_storage_service.dart';
import '../../data/constants.dart';

class ThemeCubit extends Cubit<AppThemeType> {
  ThemeCubit() : super(AppThemeType.orange) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final theme = await ThemeStorageService.loadTheme();
    emit(theme);
  }

  Future<void> changeTheme(AppThemeType theme) async {
    await ThemeStorageService.saveTheme(theme);
    emit(theme);
  }
}
