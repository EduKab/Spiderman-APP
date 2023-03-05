import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  String? _colorPref;
  Color color = Colors.black;
  SharedPreferences? pref;

  ThemeProvider(BuildContext context) {
    _loadFromPrefs();
    switch(_colorPref){
      case 'red':
        color = Colors.red;
        print("Se va a pintar rojo");
        break;
      case 'blue':
        color = Colors.blue;
        print("Se va a pintar azul");
        break;
      default:
        print('mmmmm');
    }
    print('creacion tema principal');
    _themeData = StyleSettings.lightTheme(context, color);
  }

  getThemeData() => _themeData;

  setThemeData(ThemeData theme) {
    _themeData = theme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(pref == null) {
      pref  = await SharedPreferences.getInstance();
    }
    print(pref?.getString('color'));
  }
  _loadFromPrefs() async {
      await _initPrefs();
      _colorPref = pref?.getString('color') ?? 'red';
      print("Color: ");
      print(_colorPref);
      notifyListeners();
  }
  _saveToPrefs() async {
    await _initPrefs();
    switch (colorToHex(color)){
      case 'FF2196F3':
        pref?.setString('color', 'blue');
        break;
      default:
        pref?.setString('color', 'red');
    }
  }
}
