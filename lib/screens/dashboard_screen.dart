import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEC RED ;)"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.zKzel4gap8hk_o2dG2ASMQHaFU?pid=ImgDet&rs=1"),),
              accountName: Text('EduKab'), 
              accountEmail: Text('edukab@outlook.com')),
            ListTile(
              title: Text("Practica 1"),
              subtitle: Text("Descripcion de la Practica 1"),
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.chevron_right),
            )
            ],
        ),
      ),
    );
  }
}
