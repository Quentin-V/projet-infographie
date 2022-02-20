public class Camera {

  
  float fac = 5;
  float angFac = 1;

  final PVector yNorm = new PVector(0, 1, 0);
  PVector camVec, pos;
  float angX, angY;
  boolean  camChanged;
  public Camera(float posX, float posY, float posZ) {
    pos = new PVector(posX, posY, posZ);
    camVec = new PVector(1, 0, 0);
    angX = angY = 0;
    camChanged = true;
  }
  public Camera(float posX, float posY, float posZ, float angX, float angY) {
    this(posX, posY, posZ);
    this.angX = angX;
    this.angY = angY;
  }
  void viser() {
    if(!camChanged) return;
    // Calcul de la position
    camVec.x = cos(angY) * sin(angX);
    camVec.y = sin(angY);
    camVec.z = cos(angY) * cos(angX);
    camera(pos.x,            pos.y,             pos.z,
           pos.x + camVec.x, pos.y + camVec.y,  pos.z + camVec.z,
           0,                1,                 0);
    camChanged = false;
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
  }
  
  void right(float fac) {
    left(-fac);
  }
  
  void up(float fac) {
    PVector yNormMult = yNorm.copy().mult(-fac);
    pos.add(yNormMult);
  }
  
  void down(float fac) {
    up(-fac); 
  }
  
  void visUp(float fac) {
    angY -= (fac/360) * 2*PI;
  }
  
  void visDown(float fac) {
    visUp(-fac); 
  }
  
  void visLeft(float fac) {
    angX += (fac/360) * 2*PI;
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
        visUp(angFac);
        break;
      case 37: // LEFTARROW
        visLeft(angFac);
        break;
      case DOWN:
        visDown(angFac);
        break;
      case 39: // RIGHTARROW
        visRight(angFac);
        break;
    }
    camChanged = true;
  }
  
  void addFac(float inc) {
    if(inc < 0 && fac <= 0 || inc > 0 && fac >= 50) return;
    fac += inc; 
  }
  
  PVector getPerpendicularWithY(PVector v) {
     return v.copy().normalize().cross(yNorm);
  }
}
