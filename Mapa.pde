class Mapa {

  int cant = 50;
  int tam = 80;
  float[] x = new float[cant];
  float[] y = new float[cant];
  PImage[] basura = new PImage[cant];
  float distX, distY, tempX, tempY;

  Mapa() {

    for (int i=0; i<cant; i++) {
      basura[i] = loadImage("basura_"+(i%3)+".png");
      basura[i].resize(tam, tam);
      x[i] = random(width);
      y[i] = random(height);

      if (x[i]>800/2-tam && x[i]<800/2+tam && y[i]<600/2-tam && y[i]>600/2+tam) {
        x[i] = random(width/2);
        y[i] = random(height/2);
      }
    }
  }

  void draw() {

    for (int i=0; i<cant; i++) {
      image(basura[i%2], x[i], y[i]);
    }
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
