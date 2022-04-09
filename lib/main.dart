import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:news/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData CurrentTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: "Montserrat",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CurrentTheme,
        home: HomePage(
          OnThemeSwitch: (IsLight) {
            if (IsLight == true) {setState(() {
               CurrentTheme = ThemeData(
                  fontFamily: "Montserrat", brightness: Brightness.dark);
              
            });
             

            } else {
              setState(() {
                CurrentTheme = ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: "Montserrat",
                brightness: Brightness.light
              );
              
              });
              
            }
           
          },
        ));
  }
}
