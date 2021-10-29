int cant = 10;
int balas = 0;
int muertes = 0;
boolean menu = true;
boolean w = false, a = false, s = false, d = false;
Heroe Juan;
disparo[] bala = new disparo[50];
Enemigo[] Iñaki = new Enemigo[cant];

void setup() {
  size(800, 600);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
  smooth();
  Juan = new Heroe(width/2, height/2);
  for (int i=0; i<cant; i++) {
    Iñaki[i] = new Enemigo(random(width/2.1), random(height/2.1), random(20, 30));
  }
  for (int i=0; i<50; i++) {
    bala[i] = new disparo(0, 0);
  }
}

void draw() {
  background(0);

  if (menu) {
    textAlign(CENTER, CENTER);
    text("Jugar", width/2, height/2);
  } else {

    for (int i=0; i<balas; i++) {
      if (bala[i].municion()) {
        bala[i].dibujar();
      }
      if (i==49) {
        if (bala[49].municion()==false) {
          balas=0;
        }
      }
    }

    for (int i=0; i<cant; i++) {
      Iñaki[i].dibujar();
      if (Juan.colision(Iñaki[i].x, Iñaki[i].y, Iñaki[i].tam/2)) {
        menu=true;
        Juan = new Heroe(width/2, height/2);
        for (int a=0; a<cant; a++) {
          Iñaki[a] = new Enemigo(random(width/2.1), random(height/2.1), random(20, 30));
        }
        for (int a=0; a<50; a++) {
          bala[a] = new disparo(0, 0);
        }
      }
    }

    Juan.dibujar();

    for (int i=0; i<cant; i++) {
      if (!Iñaki[i].V) {
        muertes++;
      }
    }
    if (muertes==cant) {
      menu=true;
    } else {
      muertes=0;
    }
  }

  println("Balas: "+balas);
  println("Colisión con mouse: "+Juan.colision(mouseX, mouseY, 10));
  println("Angulo: "+Juan.ang);

  if (keyPressed) {
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
  }
}

void keyPressed() {
  if (key=='w') {
    w = true;
  }
  if (key=='s') {
    s = true;
  }
  if (key=='d') {
    d = true;
  }
  if (key=='a') {
    a = true;
  }
}

void keyReleased() {
  if (keyCode==ENTER) {
    menu=false;
  }
  if (key=='w') {
    w = false;
  }
  if (key=='s') {
    s = false;
  }
  if (key=='d') {
    d = false;
  }
  if (key=='a') {
    a = false;
  }
}

void mouseReleased() {
  if (balas < 50) {
    balas++;
    bala[balas-1].impacto=false;
    bala[balas-1].actualizar();
  }
}
