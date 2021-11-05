//------------------TP 5---------------------------
//------------Tecno Multimedia 1------------------
//----------------Comision 2----------------------
//---------Juan Lutz - Nayla Aguilar---------------
//------Entrega Juan Lutz - Legajo 88196/6--------
//LINK a video:

Juego tl;
int balasGlobal = 0;

void setup() {
  size(800, 600);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);
  smooth();
  tl = new Juego();
}

void draw() {
  tl.draw();
  balasGlobal = tl.balas;
}

void keyPressed() {
  if (key=='w') {
    tl.w = true;
  }
  if (key=='s') {
    tl.s = true;
  }
  if (key=='d') {
    tl.d = true;
  }
  if (key=='a') {
    tl.a = true;
  }
}

void keyReleased() {
  if (keyCode==ENTER) {
    if (tl.menu) {
      tl.menu=false;
    }
    if (tl.ganar) {
      tl.menu=true;
      tl.ganar=false;
    }
    if (tl.perder) {
      tl.menu=true;
      tl.perder=false;
    }
  }
  if (key=='w') {
    tl.w = false;
  }
  if (key=='s') {
    tl.s = false;
  }
  if (key=='d') {
    tl.d = false;
  }
  if (key=='a') {
    tl.a = false;
  }
}

void mouseReleased() {
  if (!tl.menu) {
    if (tl.balas < 50) {
      tl.balas++;
      tl.bala[tl.balas-1].impacto=false;
      tl.bala[tl.balas-1].actualizar(tl.Juan);
    } else if (tl.balas == 50) {
      tl.balas=0;
    }
  }
}
