public class Repere {
  PShape x, y, z;
  Repere() {
    x = new Box(20, 0, 0, 2, -2, 2, color(255, 0, 0)).getShape();
    y = new Box(0, -20, 0, 2, -2, 2, color(0, 0, 255)).getShape();
    z = new Box(0, 0, 20, 2, -2, 2, color(0, 255, 0)).getShape();
  }
  
  void dessine() {
    shape(x);
    shape(y);
    shape(z);
  }
}
