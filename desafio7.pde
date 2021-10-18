int cantidad = 80;
enemigo[] mun = new enemigo[cantidad];
float[] munX = new float[cantidad], munY = new float[cantidad], munT = new float[cantidad], munV = new float[cantidad];

void setup() {
  size(500, 500);
  for (int i=0; i<cantidad; i++) {
    mun[i] = new enemigo();
    munX[i] = random(i, 400);
    munY[i] = random(i, 400);
    munT[i] = random(20, 40);
    munV[i] = random(0.3, 1);
  }
}

void draw() {
  background(0);

  for (int i=0; i<cantidad; i++) {
    mun[i].dibujar(munX[i], munY[i], munT[i]);
    if (mun[i].conVida) {
      if (mun[i].enPantalla(munX[i], munY[i], munT[i])) {
        munX[i] = munX[i]+munV[i];
        munY[i] = munY[i]+munV[i];
      } else {
        munX[i] = random(munT[i]/2, 500-munT[i]/2);
        munY[i] = random(munT[i]/2, 500-munT[i]/2);
      }
    }
  }
  println(mun[1].presionado(width/2, height/2, 30));
  println(mun[1].vidas);
  println(mun[1].conVida);
}

void mouseReleased() {
  for (int i=0; i<cantidad; i++) {
    if (mun[i].vidas>1) {
      if (mun[i].presionado(munX[i], munY[i], munT[i])) {
        mun[i].vidas--;
      }
    } else {
      mun[i].conVida=false;
    }
  }
}
