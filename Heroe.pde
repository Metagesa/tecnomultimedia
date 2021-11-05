class Heroe {

  float x, y, ang;
  float diam = 20;
  float rad = diam/2;
  float vel = 3;
  PImage TLWN = loadImage("tl.png");

  Heroe(float posX, float posY) {
    x=posX;
    y=posY;
    TLWN.resize(int(diam*3), 0);
  }

  void dibujar() {
    pushStyle();
    noStroke();
    //circle(x, y, diam);
    ang = atan2(mouseY-y, mouseX-x);
    pushMatrix();
    translate(x, y);
    rotate(map(ang, -PI, PI, 0, TWO_PI));
    rotate(radians(-90));
    //rect(-diam, -diam/6, diam, diam/3);
    imageMode(CENTER);
    image(TLWN, 0, 0);
    popMatrix();
    popStyle();
  }

  void mover(String direc) {
    if (direc.equals("none")) {
      //IDLE
    } else if (direc.equals("derecha") && x<width-diam) {
      x+=vel;
    } else if (direc.equals("izquierda") && x>0+diam) {
      x-=vel;
    } else if (direc.equals("arriba") && y>0+diam) {
      y-=vel;
    } else if (direc.equals("abajo") && y<height-diam) {
      y+=vel;
    }
  }

  boolean colision(float colx, float coly, float tam) {
    if (dist(colx, y, x, y)<tam && dist(x, coly, x, y)<tam) {
      return true;
    } else {
      return false;
    }
  }
}
