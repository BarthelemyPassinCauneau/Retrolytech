# Journal de bord
#### 20 Décembre 2017
Début du projet, j'ai cherché la matériel nécessaire à l'élaboration du projet, ainsi que crée mon propre compte sur GitHub.
#### 12 Janvier 2018
J'ai installé Processing sur la Raspberry Pi, ainsi que cherché le matériel nécessaire à l'élaboration de la borne d'arcade.
#### 19 Janvier 2018
Nous avons reçu nos joysticks, nos boutons ainsi qu'un encodeur USB. J'ai donc cherché comment les brancher et les utiliser.
#### 23 Janvier 2018
Nous avons fait la présentation de notre projet, ainsi qu'une réparation de ma Raspberry qui était tombée en panne. De plus nous avons discuté de la forme de notre borne d'arcade, ainsi que de la possibilité de commander un nouvel écran.
De plus j'ai trouvé un logiciel, Antimicro, capable de reconnaitre l'encodeur USB des boutons/joysticks et permettant d'associer ces derniers à une touche du clavier.
#### 6 Février 2018
J'ai continué à chercher un OS permettant d'installer Processing et Antimicro, sans succès. Nous avons fait une liste des jeux possibles à faire, ainsi que cherché un nouvel écran pour notre borne d'arcade.
#### 22 Février 2018
J'ai enfin réussi à trouver un OS sur la Raspberry capable de faire tourner Antimicro et Processing. Puisque Grégory avait déja codé un pong de son côté, nous avons pu lancer notre premier jeu sur notre borne d'arcade.
Nous avons également décidé la liste précise des jeux que nous allons faire, ainsi que commandé un écran.
#### 15 Mars 2018
Grégory et moi avons commencé la programmation du labyrinthe : 
Nous avons décidé de nous répartir les tâches (en attendant l'écran de notre borne d'arcade), je m'occupe de créer les labyrinthes et Grégory s'occupe du code.
#### 27 Mars 2018
Après notre passage à l'oral, j'ai continué à coder le programme permettant de construire les labyrinthes pour notre jeu MazeForMates. Ce sera une applet sur Processing où une interface s'affiche avec des cases grises dedans: il suffira de cliquer sur la case désirée pour avoir un mur, d'enregistrer, et un fichier se créera avec des boolean dedans (si on a un mur => false, si on peut marcher => true)
#### 4 Avril 2018
Nous avons reçu notre écran pour notre borne d'arcade. Etant donné que notre ancien écran n'aurait plus aucune utilité, je l'ai rendu. De plus, j'ai corrigé les problèmes d'affichages du jeu Pong sur notre nouvel écran et débeugé le jeu pour qu'il soit optimal. Ainsi, la version du jeu pour 2 joueurs ne prendra que quelques minutes...
#### 17 Avril 2018
Aujourd'hui, nous avons discuté avec Mr Masson pour trouver une solution concernant la partie connectée de la borne. En effet Processing ne permet pas d'interargir avec le Bluetooth/Wifi. Une possiblité serait de faire tourner un programme externe en Java qui attende qu'un fichier apparaisse et l'envoie par Wifi ou Bluetooth.
De plus j'ai commencé à créer la borne: j'ai fini de m'occuper de la planche qui accueillera les bouton/joysticks et presque fini le jeu du Pong pour 2 joueurs.
