import 'package:flutter/material.dart';

import 'MyHomePage.dart';

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
); //style de bouton


class MonMenu extends StatefulWidget {
  @override
  _MonMenuState createState() => _MonMenuState();
}

class _MonMenuState extends State<MonMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon application'),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Mon menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Accès aux statistique'),
              onTap: () {
                Navigator.pushNamed(context, '/stats');
              },
            ),
            ListTile(
              title: Text('Acces aux dé personnalisés'),
              onTap: () {

                Navigator.pop(context); // Ferme le drawer
              },
            ),
            ListTile(
              title: Text('Fermer'),
              onTap: () {

                Navigator.pop(context); // Ferme le drawer
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
            const Padding(
                padding: EdgeInsets.all(16.0)
            ),
          ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // changer la couleur de fond en rouge
        ),
    onPressed: () { Navigator.pushNamed(context, '/stats');},
    child: Text('Accès aux statistique'),
    ),
            const Padding(
                padding: EdgeInsets.all(16.0)
            ),

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // changer la couleur de fond en rouge
              ),
              onPressed: () { Navigator.pushNamed(context, '/perso');},
              child: Text('Accès aux dé personnalisé'),
            ),
          ]
        )
      )
    );
  }
}