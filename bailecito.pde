class chika {

  PImage[] baile = new PImage[140];

  float contador = 0;
  boolean invert = false;

  chika() { //CONSTRUCTOR: carga de imágenes y un resize para cambiarles el tamaño
  
    for (int i = 0; i<140; i++) {
      baile[i] = loadImage("frame_"+nf(i, 3)+"_delay-0.04s.png");
      baile[i].resize(200, 0);
    }
  }

  float mover(boolean moviendoR) { //Metodo para saber si me estoy moviendo rápido o no

    //Si me muevo rápido, devolver 3, sino devolver 1
    if (moviendoR) {
      return 3;
    } else {
      return 1;
    }
  }

  void movimiento (float x, boolean dir) {   //Método para la lógica y matemática del movimiento

    //Invierto el movimiento en cuanto cambia de dirección
    if (frameCount%70 == 0) {        
      invert = !invert;
    }

    //Movimiento base: aumento o disminuyo la variable según el valor que me de invert
    if (!invert) {
      contador++;
    } else if (invert) {
      contador--;
    }

    //Si dir = true, voy a la derecha. Sino, voy a la izquierda
    if (dir) {
      contador = contador + x;
    } else {
      contador = contador - x;
    }
  }

  void dibujar(float posX, float posY) { //Dibujo las imágenes

    posX = posX+(contador);

    image(baile[frameCount%140], posX, posY);
  }
}
