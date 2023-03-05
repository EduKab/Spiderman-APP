import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:practica1/provider/theme_provider.dart';
import 'package:practica1/settings/styles_settings.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  final spaceVertical = const SizedBox(
    width: 20,
  );
  final spaceHorizontal = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {

    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEC RED ;)"),
      ),
      body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              const Text('Seleccione el tema de la aplicacion:', style: TextStyle(fontSize: 20)),
              spaceHorizontal,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.red));
                    theme.color = Colors.red;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.blue));
                    theme.color = Colors.blue;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    ),
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.green));
                    theme.color = Colors.green;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, const Color.fromARGB(255, 243, 221, 24)));
                    theme.color = const Color.fromARGB(255, 243, 221, 24);
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 221, 24),
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ]),
              spaceHorizontal,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.purple));
                    theme.color = Colors.purple;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.orange));
                    theme.color = Colors.orange;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.pink));
                    theme.color = Colors.pink;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.black));
                    theme.color = Colors.black;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ]),
              spaceHorizontal,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.grey));
                    theme.color = Colors.grey;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.indigo));
                    theme.color = Colors.indigo;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.brown));
                    theme.color = Colors.brown;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                spaceVertical,
                GestureDetector(
                  onTap: (){
                    theme.setThemeData(StyleSettings.lightTheme(context, Colors.black));
                    theme.color = Colors.black;
                  },
                  child: Container(
                    height: 50, 
                    width: 50, 
                    decoration: BoxDecoration(
                      image: const DecorationImage(image: AssetImage('assets/color_custom.png'), fit: BoxFit.cover),
                      border: Border.all(width: 2, color: Colors.black),
                      borderRadius: const BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
              ])   
            ]
          ),
        ),
    );
  }
}