class Mapa {
  //CAMPO
  float x, y, w, h;
  int cant = 400;

  //CONSTRUCTOR
  Mapa() {
  }
  //METODO
  void draw() {
    push();

    strokeWeight(20);
    stroke(255);
    noFill();
    rect(0, 0, 800, 600);

    strokeWeight(10);
    fill(255);
    rect(100, 5, width, 20);
    rect(205, 20, 355, 30);
    rect(5, 90, 50, 130);
    rect(630, 130, 66, 66); // y<
    rect(655, 105, 15, 15);
    rect(705, 155, 15, 15);
    rect(150, 155, 500, 15);
    rect(655, 205, 15, 65);
    rect(505, 255, 66, 66);//cuadrado medio
    rect(205, 170, 40, 75);
    rect(380, 405, 500, 40);
    rect(380, 330, 15, 70);
    rect(155, 330, 215, 15);
    rect(330, 255, 40, 75);
    rect(380, 555, 500, 40);
    rect(255, 455, 40, 65);
    rect(130, 455, 40, 200);
    rect(10, 455, 40, 40);

    pop();
  }
  
  void colision(){
  
  }
}
