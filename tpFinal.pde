Aventura necesitoUnaMano;

void setup() {
  size(800, 600);
  necesitoUnaMano = new Aventura();
}

void draw() {
  necesitoUnaMano.draw();
}

void mouseReleased() {
  necesitoUnaMano.mouse();
}

void keyPressed() {
  necesitoUnaMano.keyP();
}

void keyReleased() {
  necesitoUnaMano.keyR();
}
