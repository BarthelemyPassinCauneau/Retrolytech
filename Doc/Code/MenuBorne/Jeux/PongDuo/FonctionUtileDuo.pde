void affichageMenu(){
  textSize(65);
  text("Que voulez-vous faire ?",width/2,height/4);
  textSize(40);
  text("Rejouer",width/2,height/2);
  text("Sauvegarder le score",width/2,2*height/3);
  text("Quitter",width/2,5*height/6);
  fill(255,0,0);
  if(choixMenu==1){
    text("Rejouer",width/2,height/2);
  }
  if(choixMenu==2){
    text("Sauvegarder le score",width/2,2*height/3);
  }
  if(choixMenu==3){
    text("Quitter",width/2,5*height/6);
  }
}

void affichageTerrain(){
  stroke(255);
  strokeWeight(7);
  line(30,height/10-7,width-30,height/10-7); //haut
  line(30,9*height/10+7,width-30,9*height/10+7); //bas
  line(30,height/10-7,30,9*height/10+7); //gauche
  line(width-30,height/10-7,width-30,9*height/10+7);//droite
}

void mouvementBalle(){
  x+=deplacementX;
  y+=deplacementY;
}

void rebond(){
  //Rebond haut du terrain
  if((y<=hautTerrain+d/2)&&(x>gaucheTerrain)&&(deplacementY<0)){
    deplacementY*=-1;
  }
  
  //Rebond bas Terrain
  if((y>=basTerrain-d/2)&&(x>gaucheTerrain)&&(deplacementY>0)){
    deplacementY*=-1;
  }
  
  //rebond raquettePlayer1
  if((y>=raquetteY)&&(y<=raquetteY+longueurRaquette+d/2)&&(x<=raquetteX)&&(x>=raquetteX-d/2)){
    deplacementX*=-1.1;
    deplacementY*=1.1;
  }
  
  //rebond raquettePlayer2
  if((y>=raquetteYJ2)&&(y<=raquetteYJ2+longueurRaquette+d/2)&&(x<=raquetteXJ2+largeurRaquette+d/2)&&(x>=raquetteXJ2+largeurRaquette)){
    deplacementX*=-1.1;
    deplacementY*=1.1;
  }
}

void affichageEndGame(){
  textAlign(CENTER);
  textSize(70);
  text("Partie terminée",width/2,height/4);
  if(scoreJ2<scoreJ1){
    textSize(50);
    text("Le joueur 1 a gagné",width/2,height/2);
  } else {
    textSize(50);
    text("Le joueur 2 a gagné",width/2,height/2);
  }
}


void save(){
  String[] save = new String[4];
  String res;
  save[0] = "Le score de la partie de Pong est : \n";
  save[1] = "J1 : " + scoreJ1 +"\n";
  save[2] = "J2 : " + scoreJ2 +"\n";
  
  if(scoreJ1>scoreJ2){res = "Le joueur 1 a gagné la partie\n";}
  else{res = "Le joueur 2 a gagné la partie\n";}
  
  save[3] = res;
  saveStrings("/home/user/Bureau/ProjetArduino/Borne/Menu_Borne/Jeux/Save/SavePongDuo/application.linux64/savePongDuo.txt",save);
  try{
    Runtime.getRuntime().exec("/home/user/Bureau/ProjetArduino/Borne/Menu_Borne/Jeux/Save/SavePongDuo/application.linux64/SavePongDuo");
  }catch(Exception e) {System.err.println(e);}
  
}