class enemigo {

  int vidas = 5;
  boolean conVida = true;

  void dibujar(float x, float y, float tam) {
    if (conVida) {
      fill(255);
    } else {
      fill(255, 0, 0);
    }
    circle(x, y, tam);
  }

  boolean enPantalla(float x, float y, float tam) {
    if (x>0+tam/2 && x<width-tam/2 && y>0+tam/2 && y<height-tam/2) {
      return true;
    } else {
      return false;
    }
  }

  boolean presionado (float posX, float posY, float tam) {
    if (dist(posX, posY, mouseX, mouseY)<tam/2) {
      return true;
    } else {
      return false;
    }
  }
}
