import 'package:untitled/diceperso.dart';

import 'dice.dart';

class DicePoolPerso {
  List<Dice> _dices = []; // Liste de dés
  List<int> _res = []; // Liste pour stocker les résultats des lancés

  // Constructeur
  DicePoolPerso(DicePerso dices){
    _dices.add(dices);
  }

  // Méthode pour ajouter un dé à la liste
  void addDice(DicePerso dice) {
    _dices.add(dice);
  }

  // Méthode pour supprimer un dé de la liste
  void removeDice(DicePerso dice) {
    _dices.remove(dice);
  }

  void clearDice() {
    _dices.clear();
  }

  // Méthode pour lancer tous les dés dans la liste et retourner les résultats
  List<int> lanceDes() {
    _res.clear(); // Efface la liste res
    for (var dice in _dices) {
      int result = dice.lanceDice();
      _res.add(result); // Stocker le résultat
    }
    return _res;
  }

  // Méthode pour obtenir le résultat du dé au lancé spécifié par son index dans la liste
  int getResult(int i) {
    return _res[i];

  }
  //donne la liste de tout les resultat
  List getAllResult() {
    return _res;

  }
  //Méthode qui sert a obtenir la length
  int longeur() {
    int i=0;
    for (var dice in _dices) {
      i++;
    }
    return i;

  }
}