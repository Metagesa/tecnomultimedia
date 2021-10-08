//Hola profe, al final el trabajo lo terminé haciendo con imágenes y no en 3D como pensaba,
//se me complicó para convertir los modelos al formato que acepta processing.
//Pero bueno, estoy contento con el resultado! jaja
//Juan Lutz
//Comisión 2
//Legajo 88196/6
//Link a video de YouTube: https://youtu.be/n9LHk4Lv-bY

PFont fuenteDefault;
boolean botonA = false, botonB = false, creditos = false;
String[] pantalla;
String[] texto;
String[] botones = {"Continuar", "", ""};
String textCred = "Tecno Multimedia 1\nJuan Lutz\nComisión 2\nLegajo 88196/6";
PImage[] img = new PImage[8];
PImage[] tl = new PImage [8];
PImage[] vagos = new PImage [4];
PImage[] back = new PImage[3];
PImage luz, nada, vago, basura, caja, mafia, celebra, sombrero, brazo;
int numP = 0;
int a = 0;
int dial = 0;
float contador = 0;

void setup() {
  size(800, 600);
  pantalla = loadStrings("pantallas.txt"); //Tengo las pantallas a utilizar cargadas con Strings para reconocerlas más fácil

  for (int i = 0; i<back.length; i++) {
    back[i] = loadImage("Fondo"+i+".png");
  }
  back[2].resize(0, 600);

  luz = loadImage("lamp.png");
  luz.resize(width*2, 0);

  nada = loadImage("Blank.png");

  celebra = loadImage("celebra.png");
  celebra.resize(800, 0);
  sombrero = loadImage("sombrero.png");
  sombrero.resize(60, 0);
  brazo = loadImage("brazo.png");

  mafia = loadImage("mafia.png");
  mafia.resize(300, 0);

  vago = loadImage("vago.png");
  vago.resize(0, 100);

  basura = loadImage("basura.png");
  basura.resize(200, 0);

  caja = loadImage("caja.png");

  for (int i = 0; i<img.length; i++) {
    img[i] = loadImage(i+".png");
    img[i].resize(width, 0);
  }

  for (int i = 0; i<tl.length; i++) {
    tl[i] = loadImage("TL-WN"+i+".png");
    tl[i].resize(int(width/1.5), 0);
  }

  for (int i = 0; i<vagos.length; i++) {
    vagos[i] = loadImage("vago"+i+".png");
    vagos[i].filter(THRESHOLD, 0);
  }
  textSize(24);
  textAlign(CENTER, CENTER);
  fuenteDefault = loadFont("WorkSans-Regular-48.vlw");
  smooth();
}

