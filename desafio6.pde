//Clase que me dibuja una secuencia de imágenes que se pueden mover en el eje X con un movimiento rápido y uno lento.

chika a;

void setup() {
  size(800, 200);

  a = new chika();

  imageMode(CENTER);
  frameRate(40); //Ajusto el frameRate para que se reproduzca bien el sprite
}

void draw() {
  background(255);

  a.dibujar(width/4, height-(a.baile[0].height/2));
  a.movimiento(0, false); //Movimiento base: la imagen se mueve a la izquierda y derecha por si sola
}

void keyPressed() {
  
  //MOVIMIENTOS
  
  if (keyCode == RIGHT) { //Si presiono la tecla derecha, a.mover(true) me da movimiento rápido, y a.movimiento(,true) me hace ir a la derecha
    a.movimiento(a.mover(true), true);
  } else if (keyCode == UP) { //Si presiono la tecla arriba, a.mover(false) me da movimiento lento, y a.movimiento(,true) me hace ir a la derecha
    a.movimiento(a.mover(false), true);
  } else if (keyCode == LEFT) { //Si presiono la tecla izquierda, a.mover(true) me da movimiento rápido, y a.movimiento(,false) me hace ir a la izquierda
    a.movimiento((a.mover(true)), false);
  } else if (keyCode == DOWN) { //Si presiono la tecla derecha, a.mover(false) me da movimiento lento, y a.movimiento(,false) me hace ir a la izquierda
    a.movimiento((a.mover(false)), false);
  }
}
