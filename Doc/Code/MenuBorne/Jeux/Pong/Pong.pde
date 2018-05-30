float x,y; //Coordonée de la balle
int d;//Diamètre de la balle
int raquetteX,raquetteY; //Coordonée de la raquette du joueur
int longueurRaquette, largeurRaquette;
int vDeplacement; //"vitesse" de déplacement des Raquettes

float deplacementX;
float deplacementY;

int hautTerrain;
int basTerrain;
int gaucheTerrain;
int droiteTerrain;

int score=0;
boolean engagementP1;

static int record=0;

boolean menu=false;
boolean game=true;
int choixMenu=1;

boolean isUpJ1, isDownJ1;

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

  x=raquetteX-(d/2);
  y=height/2;
  score=0;
  
  menu=false;
  game=true;
  engagementP1=true;
 

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
    text("Score: "+score,width/2, height/12-7);
    affichageTerrain();
    strokeWeight(3);
    
    //affichage joueur
    rect(raquetteX,raquetteY,largeurRaquette,longueurRaquette);
    
    //afichage balle
    ellipse(x,y,d,d);
    
    if (engagementP1){
      y=raquetteY+longueurRaquette/2;
    }
    
    if(engagementP1==false){
      mouvementBalle();
    }
    rebond();
    goal();
    endGame();
  }
  
  if((!game)&&(!menu)){
    affichageEndGame();
  }
  
  if (isUpJ1 && raquetteY>=hautTerrain) raquetteY-=vDeplacement;
  if (isDownJ1 && raquetteY+longueurRaquette<=basTerrain) raquetteY+=vDeplacement;
  
}

void menu(){
  if(choixMenu==1){
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
      if(record<score){
        record=score;
      }
    }
    if((game)&&(!menu)){
      if((engagementP1)){
        engagementP1=false;
        deplacementX=random(-10,-7);
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
 
  default:
    return b;
  }
}