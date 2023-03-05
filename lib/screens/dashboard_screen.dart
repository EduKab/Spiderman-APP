import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  
  @override
  State<DashboardScreen> createState() => _DashBoardScreenState();
  
}

class _DashBoardScreenState extends State<DashboardScreen>{

  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("TEC RED ;)"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.zKzel4gap8hk_o2dG2ASMQHaFU?pid=ImgDet&rs=1"),
                ),
                accountName: Text('EduKab'),
                accountEmail: Text('edukab@outlook.com')),
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
            DayNightSwitcher( //Switch para cambiar el tema a blanco o oscuro.
              isDarkModeEnabled: isDarkModeEnabled,
              onStateChanged: (isDarkModeEnabled) {
                isDarkModeEnabled
                    ? theme.setThemeData(StyleSettings.darkTheme(context))
                    : theme.setThemeData(StyleSettings.lightTheme(context, theme.color));
                this.isDarkModeEnabled = isDarkModeEnabled;

                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
