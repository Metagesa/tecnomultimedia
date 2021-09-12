PImage fondo;
String[] desafio = new String[3];
int numDial = 0;
int tam = 24;

void setup() {
  size(1000, 500);

  desafio[0] = ("Hola! Este es el desafio 5 de Tecno Multimedial.");
  desafio[1] = ("Esta función dibuja un diálogo con su fondo.");
  desafio[2] = ("No es nada muy complejo, pero es útil para el TP4.");

  fondo=loadImage("fcd905a8cac7092cd6f44b5c946b8230fc5db3414169dbe96c25e31e74792f7c.jpg");
}

void draw() {
  image(fondo, 0, 0);

  dialogo(desafio[numDial], tam, 7);
}

void mousePressed() {
  if (numDial<2) {
    numDial++;
  } else {
    numDial = 0;
  }
}

void keyPressed () {
  if (key=='+') {
    tam = tam + 4;
  } else if (key=='-') {
    tam = tam - 4;
  }
}

void dialogo (String texto, int tam, int espacio) {

  for (int i=255; i>20; i--) {
    stroke(color(0, 0, 0, i/20));
    line(0, height-tam*espacio/4+tam*1.2+200/40-(i/40), width, height-tam*espacio/4+tam*1.2+200/40-(i/40));
  }
  noStroke();
  fill(0, 0, 128);
  rect(0, height-tam*espacio/4, width, tam*1.2);

  fill(100, 100, 220);
  rect(0, height-tam*espacio/4-tam/3/1.5, width, tam/3);

  fill(255);

  textSize(tam);
  textAlign(LEFT, TOP);
  text(texto, width/30, height-tam*espacio/4);
}
