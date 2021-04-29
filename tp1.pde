void setup() {
  size(1000, 1000);

  colorMode(HSB, 360, 100, 100);

  strokeCap(SQUARE);

  smooth();
}


void draw() {
  background(0, 0, 0);

  noFill();

  //RGB

  strokeWeight(80);

  stroke(360, 100, 100);
  arc(500, 500, 680, 680, radians(315), radians(345));

  stroke(360/12*4, 100, 100);
  arc(500, 500, 680, 680, radians(75), radians(105));

  stroke(360/12*8, 100, 100);
  arc(500, 500, 680, 680, radians(195), radians(225));

  //SECUNDARIOS

  strokeWeight(60);

  stroke(360/12*2, 100, 100);
  arc(500, 500, 700, 700, radians(15), radians(45));

  stroke(360/12*6, 100, 100);
  arc(500, 500, 700, 700, radians(135), radians(165));

  stroke(360/12*10, 100, 100);
  arc(500, 500, 700, 700, radians(255), radians(285));

  //TERCIARIOS

  strokeWeight(40);

  stroke(360/12, 100, 100);
  arc(500, 500, 795, 795, radians(-15), radians(15));

  stroke(360/12*3, 100, 100);
  arc(500, 500, 795, 795, radians(45), radians(75));

  stroke(360/12*5, 100, 100);
  arc(500, 500, 795, 795, radians(105), radians(135));

  stroke(360/12*7, 100, 100);
  arc(500, 500, 795, 795, radians(165), radians(195));

  stroke(360/12*9, 100, 100);
  arc(500, 500, 795, 795, radians(225), radians(255));

  stroke(360/12*11, 100, 100);
  arc(500, 500, 795, 795, radians(285), radians(315));

  //DETALLES

  stroke(0, 0, 20, 100);
  strokeWeight(5);

  line(500, 180, 500, 500);
  line(223, 662, 500, 500);
  line(775, 662, 500, 500);

  strokeWeight(10);
  stroke(0, 0, 20);

  circle(500, 500, 845);
  
  line(500, 790, 500, 500);
  line(242, 365, 500, 500);
  line(758, 365, 500, 500);

  triangle(500, 790, 242, 365, 758, 365);
}
