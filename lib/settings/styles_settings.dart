import 'package:flutter/material.dart';

class StyleSettings{

  static ThemeData lightTheme(BuildContext context, Color color) {
    final theme = ThemeData.light();
    return theme.copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: color
    ));
  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: const Color.fromARGB(255, 81, 82, 81)
    ));
  }
}