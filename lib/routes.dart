import 'package:flutter/material.dart';
import 'package:practica1/screens/add_post_screen.dart';
import 'package:practica1/screens/dashboard_screen.dart';
import 'package:practica1/screens/event_screen.dart';
import 'package:practica1/screens/list_favorites_movies.dart';
import 'package:practica1/screens/list_marvel_characters.dart';
import 'package:practica1/screens/list_popular_videos.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:practica1/screens/register_screen.dart';
import 'package:practica1/screens/theme_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/login': (BuildContext context) => const LoginScreen(),
    '/register': (BuildContext context) => const RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),
    '/theme':(BuildContext context) => const ThemeScreen(),
    '/add_post' :(BuildContext context) => AddPostScreen(),
    '/popular' :(BuildContext context) => const ListPopularVideos(),
    '/favorites_movies' :(BuildContext context) => const ListFavoritesMovies(),
    '/marvel_characters' :(BuildContext context) => const ListMarvelCharacters(),
    '/events' :(BuildContext context) => EventScreen()
  };
}
