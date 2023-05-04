# ParaDice

Le projet est une application Flutter qui permet de manipuler des dé ou liste de dé avec moyenne des lancées 

Voici une vidéo de l'application en marche [ici](https://youtu.be/B0cHh-s9QCI)

et voici quelques screen de l'application en elle meme:


## Explication du Code

Le programme utilise des Classe abstraite

Explication des fichiers :
dice.dart :
	Fichier qui contient  la classe abstraite Dice qui permet de crée et lancer un dé 

dice6.dart :
	Hérite de la classe Dice permet d’avoir un dé a 6 faces
	
dice10.dart :
	Hérite de la classe Dice permet d’avoir un dé a 10 faces
	
dice20.dart :
	Hérite de la classe Dice permet d’avoir un dé a 20 faces
	
dice100.dart :
	Hérite de la classe Dice permet d’avoir un dé a 100 faces
	
diceperso.dart :
	Hérite de la classe Dice permet d’avoir un dé a face personnalisé
	
dicepool.dart :
	Fichier qui contient  la classe abstraite DicePool qui permet de crée et lancer une liste dé 
	
dicepool6.dart :
	Hérite de la classe DicePool permet d’avoir une liste de dé a 6 faces
	
dicepool10.dart :
	Hérite de la classe DicePool permet d’avoir une liste de dé a 10 faces
	
dicepool20.dart :
	Hérite de la classe DicePool permet d’avoir une liste de dé a 20 faces
	
dicepool100.dart :
	Hérite de la classe DicePool permet d’avoir une liste de dé a 100 faces
	
main.dart :
	Ce fichier est la base de l’application flutter
	
menu.dart :
	Le menu de l’application flutter 
	
myhomepage.dart :
	Le page qui permet de lancer des dé de 6,10,20 ou 100 face  
	
personnalise.dart :
	La page qui permet de faire des dé personnalise
	
Splash.dart :	
	L’écran de chargement au lancement de l’appli 
	
