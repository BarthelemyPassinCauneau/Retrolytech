

public class Save extends EmailSender{


  public void SendScore(String dest) {

    String toSend="";
    
    String[] arr = loadStrings("savePongSolo.txt");
    
    for(String line : arr){toSend+=line;}

    
    this.sendSave("Pong (Solo)",toSend,dest);
  }
}