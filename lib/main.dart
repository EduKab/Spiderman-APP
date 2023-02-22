import 'package:flutter/material.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/routes.dart';
import 'package:practica1/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: theme.getthemeData(), 
        routes: getApplicationRoutes(), 
        home: LoginScreen());
  }
}
