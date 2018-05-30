public class Jeu{
  private PImage image;
  private String nom;
  private String commandLine;

  public Jeu(String nomImage,String n){//
    this.image=loadImage("images/"+nomImage);
    this.nom=n;
    this.commandLine="/home/user/Bureau/ProjetArduino/Borne/Menu_Borne/Jeux/"+nom+"/application.linux64/"+nom;
    //modifer "commandLine" selon le chemin menant au dossier "Menu_Borne"
  }
  
  public PImage getImage(){
    return image;
  }
  
  public String getNom(){
    return nom;
  }
  
  public String getCommandLine(){
    return commandLine;
  }
}
