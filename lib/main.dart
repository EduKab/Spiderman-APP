import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practica1/provider/flags_provider.dart';
import 'package:practica1/provider/github_sign_in_provider.dart';
import 'package:practica1/provider/google_sign_in.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/routes.dart';
import 'package:practica1/screens/board.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
        ChangeNotifierProvider(create: (_) => FlagsProvider()),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (_) => GithubSignInProvider()),
      ],
      child: const PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    GoogleSignInProvider().googleLogout();
    return MaterialApp(
        theme: theme.getThemeData(), 
        routes: getApplicationRoutes(), 
        home: Board()
    );
  }
}