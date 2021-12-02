class Pantalla {

  Dialogo dialogo;
  PFont fuente;

  Pantalla (String D, color t, int Tam) {
    dialogo = new Dialogo (D, Tam, 8, t);
    fuente = loadFont("WorkSans-Regular-48.vlw");
  }

  void draw(PImage fondo, boolean dial, String D) {

    image(fondo, 0, 0);

    textFont(fuente);

    if (dial) {
      dialogo.texto = D;
      dialogo.draw();
    }
  }
}
