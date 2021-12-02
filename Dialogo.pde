class Dialogo {

  String texto;
  int tam; 
  int espacio; 
  color col;

  Dialogo(String t, int T, int e, color c) {
    texto=t;
    tam=T;
    espacio=e;
    col=c;
  }

  void draw() {

    for (int i=255; i>20; i--) {
      stroke(color(0, 0, 0, i/20));
      line(0, height-tam*espacio/4+tam*1.2+200/40-(i/40), width, height-tam*espacio/4+tam*1.2+200/40-(i/40));
    }
    noStroke();
    fill(0, 0, 128);
    rect(0, height-tam*espacio/4, width, tam*1.2);

    fill(100, 100, 220);
    rect(0, height-tam*espacio/4-tam/3/1.5, width, tam/3);

    pushStyle();
    fill(col);
    textAlign(LEFT, CENTER);

    pushMatrix();
    translate(tam, 0);

    textSize(tam);
    text(texto, width/30, height-tam*espacio/4.3+tam/2);

    popMatrix();
    popStyle();
  }
}
