abstract class Bouton{
  protected boolean activated=false;
  protected String type;
  
  
  public Bouton(String s){
    this.type=s;
  }
  
  public boolean isActivated(){
    return this.activated;
  }
  
  public String isType(){
    return this.type;
  }

}
//--------------------------------------------------------------------------------------------------------------------------
public class Classic extends Bouton{
  
  public Classic(){
    super("Classic");
  }
}
//--------------------------------------------------------------------------------------------------------------------------
public class Timer extends Bouton{
  private int time;
  
  public Timer(int t){
    super("Timer");
    this.time=t;
  }
  
  public int getTime(){
    return this.time;
  }
}
//--------------------------------------------------------------------------------------------------------------------------
public class Push extends Bouton{
  
  public Push(){
    super("Push");
  }
}
//--------------------------------------------------------------------------------------------------------------------------
public class Coop extends Bouton{
  
  public Coop(){
    super("Coop");
  }
}
//--------------------------------------------------------------------------------------------------------------------------