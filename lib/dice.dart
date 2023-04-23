import 'dart:math';

abstract class Dice {
  int _nbFaces; // Nombre de faces du dé
  int _result=0; // Variable pour stocker le résultat du lancé

  // Constructeur
  Dice(this._nbFaces);

  // Méthode  pour lancer le dé
  int lanceDice() {
    Random random = Random();
    _result = random.nextInt(_nbFaces) + 1; // Stocker le résultat dans la variable _result
    return _result;
  }

  // Méthode pour obtenir le résultat du dé au lancé précédent
  int getResult() {
    return _result;
  }
}