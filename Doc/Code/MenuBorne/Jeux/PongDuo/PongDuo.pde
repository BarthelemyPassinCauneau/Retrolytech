float x,y; //Coordonée de la balle
int d;//Diamètre de la balle
int raquetteX,raquetteY; //Coordonée de la raquette du joueur 1
int raquetteXJ2, raquetteYJ2;
int longueurRaquette, largeurRaquette;
int vDeplacement; //"vitesse" de déplacement des Raquettes

float deplacementX;
float deplacementY;

int hautTerrain;
int basTerrain;
int gaucheTerrain;
int droiteTerrain;

int scoreJ1=0;
int scoreJ2=0;
boolean engagementP1;
boolean engagementP2;

boolean menu=false;
boolean game=true;
int choixMenu=1;

boolean isUpJ1, isDownJ1; 
boolean isUpJ2, isDownJ2; 

void setup(){
  fullScreen();
  
  hautTerrain=height/10;
  basTerrain=9*height/10;
  gaucheTerrain=30;
  droiteTerrain=width-30;
  
  d=20;
  vDeplacement=20;
  
  longueurRaquette=height/5;
  largeurRaquette=width/100;
  raquetteY=(height-longueurRaquette)/2;
  raquetteX=width-100-largeurRaquette;
  
  raquetteYJ2=(height-longueurRaquette)/2;
  raquetteXJ2=100+largeurRaquette;
  
  menu=false;
  game=true;
 
  if(random(2)<=1) {
    engagementP1 = true;
    engagementP2 = false;
    x=raquetteX-(d/2);
    y=height/2;
  } else {
    engagementP1 = false;
    engagementP2 = true;
    x=raquetteXJ2+largeurRaquette+d/2;
    y=height/2;
  }
}

void draw(){
  background(0);
  
  fill(255);
  if(menu){
    affichageMenu();
  }
  
  if (game){
    //affichage score
    textSize(30);
    textAlign(CENTER);
    text("Score J1: "+scoreJ1,3*width/4, height/12-7);
    text("Score J2: "+scoreJ2,width/4, height/12-7);
    affichageTerrain();
    strokeWeight(3);
    
    //affichage joueur 1 et 2
    rect(raquetteX,raquetteY,largeurRaquette,longueurRaquette);
    rect(raquetteXJ2, raquetteYJ2, largeurRaquette, longueurRaquette);
    
    //afichage balle
    ellipse(x,y,d,d);
    
    if (engagementP2){
      y=raquetteYJ2+longueurRaquette/2;
    }
    if (engagementP1){
      y=raquetteY+longueurRaquette/2;
    }
        
    if(engagementP1==false && engagementP2==false){
      mouvementBalle();
    }
    rebond();
    goal();
  }
  
  if((!game)&&(!menu)){
    affichageEndGame();
  }
  
  //deplacement des raquettes
  if (isUpJ1 && raquetteY>=hautTerrain) raquetteY-=vDeplacement;
  if (isDownJ1 && raquetteY+longueurRaquette<=basTerrain) raquetteY+=vDeplacement;
  
  if (isUpJ2 && raquetteYJ2>=hautTerrain) raquetteYJ2-=vDeplacement;
  if (isDownJ2 && raquetteYJ2+longueurRaquette<=basTerrain) raquetteYJ2+=vDeplacement;
}

void goal(){
  if(x<gaucheTerrain){
    scoreJ1++;
    if(scoreJ2==5 || scoreJ1==5) {
      game = false;
      menu = false;
    } else {
      setup();
    }
  } else if(x>droiteTerrain-30){
    scoreJ2++;
    if(scoreJ2==5 || scoreJ1==5) {
      game = false;
      menu = false;
    } else {
      setup();
    }
  }
}

void menu(){
  if(choixMenu==1){
    scoreJ1=0;
    scoreJ2=0;
    setup();
  }
  if(choixMenu==2){
    save();
  }
  if(choixMenu==3){
    exit();
  }
}

void keyPressed(){
  if(key == 'z') {
    if(menu){
      if(choixMenu==1){
        choixMenu=3;
      }
      else{
        choixMenu--;
      }
    }
    if(game){
        setMove(key, true);
    }
  }
  
  if(key == 's') {
    if(menu){
      if(choixMenu==3){
        choixMenu=1;
      }
      else{
        choixMenu++;
      }
    }
    if(game){
      setMove(key, true);
    }
  }
  
  if (key=='o'){
    if(menu){
      if(choixMenu==1){
        choixMenu=3;
      }
      else{
        choixMenu--;
      }
    }
    if(game){
      setMove(key, true);
    }
  }

  
  if (key=='l'){
    if(menu){
      if(choixMenu==3){
        choixMenu=1;
      }
      else{
        choixMenu++;
      }
    }
    if(game){
      setMove(key, true);
    }
  }
  
  if (key==ENTER){
    if((menu)&&(!game)){
      menu();
    }
    if((!game)&&(!menu)){
      menu=true;
    }
    if((game)&&(!menu)){
      if(engagementP1){
        engagementP1=false;
        deplacementX=random(-10,-7);
        if(random(2)<=1){deplacementY=random(-7,-4);}
        else{deplacementY=random(4,7);}
      } else if(engagementP2){
        engagementP2=false;
        deplacementX=random(7,10);
        if(random(2)<=1){deplacementY=random(-7,-4);}
        else{deplacementY=random(4,7);}
      }
    }
  }
}
 
void keyReleased() {
  setMove(key, false);
}
 
boolean setMove(char k, boolean b) {
  switch (k) {
  case 'o':
    return isUpJ1 = b;
 
  case 'l':
    return isDownJ1 = b;
  
  case 'z':
    return isUpJ2 = b;
 
  case 's':
    return isDownJ2 = b;
 
  default:
    return b;
  }
}