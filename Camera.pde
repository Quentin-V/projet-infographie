public class Camera {
  final PVector yNorm = new PVector(0, 1, 0);
  PVector camVec, pos, vis;
  float fac = 5;
  public Camera(float posX, float posY, float posZ, float visX, float visY, float visZ) {
    pos = new PVector(posX, posY, posZ);
    vis = new PVector(visX, visY, visZ);
    camVec = PVector.sub(vis, pos);
  }
  void viser() {
    camera(pos.x, pos.y, pos.z,
         vis.x, vis.y, vis.z,
         0, 1, 0); 
  }
  void forward(float fac) {
      pos.add(camVec.copy().normalize().mult(fac));
  }
  
  void backward(float fac) {
    forward(-fac);
  }
  
  void left(float fac) {
    PVector perpendicular = getPerpendicularWithY(camVec).mult(-fac);
    pos.add(perpendicular);
    vis.add(perpendicular);
  }
  
  void right(float fac) {
    left(-fac);
  }
  
  void up(float fac) {
    PVector yNormMult = yNorm.copy().mult(-fac);
    pos.add(yNormMult);
    vis.add(yNormMult);
  }
  
  void down(float fac) {
    up(-fac); 
  }
  
  void visUp(float fac) {
    vis.add(yNorm.copy().mult(-fac));
  }
  
  void visDown(float fac) {
    visUp(-fac); 
  }
  
  void visLeft(float fac) {
    PVector perpendicular = getPerpendicularWithY(camVec).mult(-fac);
    vis.add(perpendicular);
  }
  
  void visRight(float fac) {
    visLeft(-fac); 
  }
  
  void moveFromKeyCode(int kc) {
    //System.out.println(keyCode);
    switch(kc) {
      case 87: // z
        forward(fac);
        break;
      case 65: // q
        left(fac);
        break;
      case 83: // s
        backward(fac);
        break;
      case 68: // d
        right(fac);
        break;
      case 16: // Shift
        down(fac);
        break;
      case 32: // Space
        up(fac);
        break;
      case UP:
        visUp(fac);
        break;
      case 37: // LEFTARROW
        visLeft(fac);
        break;
      case DOWN:
        visDown(fac);
        break;
      case 39: // RIGHTARROW
        visRight(fac);
        break;
    }
    camVec = PVector.sub(vis, pos);
  }
  
  void addFac(float inc) {
    if(inc < 0 && fac <= 0 || inc > 0 && fac >= 50) return;
    fac += inc; 
  }
  
  PVector getPerpendicularWithY(PVector v) {
     return v.copy().normalize().cross(yNorm);
  }
}
