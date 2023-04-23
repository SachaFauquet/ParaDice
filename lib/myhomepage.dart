import 'package:flutter/material.dart';
import 'package:untitled/Dice10.dart';
import 'package:untitled/dice100.dart';
import 'package:untitled/dice20.dart';
import 'package:untitled/dice6.dart';
import 'package:untitled/dicepool10.dart';
import 'package:untitled/dicepool100.dart';
import 'package:untitled/dicepool20.dart';
import 'package:untitled/dicepool6.dart';
import 'dice.dart';
import 'dicepool.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1; //nbr de dé
  int _res =0;
  List _allres= []; //tout les resultat des tirage de dé
  int _nbrfacede=6; //nbr de face du dé
  List _listede = [Dicepool6(),Dicepool10(),Dicepool20(),Dicepool100()];
  int _nbrlistede =0; //numero qui defini si c'est un D6,D10...
  List _rep=[]; // liste du nombre de 1,2,3,4...
  double _moyenne=0; //comme sont nom l'indique

  void _dePlusUn() {
    setState(() {
      _counter++;
    });
  }

  void _dePlus10() {
    setState(() {
      _counter = _counter + 10;
    });
  }

  void _deMoins10() {
    setState(() {
      if (_counter > 10) {
        _counter = _counter - 10;
      } else {
        _counter = 1;
      }
    });
  }

  void _deMoins1() {
    setState(() {
      if (_counter != 1) {
        _counter = _counter - 1;
      }
    });
  }

  void _MettreAUn() {
    setState(() {
      _counter = 1;
    });
  }

  void _lancede() { //methode qui lance 1 seul dé (inutile ici)
    Dice6 de = Dice6();
    de.lanceDice();
    setState(() {
      _res = de.getResult();
    });
  }
  void _lancelistede(){//lance la liste de dé
    _rep.clear();
    _nbrrep();
    _nbrde();
    _moyenne=0;
    _listede[_nbrlistede].lanceDes();
    _allres = _listede[_nbrlistede].getAllResult();
    for(var i=0;i<_allres.length;i++){
      _rep[_listede[_nbrlistede].getResult(i)-1]+=1; //fait la liste du nombre de 1,2,3,4...
      _moyenne=_moyenne+_allres[i]; //ajoute toutes les reponses
    }
    _moyenne = _moyenne/_counter;
    setState(() {

      _moyenne;
    });

  }
  void _nbrrep(){ //initialise le tableau avec le nombre de reponse si c'est un dé de 6 faces le tableau = [0,0,0,0,0,0]
    setState(() {
      while (_rep.length != _nbrfacede) {
        if (_rep.length < _nbrfacede) {
          _rep.add(0);
        } else {
          _rep.remove(0);
        }
      }
    });
  }
  void _nbrde(){ //met a jour le nombre de dé par rapport au nombre demandé ici _counter
    setState(() {
      while (_listede[_nbrlistede].longeur() != _counter) {
        if (_listede[_nbrlistede].longeur() < _counter) {
          if(_nbrlistede==0){
            _listede[_nbrlistede].addDice(Dice6());
          }
          if(_nbrlistede==1){
            _listede[_nbrlistede].addDice(Dice10());
          }
          if(_nbrlistede==2){
            _listede[_nbrlistede].addDice(Dice20());
          }
          if(_nbrlistede==3){
            _listede[_nbrlistede].addDice(Dice100());
          }

        }
        if(_listede[_nbrlistede].longeur() > _counter){
          _listede[_nbrlistede].clearDice();
        }
      }
    });
  }
  void _D6(){//crée un dé 6 faces
    setState(() {
      _nbrfacede = 6;
      _nbrlistede = 0;
    });
  }
  void _D10(){//crée un dé 10 faces
    setState(() {
      _nbrfacede = 10;
      _nbrlistede = 1;
    });
  }
  void _D20(){ //crée un dé 20 faces
    setState(() {
      _nbrfacede = 20;
      _nbrlistede = 2;
    });
  }
  void _D100(){ //crée un dé 100 faces
    setState(() {
      _nbrfacede = 100;
      _nbrlistede = 3;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _D6,
                  child: Text('D6'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _D10,
                  child: Text('D10'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.pink,
                  ),
                  onPressed: _D20,
                  child: Text('D20'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _D100,
                  child: Text('D100'),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _deMoins10,
                  child: Text('-10'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _deMoins1,
                  child: Text('-1'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.pink,
                  ),
                  onPressed: _MettreAUn,
                  child: Text('1'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _dePlusUn,
                  child: Text('+1'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.green,
                    onSurface: Colors.red,
                  ),
                  onPressed: _dePlus10,
                  child: Text('+10'),
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(16.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'le nombre de dé est :$_counter',
                        style: TextStyle(fontSize: 30),
                      ),
                      const Padding(
                          padding: EdgeInsets.all(16.0)
                      ),
                      const Text(
                        'Les resultat :',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ]),
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(16.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for(var i=1;i<(_rep.length+1)/2;i++)
                      Text(
                        "nombre de $i : "+ _rep[i-1].toString(),
                        style: TextStyle(fontSize: 12),
                      ),

                  ],
                ),
                Column(
                  children: <Widget>[
                    for(double i=(_rep.length/2)+1;i<_rep.length+1;i++)
                      Text(
                        "  nombre de "+(i.toInt()).toString() +": "+ _rep[(i-1).toInt()].toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                  ],
                ),
              ],
            ),
            Text(
              'Moyenne $_moyenne  ',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _lancelistede,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
