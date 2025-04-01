import 'package:hive_flutter/hive_flutter.dart';
import '../constants.dart';

class ThemeStorageService {
  static const String _boxName = 'theme_box';
  static const String _themeKey = 'current_theme';

  static Future<Box> openBox() async {
    return await Hive.openBox(_boxName);
  }

  static Future<void> saveTheme(AppThemeType theme) async {
    final box = await openBox();
    await box.put(_themeKey, theme.index);
  }

  static Future<AppThemeType> loadTheme() async {
    final box = await openBox();
    final themeIndex = box.get(_themeKey, defaultValue: 0);
    return AppThemeType.values[themeIndex];
  }
}