void draw() {
  if (numP<7) {
    background(back[0]);
  } else {
    background(back[1]);
  }

  cargarTexto();

  fill(255);

  if (pantalla[numP].equals("Inicio")) {
    pantalla(img[numP], false, "", color(255, 255, 100), 28, fuenteDefault, 0, botones);
    boton(width/15, height/15*6, width/5, height/12, color(#251FDE), "Iniciar", true);
    boton(width/15, height/15*8, width/5, height/12, color(#251FDE), " Salir ", true);
  } else if (pantalla[numP].equals("Reactor")) {
    pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
  } else if (pantalla[numP].equals("Accidente")) {
    pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    luz(frameCount*8%255);
    contador = millis();
  } else if (pantalla[numP].equals("Decision")) {
    if (millis()-contador>6000) {
      contador = millis();
      numP+=2;
    }
    pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);
    luz(frameCount*8%255);
    boton(width/5/2, height/15*11, width/5, height/12, color(255, 0, 0), "Ignorar la\nalarma", true);
    boton(width/5*3.5, height/15*11, width/5, height/12, color(255, 0, 0), "Escapar por la\nventana", false);
    push();
    strokeWeight(8);
    stroke(255, 0, 0);
    line(0, height/15*13.55, map(millis()-contador, 0, 6000, 0, width), height/15*13.55);
    pop();
  } else if (pantalla[numP].equals("Musica")) {
    pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    luz(frameCount*8%255);
  } else if (pantalla[numP].equals("Destruido")) {
    pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);
    fill(255, 0, 0, 200);
    rect(0, 0, width, height);
    fill(0);
    dialogo(texto[dial], 28, 8, color(255, 0, 0));
    boton(width/2-width/10, height/15*12, width/5, height/15, color(#251FDE), "Volver al inicio", true);
  } else if (pantalla[numP].equals("Salto")) {
    if (dial<texto.length-1) {
      pantalla(img[numP], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);
    } else {
      pantalla(img[numP+1], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    }
  } else if (pantalla[numP].equals("Busqueda")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);

    push();
    tint(200, 100, 230);
    image(vago, width/20, height/10*5.5);
    image(basura, width/4*3.2, height/2.6);
    image(caja, width/4*2.2, height/2);
    pop();

    if (dial<texto.length-1) {
      image(tl[0], width/8, height/3);
    } else {
      if (mouseX>=width/3 && mouseX<=width/3*2) {
        image(tl[1], width/8, height/2.5);
        if (mouseX>=width/4*2.2 && mouseX<=width/4*2.2+100 && mouseY>height/2 && mouseY<height/2+100) {
          push();
          tint(255);
          image(caja, width/4*2.2, height/2);
          fill(255);
          textSize(18);
          textAlign(LEFT);
          text("Caja", width/4*2.35, height/1.90);
          pop();
          if (mousePressed) {
            numP=14;
            dial=0;
          }
        }
      } else if (mouseX>=width/3*2) {
        image(tl[3], width/8, height/2.5);
        if (mouseX>=width/4*3.2 && mouseX<=width/4*3.2+200 && mouseY>height/2.6 && mouseY<height/2.6+200) {
          push();
          tint(255);
          image(basura, width/4*3.2, height/2.6);
          fill(255);
          textSize(18);
          textAlign(LEFT);
          text("Contenedor", width/4*3.35, height/2.65);
          pop();
          if (mousePressed) {
            numP=11;
            dial=0;
          }
        }
      } else if (mouseX<=width/3) {
        if (mouseX>=width/20 && mouseX<=width/20+80 && mouseY>height/10*5.5 && mouseY<height/10*5.5+100) {
          push();
          tint(255);
          image(vago, width/20, height/10*5.5);
          fill(255);
          textSize(18);
          textAlign(LEFT);
          text("Vagabundo", width/20, height/10*5.4);
          pop();
          if (mousePressed) {
            numP=8;
            dial=0;
          }
        }
        image(tl[2], width/8, height/2.5);
      }
    }
  } else if (pantalla[numP].equals("Vagabundo")) {
    pantalla(back[1], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    push();
    image(tl[2], width/8, height/2.5);
    if (dial<texto.length-2) {
      tint(255);
      image(vago, width/20, height/10*5.5);
    } else {
      image(vagos[0], width/25, height/1.9);
    }
    tint(200, 100, 230);
    image(basura, width/4*3.2, height/2.6);
    image(caja, width/4*2.2, height/2);
    pop();
  } else if (pantalla[numP].equals("Rezo")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    push();
    tint(200, 100, 230);
    image(basura, width/4*3.2, height/2.6);
    image(caja, width/4*2.2, height/2);
    if (dial<texto.length-1) {
      tint(255);
      image(vagos[1], width/25, height/1.9);
    } else {
      for (int i=0; i<5; i++) {
        randomSeed(457475456);
        image(vagos[i%4], width/25+i*random(-300, 800), height/1.9+i*random(-80, 80));
      }
    }
    pop();
    image(tl[2], width/8, height/2.5);
  } else if (pantalla[numP].equals("Dios")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);
    for (int a=0; a<5; a++) {
      for (int i=1; i<27; i+=3) {
        push();
        tint(color(a*50, 100, i*7));
        image(vagos[1], width/25*i-a*50, height/1.9-a*120);
        pop();
      }
    }
    image(tl[6], width/35, height/5, width/1.1, height/1.5);
    if (dial==texto.length-1) {
      boton(width/2-width/10, height/15*12, width/5, height/15, color(#251FDE), "Volver al inicio", true);
    }
  } else if (pantalla[numP].equals("Basurero")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    push();
    tint(255);
    image(basura, width/4*3.2, height/2.6);

    tint(200, 100, 230);
    image(vago, width/20, height/10*5.5);
    image(caja, width/4*2.2, height/2);
    pop();
    if (dial==texto.length-1) {
      image(tl[4], width/8, height/2.5);
    } else {
      image(tl[3], width/8, height/2.5);
    }
  } else if (pantalla[numP].equals("Malos")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    push();
    tint(255);
    image(basura, width/4*3.2, height/2.6);
    tint(200, 100, 230);
    image(caja, width/4*2.2, height/2);
    tint(255, 0, 0);
    image(mafia, width/4, height/3);
    pop();
  } else if (pantalla[numP].equals("Mafia")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 0, botones);
    push();
    tint(255);
    image(basura, width/4*3.2, height/2.6);
    tint(200, 100, 230);
    image(caja, width/4*2.2, height/2);
    if (dial>=texto.length-2) {
      tint(255, 0, 0);
      image(mafia, width/4, height/3);
    }
    tint(255);
    image(tl[7], width/8, height/2.5);
    pop();
    if (dial==texto.length-1) {
      boton(width/2-width/8, height/15*2, width/5, height/15, color(#251FDE), "Volver al inicio", true);
    }
  } else if (pantalla[numP].equals("Caja")) {
    pantalla(nada, true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    push();
    if (dial<texto.length-1) {
      image(tl[3], width/8, height/2.5);
    } else {
      image(tl[5], width/8, height/2.5);
    }

    if (dial<texto.length-2) {
      tint(255);
      image(caja, width/4*2.2, height/2);
    } else if (dial<texto.length-1) {
      image(brazo, width/4*2.2, height/2);
    }
    tint(200, 100, 230);
    image(basura, width/4*3.2, height/2.6);
    image(vago, width/20, height/10*5.5);
    pop();
  } else if (pantalla[numP].equals("Talento")) {
    pantalla(back[2], true, texto[dial], color(255, 255, 100), 28, fuenteDefault, 1, botones);
    image(tl[5], width/8, height/2.5);
    image(sombrero, width/2.55, height/2.5);
  } else if (pantalla[numP].equals("Destruido2")) {
    image(back[2], 0, 0);
    push();
    fill(0, 200);
    rect(0, 0, width, height);
    tint(255);
    image(celebra, 0, 0);
    if (dial<texto.length-2) {
      tint(255);
      image(tl[5], width/8, height/2.5);
      image(sombrero, width/2.55, height/2.5);
    } else {
      tint(0, 0, 255);
      image(tl[5], width/8, height/2.5);
      image(sombrero, width/2.55, height/2.5);
    }
    if (dial==texto.length-1) {
      fill(255, 0, 0, 200);
      rect(0, 0, width, height);
      dialogo(texto[dial], 28, 8, color(255, 0, 0));
      boton(width/2-width/8, height/15*2, width/5, height/15, color(#251FDE), "Volver al inicio", true);
    } else {
      dialogo(texto[dial], 28, 8, color(255, 255, 100));
    }
    pop();
  }

  boton(width-width/9, height/30, width/14, height/25, color(#251FDE), "Créditos", true);
  if (creditos) {
    pushStyle();
    fill(0, 200);
    rect(0, 0, width, height);
    textAlign(CENTER, CENTER);
    fill(255);
    text(textCred, width/2, height/2);
    popStyle();
    boton(width-width/9, height/30, width/14, height/25, color(#251FDE), "Cerrar", true);
  }
}

//---------------------UNICAMENTE PARA DEBUG------------
//void keyPressed() {

//  if (key=='.') {
//    numP++;
//    dial=0;
//    if (numP == pantalla.length) {
//      numP = 0;
//      dial=0;
//    }
//  } else if (key==',' && numP > 0) {
//    numP--;
//    dial=0;
//  }
//}
//-----------------------------------------------------

void mouseClicked() {
  if (numP>0) {
    if (dial<texto.length-1 && !(botonPres(width-width/9, height/30, width/14, height/25)) && !pantalla[numP].equals("Decision") && !creditos) {
      dial++;
    } else if (botonA) {
      dial=0;
      numP++;
      botonA = false;
    } else {
      if (botonB) {
        dial=0;
        numP+=3;
        botonB = false;
      }
    }
  } else if (botonPres(width/15, height/15*6, width/5, height/12)) {
    numP++;
  } else if (botonPres(width/15, height/15*8, width/5, height/12)) {
    exit();
  }
  if (botonPres(width-width/9, height/30, width/14, height/25)) {

    if (creditos) {
      creditos = false;
    } else {
      creditos = true;
    }
  }
}
