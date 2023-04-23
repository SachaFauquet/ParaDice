
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'MyHomePage.dart';
import 'menu.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () { //ecran de chargement qui dure 3 sec
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MonMenu()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.green, // couleur de fond verte
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'Assets/Images/paradice_logo.png',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
