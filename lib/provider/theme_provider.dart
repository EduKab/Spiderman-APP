import 'package:flutter/material.dart';
import 'package:practica1/settings/styles_settings.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData? _themeData = StyleSettings.lightTheme();

  getthemeData() => this._themeData;
  setthemeData(ThemeData theme){
    this._themeData = theme;
    notifyListeners();
  } 
}