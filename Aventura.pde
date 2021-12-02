class Aventura {
  Juego J;
  PFont fuenteDefault;
  boolean creditos = false;
  Pantalla fondo;
  Boton[] B = new Boton[4];
  Dialogo destruido = new Dialogo("TL-WN ha quedado destruido", 24, 8, color(255, 0, 0));
  String[] pantalla;
  String[] texto = {"", ""};
  String textCred = "Tecno Multimedia 1\nComisión 2\n----------\nJuan Lutz\nLegajo 88196/6\n----------\nNayla Aguilar\nLegajo 88106/6";
  PImage[] img = new PImage[8];
  PImage[] tl = new PImage [8];
  PImage[] vagos = new PImage [4];
  PImage[] back = new PImage[3];
  PImage luz, nada, vago, basura, caja, mafia, celebra, sombrero, brazo;
  int numP = 0;
  int a = 0;
  int dial = 0;
  float contador = 0;

  boolean inicio, B1, B2, B3, B4;

  Aventura() {
    pantalla = loadStrings("pantallas.txt"); //Tengo las pantallas a utilizar cargadas con Strings para reconocerlas más fácil
    fondo = new Pantalla("Hola", color(255), 24);

    J = new Juego();

    for (int i = 0; i<back.length; i++) {
      back[i] = loadImage("Fondo"+i+".png");
    }

    for (int i = 0; i<4; i++) {
      B[i] = new Boton(nf(i));
    }

    inicio = numP==0; 
    B1 = B[0].botonPres(); 
    B2 = B[1].botonPres();
    B3 = B[2].botonPres();
    B4 = B[3].botonPres();

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

    inicio = numP==0; 
    B1 = B[0].botonPres(); 
    B2 = B[1].botonPres();
    B3 = B[2].botonPres();
    B4 = B[3].botonPres();
    B[0].draw(-500, -500, 1, 1, color(#251FDE), "a");
    B[1].draw(-500, -500, 1, 1, color(#251FDE), "a");
    B[2].draw(-500, -500, 1, 1, color(#251FDE), "a");
    B[3].draw(-500, -500, 1, 1, color(#251FDE), "a");

    if (numP<7) {
      background(back[0]);
    } else {
      background(back[1]);
    }

    cargarTexto();

    if (pantalla[numP].equals("Inicio")) {
      fondo.draw(img[numP], false, "ola");
      B[0].draw(width/15, height/15*6, width/5, height/12, color(#251FDE), "Iniciar");
      B[1].draw(width/15, height/15*8, width/5, height/12, color(#251FDE), " Salir ");
    } else if (pantalla[numP].equals("Reactor")) {
      fondo.draw(img[numP], true, texto[dial]);
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Accidente")) {
      fondo.draw(img[numP], true, texto[dial]);
      luz(frameCount*8%255);
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
      contador = millis();
    } else if (pantalla[numP].equals("Decision")) {
      if (millis()-contador>6000) {
        contador = millis();
        numP+=2;
      }
      fondo.draw(img[numP], true, texto[dial]);
      luz(frameCount*8%255);
      B[0].draw(width/5/2, height/15*11, width/5, height/12, color(255, 0, 0), "Ignorar la\nalarma");
      B[1].draw(width/5*3.5, height/15*11, width/5, height/12, color(255, 0, 0), "Escapar por la\nventana");
      push();
      strokeWeight(8);
      stroke(255, 0, 0);
      line(0, height/15*13.55, map(millis()-contador, 0, 6000, 0, width), height/15*13.55);
      pop();
    } else if (pantalla[numP].equals("Musica")) {
      fondo.draw(img[numP], true, texto[dial]);
      luz(frameCount*8%255);
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Destruido")) {
      fondo.draw(img[numP], true, texto[dial]);
      fill(255, 0, 0, 200);
      rect(0, 0, width, height);
      fill(0);
      destruido.draw();
      B[0].draw(width/2-width/10, height/15*12, width/5, height/15, color(#251FDE), "Volver al inicio");
    } else if (pantalla[numP].equals("Salto")) {
      if (dial<texto.length-1) {
        fondo.draw(img[numP], true, texto[dial]);
      } else {
        fondo.draw(img[numP+1], true, texto[dial]);
      }
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Busqueda")) {
      fondo.draw(nada, true, texto[dial]);

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
      fondo.draw(back[1], true, texto[dial]);
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
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Rezo")) {
      fondo.draw(nada, true, texto[dial]);
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
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Dios")) {
      fondo.draw(nada, true, texto[dial]);
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
        B[0].draw(width/2-width/10, height/15*12, width/5, height/15, color(#251FDE), "Volver al inicio");
      }
    } else if (pantalla[numP].equals("Basurero")) {
      fondo.draw(nada, true, texto[dial]);
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
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Malos")) {
      fondo.draw(nada, true, texto[dial]);
      push();
      tint(255);
      image(basura, width/4*3.2, height/2.6);
      tint(200, 100, 230);
      image(caja, width/4*2.2, height/2);
      tint(255, 0, 0);
      image(mafia, width/4, height/3);
      pop();
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Mafia")) {
      push();
      J.draw();
      if (J.ganar) {
        B[0].draw(width/2-width/8, height/15*2, width/5, height/15, color(#251FDE), "Volver al inicio");
      }
      pop();
    } else if (pantalla[numP].equals("Caja")) {
      fondo.draw(nada, true, texto[dial]);
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
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Talento")) {
      fondo.draw(back[2], true, texto[dial]);
      image(tl[5], width/8, height/2.5);
      image(sombrero, width/2.55, height/2.5);
      B[0].draw(width/1.3, height/5*4, 140, 40, color(50, 50, 255), "Siguiente");
    } else if (pantalla[numP].equals("Destruido2")) {
      push();
      tint(200);
      fondo.draw(back[2], true, texto[dial]);

      //fill(0, 200);
      //rect(0, 0, width, height);
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
        B[0].draw(width/2-width/8, height/15*2, width/5, height/15, color(#251FDE), "Volver al inicio");
        destruido.draw();
      }
      pop();
    }

    B[2].draw(width-width/9, height/30, width/14, height/25, color(#251FDE), "Créditos");
    if (creditos) {
      pushStyle();
      fill(0, 200);
      rect(0, 0, width, height);
      textAlign(CENTER, CENTER);
      fill(255);
      textSize(40);
      text(textCred, width/2, height/2);
      popStyle();
      B[2].draw(width-width/9, height/30, width/14, height/25, color(#251FDE), "Cerrar");
    }

    println(pantalla[numP]);
  }

  void cargarTexto() {
    if (numP > 0) {
      texto =  loadStrings(pantalla[numP]+".txt");
    }
  }

  void luz (int a) {
    pushStyle();
    imageMode(CENTER);
    tint(255, 0, 0, a);
    image(luz, width, 0);
    popStyle();
  }

  void mouse() {
    if (!J.menu) {
      if (J.balas < 50) {
        J.balas++;
        J.bala[J.balas-1].impacto=false;
        J.bala[J.balas-1].actualizar(J.Juan);
      } else if (J.balas == 50) {
        J.balas=0;
      }
    }
    if (J.perder) {
      J.menu=true;
      J.perder=false;
    }

    if (numP>0) {
      if (dial<texto.length-1 && !creditos && !B3) {
        dial++;
      } else if (necesitoUnaMano.B1 && (B[0].texto.equals("Siguiente") || B[0].texto.equals("Ignorar la\nalarma"))) {
        dial=0;
        numP++;
      } else if (B1 && B[0].texto.equals("Volver al inicio")) {
        dial=0;
        numP=0;
        if (J.ganar) {
          J.ganar=false;
        }
      }
      if (B2 && B[1].texto.equals("Escapar por la\nventana")) {
        dial=0;
        numP+=3;
      }
    } else if (B1) {
      numP++;
    } else if (B2) {
      exit();
    }
    if (B3) {
      if (creditos) {
        creditos = false;
      } else {
        creditos = true;
      }
    }
  }

  void keyP() {
    if (key=='w') {
      J.w = true;
    }
    if (key=='s') {
      J.s = true;
    }
    if (key=='d') {
      J.d = true;
    }
    if (key=='a') {
      J.a = true;
    }

    //---------------------UNICAMENTE PARA DEBUG------------
    //  if (key=='.') {
    //    necesitoUnaMano.numP++;
    //    necesitoUnaMano.dial=0;
    //    if (necesitoUnaMano.numP == necesitoUnaMano.pantalla.length) {
    //      necesitoUnaMano.numP = 0;
    //      necesitoUnaMano.dial=0;
    //    }
    //  } else if (key==',' && necesitoUnaMano.numP > 0) {
    //    necesitoUnaMano.numP--;
    //    necesitoUnaMano.dial=0;
    //  }
    //}
    //-----------------------------------------------------
  }
  void keyR() {
    if (keyCode==ENTER) {
      if (J.menu) {
        J.menu=false;
      }
    }
    if (key=='w') {
      J.w = false;
    }
    if (key=='s') {
      J.s = false;
    }
    if (key=='d') {
      J.d = false;
    }
    if (key=='a') {
      J.a = false;
    }
  }
}
