//Hola profe, entrego este "esqueleto" de TP. Estuve complicado entre medio de otras entregas y no llegué jaja.
//Armé de todas formas todo el código como para dibujar las pantallas y los void que probablemente voy a necesitar. 
//Para el recuperatorio solo me queda agregar alguna función que devuelva valores (probablemente un boolean para abrir
//los créditos, presionar botones o algo por el estilo), y dibujar cada pantalla.
//Saludos!

PFont fuenteDefault;
String[] pantalla;
PImage fondo;
int numP = 0;

void setup() {
  size(1000, 700);
  pantalla = loadStrings("pantallas.txt");
  fondo = loadImage("1.jpg");
  fondo.resize(width, 0);
  textSize(24);
  textAlign(CENTER, CENTER);
  fuenteDefault = loadFont("WorkSans-Regular-48.vlw");
  smooth();
}

void draw() {
  background(0);
  fill(255);

  if (pantalla[numP].equals("Inicio")) {
    text("Inicio", width/2, height/2);
    pantalla(fondo, pantalla[(mouseX/100)%pantalla.length], color(255, 255, 100), 24, fuenteDefault, 2);
  } else if (pantalla[numP].equals("Reactor")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Accidente")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Decision")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Musica")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Destruido")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Salto")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Busqueda")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Vagabundo")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Rezo")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Dios")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Basurero")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Malos")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Mafia")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Caja")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Talento")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Destruido2")) {
    text(pantalla[numP], width/2, height/2);
  } else if (pantalla[numP].equals("Creditos")) {
    text(pantalla[numP], width/2, height/2);
  }
  println (pantalla[numP]);
}

void keyPressed() {

  if (key=='.') {
    numP++;
    if (numP == pantalla.length) {
      numP = 0;
    }
  } else if (key==',' && numP > 0) {
    numP--;
  }
}

void dialogo (String texto, int tam, int espacio, color col) {

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

void boton(float posX, float posY, float tamX, float tamY, color colBot) {

  fill(colBot+10);
  rect(posX, posY, tamX*1.2, tamY*1.2, tamX*1.2/10);

  pushStyle();
  rectMode(CENTER);
  fill(colBot);
  rect(posX+(tamX*1.2)/2, posY+(tamY*1.2)/2, tamX*1.12, tamY, tamX/10);
  popStyle();
}

void pantalla(PImage fondo, String dialogo, color texto, int tam, PFont fuente, int botones) {
  image(fondo, 0, 0);

  textFont(fuente);
  fill(texto);
  dialogo(dialogo, tam, 7, texto);

  for (int i = 0; i<botones; i++) {
    boton(width/5 + width/5 * i, height/5*4, 100, 40, color(50, 50, 255));
  }
}
