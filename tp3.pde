//-----------------------------------
//-----------------------------------
//---https://youtu.be/JEybJuwOYtM----
//-----------------------------------
//-----------------------------------
//--------Juan Lutz 88196/6----------
//-----------------------------------
//-----------------------------------

int p, p2;
int limp;
int vel;
int lin;

int py1, py2, py3;
int px1, px2;
int pw, pw2;
int r, r1, r2, g, g1, g2, b, b1, b2;
boolean pm=true;
boolean fondo = false, le = true, li = false;

void setup() {
  size(800, 800);
  stroke(255);
  textAlign(CENTER, CENTER);

  surface.setResizable(true);
  surface.setLocation(displayWidth/2-width/2, displayHeight/2-height/2);

  p=0;
  p2=0;

  limp=60;
  vel=6;
  lin=40;

  //-----------------------------------

  r1=255;
  g1=0;
  b1=0;

  r2=255;
  g2=255;
  b2=255;

  r=0;
  g=0;
  b=0;
}

void draw() {

  if (width > height) surface.setSize(height, height);
  if (width < height) surface.setSize(width, width);

  pw=width/40;
  pw2=int(pw*3);

  //-----------------------------------


  px1=int(map(vel, 11, 1, pw/2, pw*4.5));
  px2=int(map(limp, 0, 120, pw/2, pw*4.5));
  if (le) {
    py1=int(map(r1, 0, 255, pw2, pw2*5));
    py2=int(map(g1, 0, 255, pw2, pw2*5));
    py3=int(map(b1, 0, 255, pw2, pw2*5));
  } else if (li) {
    py1=int(map(r2, 0, 255, pw2, pw2*5));
    py2=int(map(g2, 0, 255, pw2, pw2*5));
    py3=int(map(b2, 0, 255, pw2, pw2*5));
  } else if (fondo) {
    py1=int(map(r, 0, 255, pw2, pw2*5));
    py2=int(map(g, 0, 255, pw2, pw2*5));
    py3=int(map(b, 0, 255, pw2, pw2*5));
  }


  //-----------------------------------

  strokeWeight(width/200);
  background(r, g, b);
  rectMode(CORNER);

  pushMatrix();
  translate(pw2, 0);

  for (int r=0; r<360; r+=lin) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(r));

    stroke(r2, g2, b2);
    line(0, height/10, 0, height/5);


    line(0, height/10, width/40, height/10+p/vel);
    line(0, height/10, -width/40, height/10+p/vel);

    //-----------------------------------

    stroke(r1, g1, b1);

    translate(0, height/5);
    line(0, 0, 0, height/10);


    line(0, 0, width/40, p2/vel);
    line(0, 0, -width/40, p2/vel);

    line(0, height/10, width/40, height/10+p/vel);
    line(0, height/10, -width/40, height/10+p/vel);

    popMatrix();
  }

  popMatrix();

  fill(93, 193, 185);
  noStroke();
  rect(0, height-pw2, width, pw2);
  rect(0, 0, pw2*2, height);
  rect(0, 0, width, pw2);
  rect(width-pw, 0, pw2, height);

  //-----------------------------------

  fill(255);
  strokeWeight(width/300);
  stroke(0);
  line(pw, pw2, pw, pw2*5);

  noStroke();
  if (dist(mouseX, mouseY, pw, py1)<=pw) {
    circle(pw, py1, pw);
  } else {
    circle(pw, py1, pw*0.7);
  }

  fill(255);
  strokeWeight(width/300);
  stroke(0);
  line(pw*2+pw/2, pw2, pw*2+pw/2, pw2*5);

  noStroke();
  if (dist(mouseX, mouseY, pw*2+pw/2, py2)<=pw) {
    circle(pw*2+pw/2, py2, pw);
  } else {
    circle(pw*2+pw/2, py2, pw*0.7);
  }

  fill(255);
  strokeWeight(width/300);
  stroke(0);
  line(pw*3+pw, pw2, pw*3+pw, pw2*5);

  noStroke();
  if (dist(mouseX, mouseY, pw*3+pw, py3)<=pw) {
    circle(pw*3+pw, py3, pw);
  } else {
    circle(pw*3+pw, py3, pw*0.7);
  }

  textSize(width/50);
  fill(0);
  text("R    G    B", pw*2+pw/2, pw2*5.3);

  //-----------------------------------

  rectMode(CENTER);
  textSize(width/65);


  if (le) {
    fill(128);
  } else if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*6-pw/2 && mouseY<=pw2*6+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*6, pw*4.5, pw);
  fill(255);
  text("Linea exterior", pw*2.5, pw2*6);

  if (li) {
    fill(128);
  } else if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*6.5-pw/2 && mouseY<=pw2*6.5+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*6.5, pw*4.5, pw);
  fill(255);
  text("Linea interior", pw*2.5, pw2*6.5);

  if (fondo) {
    fill(128);
  } else if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*7-pw/2 && mouseY<=pw2*7+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*7, pw*4.5, pw);
  fill(255);
  text("Fondo", pw*2.5, pw2*7);

  if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*8-pw/2 && mouseY<=pw2*8+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*8, pw*4.5, pw);
  fill(255);
  text("Restablecer", pw*2.5, pw2*8);

  if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*9-pw/2 && mouseY<=pw2*9+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*9, pw*4.5, pw);
  fill(255);
  text("Añadir lineas", pw*2.5, pw2*9);

  if (mouseX>=pw/4 && mouseX<=pw*4.7 && mouseY>=pw2*9.5-pw/2 && mouseY<=pw2*9.5+pw/2) {
    fill(80);
  } else {
    fill(0);
  }
  rect(pw*2.5, pw2*9.5, pw*4.5, pw);
  fill(255);
  text("Sacar lineas", pw*2.5, pw2*9.5);


  //-----------------------------------


  fill(0);
  text("Velocidad", pw*2.5, pw2*10.6);

  fill(255);
  strokeWeight(width/300);
  stroke(0);
  line(pw/2, pw2*11, pw*4.5, pw2*11);

  noStroke();
  if (dist(mouseX, mouseY, px1, pw2*11)<=pw*1.5) {
    circle(px1, pw2*11, pw);
  } else {
    circle(px1, pw2*11, pw*0.7);
  }

  fill(0);
  text("Movimiento", pw*2.5, pw2*11.6);

  fill(255);
  strokeWeight(width/300);
  stroke(0);
  line(pw/2, pw2*12, pw*4.5, pw2*12);

  noStroke();
  if (dist(mouseX, mouseY, px2, pw2*12)<=pw*1.5) {
    circle(px2, pw2*12, pw);
  } else {
    circle(px2, pw2*12, pw*0.7);
  }

  //-----------------------------------

  if (p>limp && pm) {
    pm=false;
  } else if (p<-limp && !pm) {
    pm=true;
  }
  if (pm) {
    p++;
    p2--;
  } else {
    p--;
    p2++;
  }
}

