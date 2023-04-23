import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/Dice10.dart';
import 'package:untitled/dice.dart';
import 'package:untitled/diceperso.dart';
import 'package:untitled/dicepoolperso.dart';

class PagePerso extends StatefulWidget {
  @override
  _Personnalise createState() => _Personnalise();
}

class _Personnalise extends State<PagePerso> {
  TextEditingController _textEditingController = TextEditingController();

  int _res = 1; //nombre de face
  List<double> _moyenne = [];
  bool _present = false; //sert a définir si le dé est déja present dans la liste ou non
  List _nbFace = []; //nombre de face
  List _NbDe = []; //nombre de dé
  List _rep = []; //reponse du tirage de tout les dé
  List _reprefait = []; // reponse trié pour chaque dé
  List<DicePoolPerso> _de = []; //liste de dé



  void DePerso(){ // ajoute le dé dans _nbFace et _NbDe
    _present = false;
    for(var i=0;i<_nbFace.length;i++){
      if(_nbFace[i]==_res){//si le dé existe il lui ajoute juste +1 dans NbDe
        _NbDe[i]+=1;
        _present = true;
      }
    }
    if(_present==false){ //si le dé n'existe pas dans la liste il l'ajouer
      _nbFace.add(_res);
      _NbDe.add(1);
    }
  }
  void ViderLesDe(){ //Sert a vider tout les variables qui servent
    setState(() {
      _moyenne.clear();
      _reprefait.clear();
      _de.clear();
      _rep.clear();
    _NbDe.clear();
    _nbFace.clear();
    });
  }
  void LanceDe(){ //lance les dé obtient les résultats et les regroupe pour les different dé
    setState(() {
      _rep.clear();
      _de.clear();
      for(var i=0;i<_NbDe.length;i++){
      if(_NbDe[i]==1){
        _de.add(DicePoolPerso(DicePerso(_nbFace[i]))); //si nombre de dé = 1 alors il ajoute un dicepool d'un dé avec le nombre correspondant
      }
      if(_NbDe[i]>1){
        for(var j=0;j<_NbDe[i];j++){
          _de.add(DicePoolPerso(DicePerso(_nbFace[i]))); // si il y a plus d'un dé alors il ajoue autant de dé dans le dicepool qu'il y en as dans le NbDé
        }
      }
    }

    for(var i=0;i<_de.length;i++){//lance chaque dé
      _rep.add(_de[i].lanceDes());
    }
      int index = 0;
      for (int nbDe in _NbDe) {
        List sublist = _rep.sublist(index, index + nbDe);//methode comme substring mais pour les liste qui permet de découper la liste des réponse par rapport a Nbde
        _reprefait.add(sublist);
        index += nbDe;
      }
      for (List sublist in _reprefait) {//fait la moyenne
        double moyenne = 0;
        int somme = 0;


        for (int i = 0; i < sublist.length; i++) { //ajouter chaque resultat de dé dans somme
          somme += int.parse(sublist[i][0].toString());

        }

        moyenne = somme / sublist.length;  //calcule la moyenne
        _moyenne.add(moyenne);

      }


    });
  }
  void D6(){//ajouter un dé de 6
    setState(() {
      _res=6;
      DePerso();
    });
  }
  void D10(){//ajouter un dé de 10
    setState(() {
      _res=10;
      DePerso();
    });
  }
  void D20(){//ajouter un dé de 20
    setState(() {
      _res=20;
      DePerso();
    });
  }
  void D100(){//ajouter un dé de 100
    setState(() {
      _res=100;
      DePerso();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dé personnalisé'),
        backgroundColor: Colors.green,
      ),
      body: Column(
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
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.all(16.0)
              ),
              Expanded(
                child: TextField( //champ pour écrire du texte
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))], //permet de ne mettre que chiffre
                  decoration: InputDecoration(
                    hintText: 'Entrez un nombre de face',
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(16.0)
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: () {
                  setState(() {
                    _res = int.parse(_textEditingController.text); //boutton qui envoie le chiffre du champs de texte dans la variable res
                  });
                  DePerso();
                },
                child: Text('Ajouter le dé'),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.only(bottom: 20.0)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed:D6,
                child: Text('D6'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: D10,
                child: Text('D10'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: D20,
                child: Text('D20'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: D100,
                child: Text('D100'),
              ),
              const Padding(
                  padding: EdgeInsets.only(bottom: 50.0)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: ViderLesDe,
                child: Text('Vider le pool des dés'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.green,
                  onSurface: Colors.red,
                ),
                onPressed: LanceDe,
                child: Text('Lancer les dés'),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Les resultat"),

            ],
          ),
          Row(
            children: <Widget>[

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(
                     "nb de Face",
                      style: TextStyle(fontSize: 12),
                    ),
                  for(var i=0;i<_nbFace.length;i++)
                    Text(
                      _nbFace[i].toString(),
                      style: TextStyle(fontSize: 12),
                    ),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0)
                  ),
                  Text(
                    "nb de dé",
                    style: TextStyle(fontSize: 12),
                  ),
                  for(var i=0;i<_NbDe.length;i++)
                    Text(
                      _NbDe[i].toString(),
                      style: TextStyle(fontSize: 12),
                    ),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Résultat",
                    style: TextStyle(fontSize: 12),
                  ),
                  for(var i=0;i<_reprefait.length;i++)
                  Row(
                    children: [
                        Text(
                          _reprefait[i].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                    ],
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(left: 100.0)
                  ),
                  Text(
                    "Moyenne",
                    style: TextStyle(fontSize: 12),
                  ),
                  for(var i=0;i<_moyenne.length;i++)
                    Row(
                      children: [
                        Text(
                          _moyenne[i].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                ],
              )
            ],
          )
        ],

      ),
    );
  }
}