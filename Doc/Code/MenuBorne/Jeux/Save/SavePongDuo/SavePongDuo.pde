import java.lang.Runtime;


char letter;
String dest = "";
boolean end = false;

void setup() {
  size(640, 360);
  
}

void draw() {
  background(0); 

  
  textSize(14);
  text("Veuillez entrer une addresse mail valide, pour recevoir votre score", 50, 50);
  
  
  textSize(36);
  text(dest, 50, 120, 540, 300);
  
  if(end){exit();}
  
}

void keyTyped() {
  
  if ((key >= 'A' && key <= 'z') || key == '@' || (key >= '0' && key <= '9') || key=='-' || key == '.' ) {
    letter = key;
    dest += key;
  }
  
  else if (key == BACKSPACE){
    dest="";
  }
  
  else if (key == ENTER){
    Save s = new Save();
    s.SendScore(dest);
    end=true;
  }
}