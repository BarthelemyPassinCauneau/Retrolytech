import java.util.*;


//Largeur d'une case
int cst=32;

//Déclarations des variables de resources graphique
String background = "Res_Maze/Background/";
PImage floor, frontWall, upWall;

Personnage player1, player2; //Déclaration des personnages
int x1, x2, y1, y2; //Position x,y des personnages
int xMapP1, xMapP2, yMap;
PImage[] animPlayer1, animPlayer2;

Map map1;
ArrayList<Map> allMap;


String[] limMapP1; 
String[] limMapP2; 
int currentMap = 0;

boolean debLvl=true;
boolean finLvl=false;
boolean endGame=false;

PGraphics map1P1, map1P2;
PGraphics currentMapP1, currentMapP2;

boolean upP1,downP1,rightP1,leftP1,upP2,downP2,rightP2,leftP2;

void setup(){
  fullScreen();
  allMap = new ArrayList();
  
  xMapP1 = width/20;
  xMapP2 = xMapP1 + width/2;
  yMap = height/4;
  
  //Chargement des Textures des Murs et sol
  floor = loadImage(background+"Floor.png");
  frontWall = loadImage(background+"Wall_Front.png");
  upWall = loadImage(background+"Wall_Up.png");
  
  //Création des Maps
  map1 = new Map(1,new Coordonne(13,13), new Coordonne(9,13), new Coordonne(14,11), new Coordonne(0,13));
  
  allMap.add(map1);
  
  
  //Création et chargement des skins des Joueurs
  player1 = new Personnage(0,0,"Kira");
  player2 = new Personnage(0,0,"Quernel");
  
  
  
    
  
}



void draw(){
  background(0);
  
  
  if(debLvl){beginLvl();}
  else{finLvl = lvlIsFinished();}
  
  
  
  if(!finLvl){
    image(currentMapP1, xMapP1, yMap);
    image(currentMapP2, xMapP2, yMap);
    player1.display(1);
    player2.display(2);
    
    
    delay(50);
    move();
  }
  else{
    textSize(30);
    endGame = gameEnded();
    if(endGame){
      text("Bien joué, vous avez réussi tout les niveaux",xMapP1,yMap);
    }
    else{
      text("Vous avez fini le niveau "+currentMap,xMapP1,yMap);
    }
  }
  
}



void keyPressed(){
  if(keyCode==ENTER){
    if(finLvl && !endGame){
      currentMap++;
      finLvl=false;
      debLvl=true;
    }
    else if(endGame){exit();}
  }
  
  setMove(key,true);
}

void keyReleased(){
  setMove(key,false);
}

boolean setMove(char c, boolean b) {
  switch (c) {
  case 'o':
    return upP2 = b;
 
  case 'l':
    return downP2 = b;
    
  case 'k':
    return leftP2 =b;
    
  case 'm':
    return rightP2 =b;
  
  case 'z':
    return upP1 = b;
 
  case 's':
    return downP1 = b;
    
  case 'q':
    return leftP1 =b;
    
  case 'd':
    return rightP1 =b;
 
  default:
    return b;
  }
}