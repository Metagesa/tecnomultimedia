void cargarTexto() {
  if (numP > 0) {
    texto =  loadStrings(pantalla[numP]+".txt");
  }
}

boolean botonPres(float posX, float posY, float tamX, float tamY) {

  if (mouseX> posX && mouseX< posX+tamX*1.2 && mouseY> posY && mouseY< posY+tamY*1.2) {
    return true;
  } else {
    return false;
  }
}

void boton(float posX, float posY, float tamX, float tamY, color colBot, String textoB, boolean cambia) {
  strokeWeight(10);
  stroke(0, 0, 255, 50);
  fill(255, 200);
  rect(posX, posY, tamX*1.2, tamY*1.2, tamX*1.2/10);

  pushStyle();
  strokeWeight(5);
  stroke(0, 50);
  rectMode(CENTER);
  fill(colBot);
  rect(posX+(tamX*1.2)/2, posY+(tamY*1.2)/2, tamX*1.12, tamY, tamX/10);
  popStyle();

  pushStyle();
  textAlign(CENTER, CENTER);
  textSize(tamX/textoB.length()*1.8);
  fill(0);
  text(textoB, posX+(tamX*1.2)/2, posY+(tamY*1.2)/2);
  popStyle();

  if (!(textoB.equals("Créditos")) && !(textoB.equals("Cerrar"))) {
    if (textoB.equals("Volver al inicio") && mousePressed && (botonPres(posX, posY, tamX, tamY))) {
      dial=0;
      numP=0;
    } else if (botonPres(posX, posY, tamX, tamY)) {
      if (cambia) {
        botonA = true;
      }
      if (pantalla[numP].equals("Decision")) {
        botonB = true;
      }
    } else {
      if (cambia) {
        botonA = false;
      }
      botonB = false;
    }
  }
}

void pantalla(PImage fondo, boolean dial, String dialogo, color texto, int tam, PFont fuente, int botones, String[] textoBotones) {

  image(fondo, 0, 0);

  textFont(fuente);
  fill(texto);

  if (dial) {
    dialogo(dialogo, tam, 8, texto);
  }

  for (int i = 0; i<botones; i++) {
    boton(width/1.3 - width/2 * i, height/5*4, 140, 40, color(50, 50, 255), textoBotones[i], true);
  }
}
