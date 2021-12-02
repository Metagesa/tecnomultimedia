import processing.sound.*;
Aventura necesitoUnaMano;

void setup() {
  size(800, 600);
  necesitoUnaMano = new Aventura(this);
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
