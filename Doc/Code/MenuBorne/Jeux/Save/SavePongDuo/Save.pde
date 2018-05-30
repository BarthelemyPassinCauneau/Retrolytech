

public class Save extends EmailSender{


  public void SendScore(String dest) {

    String toSend="";
    
    String[] arr = loadStrings("savePongDuo.txt");
    
    for(String line : arr){toSend+=line +"\n";}

    
    this.sendSave("Pong (Duo)",toSend,dest);
  }
}