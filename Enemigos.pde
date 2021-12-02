class Enemigo {

  float x, y, tam;
  float muertx = 0, muerty = 0;
  boolean mX = false, mY = true;
  boolean d = true, V = true;

  PImage mafia;

  Enemigo(float posX, float posY, float t) {
    V=true;
    x=posX;
    y=posY;
    tam=t;
    mafia = loadImage("mafioso_"+int(random(-0.1, 2.1))+".png");
    mafia.resize(int(tam), int(tam));
  }

  void dibujar(Mapa f, disparo[] dis, Juego j) {

    if (!vivo(dis, j)) {
      V = false;
    }
    if (V) {
      push();
      imageMode(CENTER);
      image(mafia, x, y);
      pop();
      mover(f);
      muertx=x;
      muerty=y;
    } else {
      x=-200;
      y=-200;
      push();
      tint(255, 0, 0);
      imageMode(CENTER);
      image(mafia, muertx, muerty);
      pop();
    }
  }

  boolean vivo(disparo[] b, Juego j) {
    for (int i=0; i<j.balas; i++) {
      boolean[] v = new boolean[j.balas];
      if (colision(b[i].absx, b[i].absy)) {
        v[i]=false;
        b[i].impacto=true;
        return v[i];
      }
    }
    return true;
  }

  boolean dir () {
    float m = int(random(5000));
    if (m >450 && m < 500) {
      return true;
    } else {
      return false;
    }
  }

  void mover(Mapa back) {
    if (back.colision(x, y, tam/2)) {
      if (back.distX<tam) {
        mX=!mX;
      } 
      if (back.distY<tam) {
        mY=!mY;
      }
    }
    if (dir()) {
      d = !d;
    }
    if (d) {
      if (mX) {
        x+=3;
      } else {
        x-=3;
      }
    } else {
      if (mY) {
        y+=3;
      } else {
        y-=3;
      }
    }
    if (x>=width-tam/2) {
      mX=false;
    } else if (x<=0+tam/2) {
      mX=true;
    }
    if (y>=height-tam/2) {
      mY=false;
    } else if (y<=0+tam/2) {
      mY=true;
    }
  }

  boolean colision(float colx, float coly) {
    if (dist(colx, y, x, y)<tam/2 && dist(x, coly, x, y)<tam/2) {
      return true;
    } else {
      return false;
    }
  }
}
