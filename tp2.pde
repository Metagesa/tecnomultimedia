PFont fuenteA, fuenteB;
PImage boton;
PImage T1, T2, T3, T4, T5, T6, T;
PImage neon, texto, niebla, estatua, estatua2, candelabro, fondo1, pared, patron, lamp;
boolean redibujo;
String t1, t2;
int nx1, ny1, px, py, szx, szy, aumento;
int pantalla, A;
float movX;

void setup() {
  size (960, 540);
  noStroke();
  frameRate(25);

  fuenteA = loadFont("WorkSans-Medium-48.vlw");
  fuenteB = loadFont("WorkSans-Regular-48.vlw");

  boton = loadImage("replay.png");
  boton.resize(30, 30);

  fondo1 = loadImage("graff1.jpg");
  fondo1.filter(THRESHOLD, 0.7);

  estatua = loadImage("estatua1.png");
  estatua.resize(estatua.width/4*3, estatua.height/4*3);

  estatua2 = loadImage("estatua2.jpg");
  estatua2.resize(int(estatua2.width/1.5), int(estatua2.height/1.5));

  candelabro = loadImage("candelabro.png");
  candelabro.resize(candelabro.width/12*11, candelabro.height/12*11);

  pared = loadImage("pared2.jpg");

  patron = loadImage("F1.png");
  patron.filter(INVERT);

  lamp = loadImage("lamp-blanca.png");

  niebla = loadImage("580b585b2edbce24c47b263b_2.png");

  T1 = loadImage("1.jpg");
  T1.resize(0, 700);
  T2 = loadImage("2.jpg");
  T2.resize(0, 700);
  T3 = loadImage("3.jpg");
  T3.resize(0, 700);
  T4 = loadImage("4.jpg");
  T4.resize(0, 700);
  T5 = loadImage("5.jpg");
  T5.resize(0, 700);
  T6 = loadImage("6.jpg");
  T6.resize(0, 700);
  T = loadImage("7.jpg");
  T.resize(0, 700);

  textAlign (CENTER, CENTER);
  imageMode(CENTER);

  nx1 = 500;
  ny1 = 200;

  px = width/2;
  py = height/2;

  aumento = 0;
  pantalla = 0;
  A=255;
  movX=1660;
  redibujo=true;
}

