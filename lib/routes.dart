import 'package:flutter/material.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash':(BuildContext context) => const DashboardScreen() 
  };
}
