class Juego {
  int cant = 1;
  int balas = 0;
  int muertes = 0;
  boolean menu = true, ganar = false, perder = false;
  boolean w = false, a = false, s = false, d = false;
  Heroe Juan;
  disparo[] bala = new disparo[50];
  Enemigo[] Inaki = new Enemigo[cant];
  Mapa fondo;

  PImage robotito, robotito2, win, lose;


  Juego() {
    Juan = new Heroe(width/2, height/2);
    fondo = new Mapa();
    for (int i=0; i<cant; i++) {
      Inaki[i] = new Enemigo(random(width), 0, random(40, 60));
      Inaki[i].mX = (i%2==0);
      Inaki[i].mY = (i%7==0);
    }
    for (int i=0; i<50; i++) {
      bala[i] = new disparo(0, 0);
    }

    robotito = loadImage("Armado.png");
    robotito2 = loadImage("sad.png");
    win = loadImage("pantalla__ganar.png");
    lose = loadImage("pantalla__perder.png");
    robotito.resize(800, 0);
    robotito2.resize(800, 0);
    textAlign(CENTER);
  }

  void draw() {
    background(0);

    if (menu) {
      textAlign(CENTER, CENTER);
      text("Jugar", width/2, height/2);
    } else if (perder) {
      push();
      background (lose);
      fill(0);
      textSize(40);
      text("¡Que lastima! Has perdido", width/2, 50);
      image(robotito2, 0, 100);
      fill(255);
      textSize(30);
      text("Te gustaria reintentar?\n(Enter)", width/2, 490);
      fill(255, 100);
      rect(200, 450, 400, 90, 10);
      pop();
    } else if (ganar) {
      push();
      background (win);
      fill(0);
      textSize(40);
      text("¡Has Ganado!", width/2, 50);
      image(robotito, 0, 20);
      fill(255);
      textSize(30);
      text("Te gustaria volver a jugar?\n(Enter)", width/2, 490);
      fill(255, 100);
      rect(200, 450, 400, 90, 10);
      pop();
    } else {

      fondo.draw();

      for (int i=0; i<balas; i++) {
        if (bala[i].municion()) {
          bala[i].dibujar(Juan);
        }
        if (fondo.impacto(bala[i])) {
          bala[i].impacto=true;
        }
      }

      for (int i=0; i<cant; i++) {
        Inaki[i].dibujar(fondo, bala);
        if (Juan.colision(Inaki[i].x, Inaki[i].y, Inaki[i].tam/2)) {
          perder=true;
          Juan = new Heroe(width/2, height/2);
          for (int a=0; a<cant; a++) {
            Inaki[a] = new Enemigo(random(width), 0, random(40, 60));
            Inaki[a].mX = (a%2==0);
            Inaki[a].mY = (a%7==0);
          }
          for (int a=0; a<50; a++) {
            bala[a] = new disparo(0, 0);
          }
        }
      }

      Juan.dibujar();

      for (int i=0; i<cant; i++) {
        if (!Inaki[i].V) {
          muertes++;
        }
      }
      if (muertes==cant) {
        ganar=true;
        Juan = new Heroe(width/2, height/2);
        for (int a=0; a<cant; a++) {
          Inaki[a] = new Enemigo(random(width), 0, random(40, 60));
          Inaki[a].mX = (a%2==0);
          Inaki[a].mY = (a%7==0);
        }
        for (int a=0; a<50; a++) {
          bala[a] = new disparo(0, 0);
        }
        muertes=0;
      } else {
        muertes=0;
      }
    }

    println("Balas: "+balas);
    println("Colisión con mouse: "+Juan.colision(mouseX, mouseY, 10));
    println("Angulo: "+Juan.ang);
    println(fondo.colision(Juan.x, Juan.y, Juan.diam));

    movimientoHeroe();
  }

  void movimientoHeroe() {

    if (keyPressed) {
      if (!fondo.colision(Juan.x, Juan.y, Juan.diam)) {
        if (w) {
          Juan.mover("arriba");
        }
        if (s) {
          Juan.mover("abajo");
        }
        if (d) {
          Juan.mover("derecha");
        }
        if (a) {
          Juan.mover("izquierda");
        }
      } else if (fondo.colision(Juan.x, Juan.y, Juan.diam)) {
        colHeroe();
      }
    }
  }

  void colHeroe() {

    if (fondo.tempX<Juan.x) {
      if (d) {
        Juan.mover("derecha");
      }
      if (w) {
        Juan.mover("arriba");
      }
      if (s) {
        Juan.mover("abajo");
      }
    } else if (fondo.tempX>Juan.x) {
      if (a) {
        Juan.mover("izquierda");
      }
      if (w) {
        Juan.mover("arriba");
      }
      if (s) {
        Juan.mover("abajo");
      }
    } else if (fondo.tempY<Juan.y) {
      if (s) {
        Juan.mover("abajo");
      }
      if (d) {
        Juan.mover("derecha");
      }
      if (a) {
        Juan.mover("izquierda");
      }
    } else if (fondo.tempY>Juan.y) {
      if (w) {
        Juan.mover("arriba");
      }
      if (d) {
        Juan.mover("derecha");
      }
      if (a) {
        Juan.mover("izquierda");
      }
    }
  }
}
