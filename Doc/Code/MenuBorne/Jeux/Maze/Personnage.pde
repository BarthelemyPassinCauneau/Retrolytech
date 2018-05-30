public class Personnage{
  
  protected String path;
  protected Coordonne c;
  protected PImage p;
  protected String apparence[] = new String[12];
  protected PImage anim[] = new PImage[12];
  
  public Personnage(int a,int b, String name){
    this.c = new Coordonne(a,b);
    this.path="Res_Maze/Perso/"+name;
    this.p = loadImage(path+"/back.png");
    apparence[0] = path+"/back.png";
    apparence[1] = path+"/backwalk1.png";
    apparence[2] = path+"/backwalk2.png";
    apparence[3] = path+"/front.png";
    apparence[4] = path+"/frontwalk1.png";
    apparence[5] = path+"/frontwalk2.png";
    apparence[6] = path+"/left.png";
    apparence[7] = path+"/leftwalk1.png";
    apparence[8] = path+"/leftwalk2.png";
    apparence[9] = path+"/right.png";
    apparence[10] = path+"/rightwalk1.png";
    apparence[11] = path+"/rightwalk2.png";
    for(int i=0; i<12;i++){
      anim[i]=loadImage(apparence[i]);
      anim[i].resize(32,32);
    }
  }
  
  public Coordonne getCoor(){return this.c;}
  
  public void changeImg(String pos){
    if(pos.equals("back") || pos.equals("front") || pos.equals("right") || pos.equals("left")){
      this.p = loadImage(path+"/"+pos+".png");
    }
  }
  
  public void setCoor(Coordonne t){
    c.setX(t.getX());
    c.setY(t.getY());
  }
  
  public PImage[] getAnim(){
    return this.anim;
  }
  
  public void display(int as){ //as represente si c'est le joueur 1 ou 2
    int xMap;
    if(as==1){xMap = xMapP1;}
    else{xMap = xMapP2;}
    image(this.p,xMap+this.c.getX()*cst,yMap+this.c.getY()*cst,cst,cst);
  }
  
  
}