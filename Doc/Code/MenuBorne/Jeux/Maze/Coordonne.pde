public class Coordonne{
  private int x;
  private int y;
  
  public Coordonne(){
    this.x=0;
    this.y=0;
  }
  
  public Coordonne(int a, int b){
    this.x=a;
    this.y=b;
  }
  
  public int getX(){
    return this.x;
  }
  
  public int getY(){
    return this.y;
  }
  
  public void setX(int a){
    this.x=a;
  }
  
  public void setY(int b){
    this.y=b;
  }
  
  public boolean equal(Coordonne c){
    return this.x==c.getX() && this.y==c.getY();
  }
  
}