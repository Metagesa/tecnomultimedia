class disparo {
  float x, y, absx, absy;
  int b = 0;
  boolean impacto = false;
  float vel=15;
  float ang;

  disparo(float px, float py) {
    x=px;
    y=py;
  }

  void dibujar() {
    if (!impacto) {
      x=x-vel;
      pushMatrix();
      translate(Juan.x, Juan.y);
      rotate(map(ang, -PI, PI, 0, TWO_PI));
      circle(x, y, 5);
      absx=screenX(x, y);
      absy=screenY(x, y);
      popMatrix();
    } else {
      absx=-100;
      absy=-100;
    }
  }

  void actualizar() {
    ang=(atan2(mouseY-Juan.y, mouseX-Juan.x));
    x=0;
    y=0;
  }

  boolean municion() {
    if (x<-width) {
      return false;
    } else {
      return true;
    }
  }
}
