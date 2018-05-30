void affichageMenu(){
  textSize(65);
  text("Que voulez-vous faire ?",width/2,height/4);
  textSize(40);
  text("Rejouer",width/2,height/2);
  text("Sauvegarder son score",width/2,2*height/3);
  text("Quitter",width/2,5*height/6);
  fill(255,0,0);
  if(choixMenu==1){
    text("Rejouer",width/2,height/2);
  }
  if(choixMenu==2){
    text("Sauvegarder son score",width/2,2*height/3);
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
  //rebond raquettePlayer
  if((deplacementX>0)&&(y>=raquetteY)&&(y<=raquetteY+longueurRaquette+d/2)&&(x<=raquetteX)&&(x>=raquetteX-(d/2))){
    deplacementX*=-1.01;
    deplacementY*=1.01;
  }
}



void goal(){
  if(x<gaucheTerrain+20){
    deplacementX*=-1.1;
    deplacementY*=1.1;
    score++;
  }
}

void endGame(){
  if(x>droiteTerrain-d/2){
    game=false;
  }
}

void affichageEndGame(){
  textAlign(CENTER);
  textSize(70);
  text("Game Over",width/2,height/4);
  if(record<score){
    textSize(50);
    text("Nouveau record : "+score,width/2,height/2);
  }
}

void save(){
  String[] save = new String[1];
  save[0] = "Votre meilleur score au Pong (solo) est de :"+ record;
  saveStrings("/home/user/Bureau/ProjetArduino/Borne/Menu_Borne/Jeux/Save/SavePongSolo/application.linux64/savePongSolo.txt",save);
  try{
    Runtime.getRuntime().exec("/home/user/Bureau/ProjetArduino/Borne/Menu_Borne/Jeux/Save/SavePongSolo/application.linux64/SavePongSolo");
  }catch(Exception e) {System.err.println(e);}
  //modifer les chemins de "saveStrings" et "exec" selon le chemin menant au dossier "Menu_Borne"
}
