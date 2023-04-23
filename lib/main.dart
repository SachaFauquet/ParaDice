import 'package:flutter/material.dart';
import 'package:untitled/personnalise.dart';
import 'MyHomePage.dart';
import 'Splash.dart';
import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        routes: { //tout les routes des diferrent ecran
          '/': (context) => SplashScreen(),
          '/menu': (context) => MonMenu(),
          '/stats': (context) => MyHomePage(title: 'Statistique'),
          '/perso': (context) => PagePerso(),
        },
        initialRoute: '/'
    );
  }
}

