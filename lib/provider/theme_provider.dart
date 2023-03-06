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
    cargar(context);
  }

  getThemeData() => _themeData;

  setThemeData(ThemeData theme) {
    _themeData = theme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    pref ??= await SharedPreferences.getInstance();
  }
  _loadFromPrefs() async {
      await _initPrefs();
      _colorPref = pref?.getString('color') ?? 'red';
      print('AHORA EL COLOR PREFERIDO ES:');
      print(_colorPref);
      notifyListeners();
  }
  _saveToPrefs() async {
    await _initPrefs();
    print('Nuevo color:');
    print(colorToHex(color));
    switch (colorToHex(color)){
      case 'FF2196F3':
        pref?.setString('color', 'blue');
        break;
      case 'FF4CAF50':
        pref?.setString('color', 'green');
        break;
      case 'FFF3DD18':
        pref?.setString('color', 'yellow');
        break;
      case 'FF9C27B0':
        pref?.setString('color', 'purple');
        break;
      case 'FFFF9800':
        pref?.setString('color', 'orange');
        break;
      case 'FFE91E63':
        pref?.setString('color', 'pink');
        break;
      case 'FF000000':
        pref?.setString('color', 'black');
        break;
      case 'FF9E9E9E':
        pref?.setString('color', 'grey');
        break;
      case 'FF3F51B5':
        pref?.setString('color', 'indigo');
        break;
      case 'FF795548':
        pref?.setString('color', 'brown');
        break;
      //case 'default':
      //  pref?.setString('color', 'amarillo');
      //  break;
      default:
        pref?.setString('color', 'red');
        print('SE GUARDO ROJO');
    }
  }

  cargar(context) async {
    await _loadFromPrefs();
    switch(_colorPref){
      case 'blue':
        color = Colors.blue;
        print("Se va a pintar azul");
        break;
      case 'green':
        color = Colors.green;
        print("Se va a pintar verde");
        break;
      case 'yellow':
        color = Colors.yellow;
        print("Se va a pintar amarillo");
        break;
      case 'purple':
        color = Colors.purple;
        print("Se va a pintar morado");
        break;
      case 'orange':
        color = Colors.orange;
        print("Se va a pintar naranja");
        break;
      case 'pink':
        color = Colors.pink;
        print("Se va a pintar rosa");
        break;
      case 'black':
        color = Colors.black;
        print("Se va a pintar negro");
        break;
      case 'grey':
        color = Colors.grey;
        print("Se va a pintar gris");
        break;
      case 'indigo':
        color = Colors.indigo;
        print("Se va a pintar indigo");
        break;
      case 'brown':
        color = Colors.brown;
        print("Se va a pintar cafe");
        break;
      case 'darkTheme':
        print("Se va a pintar con el dark theme");
        break;
      default:
        color = Colors.red;
        print("Se va a pintar rojo");
    }

    _themeData = StyleSettings.lightTheme(context, color);
  }
}