void mousePressed() {
  if (mouseX>=pw/4 && mouseX<=pw*4.7) {
    if (mouseY>=pw2*6-pw/2 && mouseY<=pw2*6+pw/2) {
      le=true;
      fondo=false;
      li=false;
      py1=int(map(r1, 0, 255, pw2, pw2*5));
      py2=int(map(g1, 0, 255, pw2, pw2*5));
      py3=int(map(b1, 0, 255, pw2, pw2*5));
    }
    if (mouseY>=pw2*6.5-pw/2 && mouseY<=pw2*6.5+pw/2) {
      li=true;
      le=false;
      fondo=false;
      py1=int(map(r2, 0, 255, pw2, pw2*5));
      py2=int(map(g2, 0, 255, pw2, pw2*5));
      py3=int(map(b2, 0, 255, pw2, pw2*5));
    }
    if (mouseY>=pw2*7-pw/2 && mouseY<=pw2*7+pw/2) {
      fondo=true;
      li=false;
      le=false;
      py1=int(map(r, 0, 255, pw2, pw2*5));
      py2=int(map(g, 0, 255, pw2, pw2*5));
      py3=int(map(b, 0, 255, pw2, pw2*5));
    }
    if (mouseY>=pw2*8-pw/2 && mouseY<=pw2*8+pw/2) {
      r=0;
      g=0;
      b=0;

      r1=255;
      g1=0;
      b1=0;

      r2=255;
      g2=255;
      b2=255;

      lin=40;

      vel=6;
      limp=60;
    }
    if (mouseY>=pw2*9-pw/2 && mouseY<=pw2*9+pw/2 && lin > 20 && lin < 90) {
      lin=lin-20;
    } else if (mouseY>=pw2*9-pw/2 && mouseY<=pw2*9+pw/2 && lin > 60) {
      lin=lin-30;
    }
    if (mouseY>=pw2*9.5-pw/2 && mouseY<=pw2*9.5+pw/2 && lin < 60) {
      lin=lin+20;
    } else if (mouseY>=pw2*9.5-pw/2 && mouseY<=pw2*9.5+pw/2 && lin < 120) {
      lin=lin+30;
    }
  }
}

void mouseDragged() {
  if (mouseY>=pw2 && mouseY<=pw2*5) {
    if (mouseX>=pw*0.5 && mouseX<=pw*1.5) {
      py1=mouseY;
      if (le) {
        r1=int(map(py1, pw2, pw2*5, 0, 255));
      } else if (li) {
        r2=int(map(py1, pw2, pw2*5, 0, 255));
      } else if (fondo) {
        r=int(map(py1, pw2, pw2*5, 0, 255));
      }
    } else
      if (mouseX>=pw*2+pw/2*0.5 && mouseX<=pw*2+pw/2*1.5) {
        py2=mouseY;
        if (le) {
          g1=int(map(py2, pw2, pw2*5, 0, 255));
        } else if (li) {
          g2=int(map(py2, pw2, pw2*5, 0, 255));
        } else if (fondo) {
          g=int(map(py2, pw2, pw2*5, 0, 255));
        }
      } else
        if (mouseX>=pw*3+pw*0.5 && mouseX<=pw*3+pw*1.5) {
          py3=mouseY;
          if (le) {
            b1=int(map(py3, pw2, pw2*5, 0, 255));
          } else if (li) {
            b2=int(map(py3, pw2, pw2*5, 0, 255));
          } else if (fondo) {
            b=int(map(py3, pw2, pw2*5, 0, 255));
          }
        }
  } else if (mouseX > pw/2 && mouseX < pw*4.5) {
    if (mouseY<pw2*11.2 && mouseY>pw2*10.8) {
      px1=mouseX;
      vel=int(map(px1, pw/2, pw*4.5, 11, 1));
    } else
      if (mouseY<pw2*12.2 && mouseY>pw2*11.8) {
        px2=mouseX;
        limp=int(map(px2, pw/2, pw*4.5, 0, 120));
      }
  }
}
