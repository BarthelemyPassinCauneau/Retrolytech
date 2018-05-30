import java.lang.Runtime;

PFont main;
Jeu pongSolo, pongDuo, maze;
int tailleImage=300;
//int choixJeuxX=0;
//int choixJeuxY=0;
int selectedGame=0;
int nbJeux=0;

//Jeu[][] grilleJeux=new Jeu[5][6];//A modifier dès qu'on ajoute un nouveau jeu 
ArrayList<Jeu> allGames = new ArrayList<Jeu>();

//Début setup
void setup(){
  fullScreen();
  main=createFont("Turnpike.ttf",60);
  pongSolo=new Jeu("pong.png","Pong");
  pongDuo=new Jeu("pong.png","PongDuo");
  maze = new Jeu("Maze.jpeg","Maze");
  
  allGames.add(pongSolo);
  allGames.add(pongDuo);
  allGames.add(maze);
  
  
  //remplissageGrille(allGames);
}//Fin setup



//Début draw
void draw(){
  background(0);
  fill(255);
  textFont(main);
  text("RETROLYTECH",width/5,height/10);
  
  textSize(50);
  affichage(selectedGame);
  
}//Fin Draw


//Début keyPressed
void keyPressed(){
  
  if(key=='k' || key=='q'){
    if(selectedGame==0){
      selectedGame = allGames.size()-1;
    }
    else{selectedGame--;}
  }
  
  if(key=='m' || key=='d'){
    if(allGames.size()-1 == selectedGame){
      selectedGame = 0;
    }
    else{selectedGame++;}
  
  }
  
  if(keyCode==ENTER){
    
    try{
      String commande=allGames.get(selectedGame).getCommandLine();
      Runtime.getRuntime().exec(commande);
    }
    catch(Exception e){System.err.println(e);}
  }
  
}//Fin keyPressed


void affichage(int s){
  image(allGames.get(s).getImage(), width/3, height/4 , tailleImage, tailleImage);
  text(allGames.get(s).getNom(), width/3, height/4+(7*tailleImage/6));
}
