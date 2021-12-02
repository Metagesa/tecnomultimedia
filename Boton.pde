class Boton {
  float x, y, tamx, tamy;
  color col;
  String texto;
  String ID;
  
  Boton(String id) {
    ID=id;
  }

  void draw(float posX, float posY, float tamX, float tamY, color colBot, String textoB) {

    x=posX;
    y=posY;
    tamx=tamX;
    tamy=tamY;
    col=colBot;
    texto=textoB;

    strokeWeight(10);
    stroke(0, 0, 255, 50);
    fill(255, 200);
    rect(x, y, tamx*1.2, tamy*1.2, tamx*1.2/10);

    pushStyle();
    strokeWeight(5);
    stroke(0, 50);
    rectMode(CENTER);

    if (botonPres()) {
      fill(50, 0, 200);
    } else {
      fill(col);
    }
    rect(x+(tamx*1.2)/2, y+(tamy*1.2)/2, tamx*1.12, tamy, tamx/10);
    popStyle();

    pushStyle();
    textAlign(CENTER, CENTER);
    textSize(tamx/texto.length()*1.8);
    fill(0);
    text(texto, x+(tamx*1.2)/2, y+(tamy*1.2)/2);
    popStyle();
  }

  boolean botonPres() {

    if (mouseX> x && mouseX< x+tamx*1.2 && mouseY> y && mouseY< y+tamy*1.2) {
      return true;
    } else {
      return false;
    }
  }
}
