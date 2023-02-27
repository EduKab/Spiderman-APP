import 'package:flutter/material.dart';
import 'package:practica1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  ThemeProvider(BuildContext context) {
    _themeData = StyleSettings.lightTheme(context);
  }

  getThemeData() => _themeData;
  setThemeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
