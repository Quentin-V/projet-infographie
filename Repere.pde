public class Repere {
  PShape x, y, z;
  Repere() {
    x = creerParalepipede(20, 0, 0, 2, -2, 2, color(255, 0, 0));
    y = creerParalepipede(0, -20, 0, 2, -2, 2, color(0, 0, 255));
    z = creerParalepipede(0, 0, 20, 2, -2, 2, color(0, 255, 0));
  }
  
  void dessine() {
    shape(x);
    shape(y);
    shape(z);
  }
}
