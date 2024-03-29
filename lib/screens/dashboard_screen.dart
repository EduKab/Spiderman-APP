import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practica1/provider/github_sign_in_provider.dart';
import 'package:practica1/provider/google_sign_in.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/screens/list_post.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  
  @override
  State<DashboardScreen> createState() => DashBoardScreenState();

  
}

class DashBoardScreenState extends State<DashboardScreen>{

  bool isDarkModeEnabled = false;

  setIsDarkModeEnabled(value){
    isDarkModeEnabled = value;
  }

  @override
  Widget build(BuildContext context) {
    
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData){

          final user = FirebaseAuth.instance.currentUser!;

          return Scaffold(
            appBar: AppBar(
              title: const Text("TEC RED ;)"),
            ),
            body: const ListPost(),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: (){
                Navigator.pushNamed(context, '/add_post').then((value) {
                  setState(() {});
                });
              }, 
              label: const Text('Add Post'),
              icon: const Icon(Icons.add_comment),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(user.photoURL.toString()),
                      ),
                      accountName: Text(user.displayName.toString()),
                      accountEmail: Text(user.email.toString())),
                  const ListTile(
                    title: Text("Practica 1"),
                    subtitle: Text("Descripcion de la Practica 1"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Themes'),
                    subtitle: const Text('Change theme application'),
                    onTap: () {Navigator.pushNamed(context, '/theme');},
                    leading: const Icon(Icons.brush),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Events'),
                    subtitle: const Text('Show the events'),
                    onTap: () {Navigator.pushNamed(context, '/events');},
                    leading: const Icon(Icons.event),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Api Videos'),
                    subtitle: const Text('Show the videos'),
                    onTap: () {Navigator.pushNamed(context, '/popular');},
                    leading: const Icon(Icons.movie),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Favorite Movies'),
                    subtitle: const Text('Show favorite movies'),
                    onTap: () {Navigator.pushNamed(context, '/favorites_movies');},
                    leading: const Icon(Icons.favorite),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Marvel Characters'),
                    subtitle: const Text('Show marvel characters'),
                    onTap: () {Navigator.pushNamed(context, '/marvel_characters');},
                    leading: const Icon(Icons.spa_rounded),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    title: const Text('Maps'),
                    subtitle: const Text('Show Google Maps'),
                    onTap: () {Navigator.pushNamed(context, '/maps');},
                    leading: const Icon(Icons.map_rounded),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  DayNightSwitcher( //Switch para cambiar el tema a blanco o oscuro.
                    isDarkModeEnabled: isDarkModeEnabled,
                    onStateChanged: (isDarkModeEnabled) {
                      isDarkModeEnabled
                          ? theme.setThemeData(StyleSettings.darkTheme(context))
                          : theme.setThemeData(StyleSettings.lightTheme(context, theme.color));
                      this.isDarkModeEnabled = isDarkModeEnabled;
      
                      setState(() {});
                    },
                  ),
                  ListTile(
                    title: const Text('Exit'),
                    subtitle: const Text('Close profile'),
                    onTap: () {
                      GoogleSignInProvider provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogout();
                      Navigator.pushNamedAndRemoveUntil(context, '/login', ((route) => false));
                    },
                    leading: const Icon(Icons.close_rounded, color: Colors.red,),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          );
        } else if(snapshot.hasError){
          return Center(child: Text(snapshot.error.toString()),);
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else{
          Navigator.pop(context);
          return const Text('');
        }
      }
    );
  }
}