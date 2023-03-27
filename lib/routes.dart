import 'package:flutter/material.dart';
import 'package:practica1/screens/add_post_screen.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/event_screen.dart';
import 'package:practica1/screens/register_screen.dart';
import 'package:practica1/screens/theme_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash':(BuildContext context) => const DashboardScreen(),
    '/theme':(BuildContext context) => const ThemeScreen(),
    '/add_post' :(BuildContext context) => AddPostScreen(),
    //'/popular' :(BuildContext context) => const ListPopularVideos(),
    '/events' :(BuildContext context) => const EventScreen()
  };
}