void draw() {


  if (( pantalla == 0 && redibujo ) || ( pantalla == 1 && redibujo ) || ( pantalla == 2 && redibujo ) || ( pantalla == 5 && redibujo ) || ( pantalla == 6 && redibujo )) {

    if (pantalla==0) {
      t1 = "R  I  C  K  Y     W  H  I  T  T  L  E";
      t2 = "";
    } else if (pantalla==1) {
      t1 = "E  M  I  L  Y     B  R  O  W  N  I  N  G";
      t2 = "";
    } else if (pantalla==2) {
      t1 = "B  R  U  C  E     L  A  N  G  L  E  Y";
      t2 = "";
    } else if (pantalla==5) {
      t1 = "D  E  V  E  L  O  P  E  D     F  O  R     T  E  L  E  V  I  S  I  O  N     B  Y";
      t2 = "B   R   Y   A   N       F   U   L   L   E   R   &\nM   I   C   H   A   E   L       G   R   E   E   N";
      if (frameCount>= 660) {
        t1 = "T  E  L  E  P  L  A  Y      B  Y";
      }
    } else if (pantalla==6) {
      t1 = "D  I  R  E  C  T  E  D    B  Y";
      t2 = "D  A  V  I  D     S  L  A  D  E";
    }

    textFont(fuenteB);

    blendMode(BLEND);

    background (0);

    fill(255);
    if (pantalla == 5 || pantalla == 6) {
      textFont(fuenteB);
      textSize(14);
      text (t1, px, py);
      textFont(fuenteA);
      textSize(20);
      text (t2, px, py+50);
    } else {
      textSize(20);
      text (t1, px, py);
    }

    neon = get(px-nx1/2, py-ny1/2, nx1, ny1);
    neon.filter(BLUR, 3);

    fill(0);
    rect(0, 0, width, height);

    fill(255, random(230, 255));
    tint(random(200, 255));
    image(neon, px, py);

    if (pantalla == 5 || pantalla == 6) {
      textFont(fuenteB);
      textSize(14);
      text (t1, px, py);
      textFont(fuenteA);
      textSize(20);
      text (t2, px, py+50);
    } else {

      textSize(20);
      text (t1, px, py);
    }

    texto = get(px-nx1/2, py-ny1/2, nx1, ny1);

    redibujo = false;
  }

  if (pantalla == 0) {

    blendMode(BLEND);

    background(0);

    szx = texto.width+aumento;
    szy = texto.height;

    tint(150, 0, 255, 150);
    image(fondo1, width/2-60+aumento, height/2);

    strokeWeight(2);
    stroke(255, random(0, 255));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));
    line(width/2, estatua.height/4, random(150, 810), random(100, 440));

    tint(random(150, 180), 120, random(210, 255));
    image(estatua, width/2-50, estatua.height/2);

    if (frameCount>110 && frameCount<120) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(0, 200, 255, 0);
        image(texto, px, py+200, szx, szy);
      } else {

        blendMode(LIGHTEST);

        tint(180, 80, 255, A);
        image(texto, px, py+200, szx, szy);
      }
    } else {

      blendMode(ADD);
      tint(0, 200, 255, 255);
      image(texto, px, py+200, szx, szy);
    }

    blendMode(BLEND);
    tint(230, 200, 255, 100);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    movX--;

    aumento++;

    if (frameCount==120) {
      aumento=0;
      A=255;
      pantalla=1;
      redibujo=true;
    }
  }

  if (pantalla == 1) {
    blendMode(BLEND);
    background(0);
    tint(random(200, 255));
    image(estatua2, width/2-100-aumento/3, height/2-50+aumento);

    szx = texto.width+aumento;
    szy = texto.height;

    if (frameCount>230 && frameCount<240) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(255, 255, 100, 0);
        image(texto, px+220, py-130, szx, szy);
      } else {

        blendMode(LIGHTEST);

        tint(180, 80, 255, A);
        image(texto, px+220, py-130, szx, szy);
      }
    } else {

      blendMode(ADD);
      tint(255, 255, 100, 255);
      image(texto, px+220, py-130, szx, szy);
    }

    blendMode(BLEND);
    tint(255, 255, 160, 100);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==240) {
      aumento=0;
      A=255;
      pantalla=2;
      redibujo=true;
    }
  }

  if (pantalla == 2) {

    blendMode(BLEND);
    background(0);

    tint(180, 0, 220, 220);
    image(pared, width/2, height/2-50+aumento);

    blendMode(MULTIPLY);
    tint(0, 160);
    image(patron, width/2, 0+aumento);
    image(patron, width/2, height+aumento);

    blendMode(SCREEN);
    tint(255, 30);
    image(lamp, int(random(960)), int(random(540)));

    blendMode(BLEND);
    tint(255);
    image(candelabro, width/2, height/2-80+aumento*2);

    szx = texto.width+aumento;
    szy = texto.height;

    if (frameCount>350 && frameCount<360) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(220, 0, 220, 255);
        image(texto, px, py-180, szx, szy);
      } else {

        blendMode(LIGHTEST);

        tint(180, 80, 255, A);
        image(texto, px, py-180, szx, szy);
      }
    } else {

      blendMode(ADD);
      tint(220, 0, 220, 255);
      image(texto, px, py-180, szx, szy);
    }

    blendMode(BLEND);
    tint(230, 200, 255, 100);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==360) {
      aumento=0;
      A=255;
      pantalla=3;
      redibujo=true;
    }
  }

  if (pantalla == 3) {

    blendMode(BLEND);
    background(0);

    if (frameCount>360 && frameCount<380) {

      tint(255, random(200, 255));
      image(T1, width/2, height/2-50+aumento);
    }
    if (frameCount>380 && frameCount<400) {

      tint(255, random(200, 255));
      image(T2, width/2, height/2-50+aumento);
    }
    if (frameCount>400 && frameCount<420) {

      tint(255, random(200, 255));
      image(T3, width/2, height/2-50+aumento);
    }
    if (frameCount>420 && frameCount<440) {

      tint(255, random(200, 255));
      image(T4, width/2, height/2-50+aumento);
    }
    if (frameCount>440 && frameCount<460) {

      tint(255, random(200, 255));
      image(T5, width/2, height/2-50+aumento);
    }
    if (frameCount>460 && frameCount<480) {

      tint(255, random(200, 255));
      image(T6, width/2, height/2-50+aumento);
    }

    blendMode(BLEND);
    tint(150, 30, 150, 100);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==480) {
      aumento=0;
      A=255;
      pantalla=4;
      redibujo=true;
    }
  }

  if (pantalla == 4) {

    blendMode(BLEND);
    background(0);

    if (frameCount>590 && frameCount<600) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(255, 255);
        image(T, width/2, height/2, T.width-aumento, T.height-aumento);
      } else {

        blendMode(LIGHTEST);

        tint(180, 0, 255, A);
        image(T, width/2, height/2, T.width-aumento, T.height-aumento);
      }
    } else {

      blendMode(ADD);
      tint(255, 255);
      image(T, width/2, height/2, T.width-aumento, T.height-aumento);
    }

    blendMode(BLEND);
    tint(150, 30, 150, 100);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==600) {
      aumento=0;
      A=255;
      pantalla=5;
      redibujo=true;
    }
  }
  if (pantalla == 5) {

    blendMode(BLEND);
    background(0);

    tint(180, 0, 220, 130);
    image(pared, width/2, height/2-50-600+frameCount);

    szx = texto.width+aumento;
    szy = texto.height;

    if (frameCount>650 && frameCount<660 || frameCount>710 && frameCount<720) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(80, 255, 10, 255);
        image(texto, px, py-50, szx, szy);
      } else {

        blendMode(LIGHTEST);

        tint(180, 80, 255, A);
        image(texto, px, py-50, szx, szy);
      }
    } else {

      blendMode(ADD);
      tint(80, 255, 10, 255);
      image(texto, px, py-50, szx, szy);
    }

    blendMode(BLEND);
    tint(230, 200, 255, 50);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==660) {
      aumento=0;
      A=255;
      redibujo=true;
    }
    if (frameCount==720) {
      aumento=0;
      A=255;
      pantalla=6;
      redibujo=true;
    }
  }

  if (pantalla == 6) {

    blendMode(BLEND);
    background(0);

    tint(180, 0, 220, 130);
    image(pared, width/2, height/2-50-600+frameCount);
    image(pared, width/2, height/2-pared.height-50-600+frameCount);

    szx = texto.width+aumento;
    szy = texto.height;

    if (frameCount>770 && frameCount<780) {

      A=A-12;

      if (int(random(0.9, 4))==1) {

        blendMode(ADD);

        tint(80, 255, 10, 255);
        image(texto, px, py-50, szx, szy);
      } else {

        blendMode(LIGHTEST);

        tint(180, 80, 255, A);
        image(texto, px, py-50, szx, szy);
      }
    } else {

      blendMode(ADD);
      tint(80, 255, 10, 255);
      image(texto, px, py-50, szx, szy);
    }

    blendMode(BLEND);
    tint(230, 200, 255, 50);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    if (movX<=-niebla.width/1.9) {
      movX=width/2+niebla.width/1.9;
    }

    aumento++;
    movX--;

    if (frameCount==785) {
      aumento=0;
      A=255;
      pantalla=7;
      redibujo=true;
    }
  }

  if (pantalla==7) {
    background(0);

    tint(180, 0, 220, 130);
    image(pared, width/2, height/2+135);
    image(pared, width/2, height/2-pared.height+135);

    tint(230, 200, 255, 50);
    image(niebla, movX-200, height);
    image(niebla, -movX+niebla.width/2, height);

    movX--;
  }

  if (mouseX>=width-35 && mouseX<=width-35+30 && mouseY>=5 && mouseY<= 35) {
    fill(200, 20, 15, 255);
  } else {
    fill(240, 40, 30, 255);
  }
  noStroke();
  rect(width-35, 5, 30, 30, 8, 8, 8, 8);
  tint(255);
  image(boton, width-20, 20);

  println("FPS: "+frameRate);
  println("Frame: "+frameCount);
  println("Pantalla: "+pantalla);
}

void mousePressed() {
  if (mouseX>=width-35 && mouseX<=width-35+30 && mouseY>=5 && mouseY<= 35) {
    frameCount=0;
    pantalla=0;
    aumento=0;
    A=255;
    movX=1660;
    redibujo=true;
  }
}
