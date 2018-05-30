public class Map{
  private int num;
  private String fichierP1;
  private String fichierP2;
  private String[] bMapP1; //Map sous forme de Boolean du Joueur 1
  private String[] bMapP2; //Map sous forme de Boolean du Joueur 2
  private PGraphics mapP1;
  private PGraphics mapP2;
  
  private Coordonne debP1, debP2;
  private Coordonne finP1, finP2;
  
  public Map(int nv, Coordonne d1, Coordonne d2, Coordonne f1, Coordonne f2){
    this.num = nv;
    this.fichierP1 = "Map/j1Lvl"+nv+".txt";
    this.fichierP2 = "Map/j2Lvl"+nv+".txt";
    this.bMapP1 = loadStrings(this.fichierP1);
    this.bMapP2 = loadStrings(this.fichierP2);
    this.mapP1 = convertMap(this.bMapP1);
    this.mapP2 = convertMap(this.bMapP2);
    this.debP1=d1;
    this.debP2=d2;
    this.finP1=f1;
    this.finP2=f2;
  }
  
  
  
  public int getNum(){return this.num;}
  
  public String[][] getBooleanMaps(){
    String[][] res = new String[2][];
    res[0] = this.bMapP1;
    res[1] = this.bMapP2;
    return res;
  }
  
  public PGraphics[] getMaps(){
    PGraphics[] res = new PGraphics[2];
    res[0] = this.mapP1;
    res[1] = this.mapP2;
    return res;
  }
 
  public Coordonne[] getCoordDeb(){
    Coordonne[] res = new Coordonne[2];
    res[0] = this.debP1;
    res[1] = this.debP2;
    return res;
  }
  
  public Coordonne[] getCoordFin(){
    Coordonne[] res = new Coordonne[2];
    res[0] = this.finP1;
    res[1] = this.finP2;
    return res;
  }
  
}