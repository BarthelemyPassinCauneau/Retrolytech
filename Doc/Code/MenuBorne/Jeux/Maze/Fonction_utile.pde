public PGraphics convertMap(String[] m){
  PGraphics pg = createGraphics(480,480);
  int x=0;
  int y=0;
  
  pg.beginDraw();
  for(int i=0; i<m.length; i++){
    if(m[i].equals("true")){
      pg.image(floor, x, y);
    }else if(m[i].equals("false")){
      pg.image(upWall, x, y);  
    }
    if(x==448){
      x=0;
      y+=32;
    }else{x+=32;}
  }
  
  pg.endDraw();
  return pg;
}

public void beginLvl(){
  Map actual = allMap.get(currentMap);
  Coordonne[] deb = actual.getCoordDeb();
  player1.setCoor(deb[0]);
  player2.setCoor(deb[1]);
  
  PGraphics[] m = actual.getMaps();
  currentMapP1 = m[0];
  currentMapP2 = m[1];
  
  String[][] lim = actual.getBooleanMaps();
  limMapP1 = lim[0];
  limMapP2 = lim[1];
  
  debLvl=false;
}

public boolean lvlIsFinished(){
  Coordonne[] fin = allMap.get(currentMap).getCoordFin();
  return player1.getCoor().equal(fin[0]) && player2.getCoor().equal(fin[1]);
}

public boolean gameEnded(){
  return allMap.size()==currentMap+1;
}


public void move(){
  
  //Pour le Joueur 1
  if(upP1){
    Coordonne temp = player1.getCoor();
    if(temp.getY()==0){}
    else if(limMapP1[15*(temp.getY()-1) + temp.getX()].equals("true")){
      player1.setCoor(new Coordonne(temp.getX(),temp.getY()-1));
      player1.changeImg("back");
    }
  }
  
  else if(downP1){
    Coordonne temp = player1.getCoor();
    if(temp.getY()==14){}
    else if(limMapP1[15*(temp.getY()+1) + temp.getX()].equals("true")){
      player1.setCoor(new Coordonne(temp.getX(),temp.getY()+1));
      player1.changeImg("front");
    }
  }
  
  else if(rightP1){
    Coordonne temp = player1.getCoor();
    if(temp.getX()==14){}
    else if(limMapP1[15*temp.getY() + temp.getX()+1].equals("true")){
      player1.setCoor(new Coordonne(temp.getX()+1,temp.getY()));
      player1.changeImg("right");
    }
  }
  
  else if(leftP1){
    Coordonne temp = player1.getCoor();
    if(temp.getX()==0){}
    else if(limMapP1[15*temp.getY() + temp.getX()-1].equals("true")){
      player1.setCoor(new Coordonne(temp.getX()-1,temp.getY()));
      player1.changeImg("left");
    }
  }
  
  
  //Pour le Joueur 2
  if(upP2){
    Coordonne temp = player2.getCoor();
    if(temp.getY()==0){}
    else if(limMapP2[15*(temp.getY()-1) + temp.getX()].equals("true")){
      player2.setCoor(new Coordonne(temp.getX(),temp.getY()-1));
      player2.changeImg("back");
    }
  }
  
  else if(downP2){
    Coordonne temp = player2.getCoor();
    if(temp.getY()==14){}
    else if(limMapP2[15*(temp.getY()+1) + temp.getX()].equals("true")){
      player2.setCoor(new Coordonne(temp.getX(),temp.getY()+1));
      player2.changeImg("front");
    }
  }
  
  else if(rightP2){
    Coordonne temp = player2.getCoor();
    if(temp.getX()==14){}
    else if(limMapP2[15*temp.getY() + temp.getX()+1].equals("true")){
      player2.setCoor(new Coordonne(temp.getX()+1,temp.getY()));
      player2.changeImg("right");
    }
  }
  
  else if(leftP2){
    Coordonne temp = player2.getCoor();
    if(temp.getX()==0){}
    else if(limMapP2[15*temp.getY() + temp.getX()-1].equals("true")){
      player2.setCoor(new Coordonne(temp.getX()-1,temp.getY()));
      player2.changeImg("left");
    }
  }
  
}