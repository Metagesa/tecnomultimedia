void luz (int a) {
  pushStyle();
  imageMode(CENTER);
  tint(255, 0, 0, a);
  image(luz, width, 0);
  popStyle();
  println(a);
}
