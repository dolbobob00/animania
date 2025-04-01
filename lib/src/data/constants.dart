enum AppThemeType {
  orange,
  purple,
  // Add more themes here as needed
}

extension AppThemeTypeExtension on AppThemeType {
  String get name {
    switch (this) {
      case AppThemeType.orange:
        return 'Orange';
      case AppThemeType.purple:
        return 'Purple';
      default:
        return 'Unknown';
    }
  }
}
