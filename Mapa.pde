class Mapa {

  int cant = 20;
  int tam = 80;
  float[] x = new float[cant];
  float[] y = new float[cant];
  PImage[] basura = new PImage[cant];
  PImage piso;
  float distX, distY, tempX, tempY;

  Mapa() {

    piso = loadImage("piso.jpg");
    piso.resize(200, 0);

    for (int i=0; i<cant; i++) {
      basura[i] = loadImage("basura_"+(i%3)+".png");
      basura[i].resize(tam, tam);
      x[i] = random(width);
      y[i] = i*50;
      if (x[i]>300 && x[i]<500 && y[i]<400 && y[i]>200) {
        if (x[i]>400) {
          x[i] = random(width/2+tam, width-tam/2);
          y[i] = random(height/2);
        } else if (x[i]<=400) {
          x[i] = random(width/2-tam);
          y[i] = random(height/2, height);
        }
      }
    }
  }

  void draw() {
    push();
    tint(200);
    for (int y =0; y < cant; y++) {
      for (int x =0; x < cant; x++) {
        image(piso, 100*x, 100*y);
      }
    }
    pop();

    for (int i=0; i<cant; i++) {
      image(basura[i%2], x[i], y[i]);
    }
  }

  boolean impacto(disparo b) {
    if (colision(b.absx, b.absy, 16)) {
      return true;
    }
    return false;
  }

  boolean colision(float posX, float posY, float radio) {

    for (int i=0; i<cant; i++) {
      tempX = posX;
      tempY = posY;
      if (posX<x[i]) {
        tempX = x[i];
      } else if (posX>x[i]+tam) {
        tempX = x[i]+tam;
      }
      if (posY<y[i]) {
        tempY = y[i];
      } else if (posY>y[i]+tam) {
        tempY = y[i]+tam;
      }

      distX = posX-tempX;
      distY = posY-tempY;
      float distancia = sqrt( (distX*distX) + (distY*distY) );

      if (distancia <= radio-15) {
        return true;
      }
    }
    return false;
  }
}
