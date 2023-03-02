import 'dark_theme.dart';
import 'light_theme.dart';

// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
class AppTheme {
  AppTheme._();
  static final lightTheme = LightAppTheme.themeData;
  static final darkTheme = DarkAppTheme.themeData;
}
