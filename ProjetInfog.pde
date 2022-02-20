PShader shader;

// Constantes globales
public final static int[] NOT_SHINY = {-1, -1, -1, -1, -1, -1};
public final PVector vecY = new PVector(0, 1, 0);
public final int whiteCol = color(255, 255, 255);
public final int[] whiteCols = {whiteCol, whiteCol, whiteCol, whiteCol, whiteCol, whiteCol};

// Méthodes utiles
public static int[] toArraySix(int i) {return new int[] {i,i,i,i,i,i};}
public static PImage[] toArraySix(PImage i) {return new PImage[] {i,i,i,i,i,i};}

ArrayList<Integer> pressedKeys = new ArrayList();

PVector[] lightPos = {
	//new PVector( 300, 300,  300),
	new PVector(-360, 300,  490),
	new PVector(-360, 300, -490),
	new PVector( 360, 300,  490),
	new PVector( 360, 300, -490)
};

PVector[] lightColor = {
	//new PVector(255, 255, 255),
	new PVector(140, 140, 140),
	new PVector(140, 140, 140),
	new PVector(140, 140, 140),
	new PVector(140, 140, 140)
};

Salle salle;
Tableau tableau;
Camera camera;
ArrayList<TableComplete> tablesCompletes;

// Textures
public PImage wood, metal, white, back;
PImage[] aTexWhite, aTexMetal, aTexWood;

int pwidth, pheight;
void setup() {
	// SETTINGS AND SHADER
	size(1280, 720, P3D);
	textureWrap(REPEAT);
	shader = loadShader("./LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");

	// Background
	back = loadImage("./back.jpg");

	// TEXTURES
	wood = loadImage("./wood.jpg");
	metal = loadImage("./metal.jpg");
	white = loadImage("./white.jpg");
	aTexWood = new PImage[] {wood, wood, wood, wood, wood, wood};
	aTexMetal = new PImage[] {metal, metal, metal, metal, metal, metal};
	aTexWhite = new PImage[] {white, white, white, white, white, white};

	// OBJETS
	camera = new Camera(200, -300, -400, -PI/6, PI/8);
	salle = new Salle();
	tableau = new Tableau(170, -60, Salle.LONGUEUR_SALLE/2-1);
	
	tablesCompletes = new ArrayList<TableComplete>();

	for(int x = -300; x <= 100; x += 161)
		for(int z = -350; z <= 300; z += 150)
			tablesCompletes.add(new TableComplete(x, 0, z));

  pwidth = pheight = 0;
}

void draw() {
  if(pwidth != width || pheight != height) { // Detect resizing
    back.resize(width, height);
    camera.camChanged = true;
  }
  
  //background(back);
  pwidth = width;
  pheight = height;

	// Calcul de la position de la caméra dans la classe Camera
	beginCamera();
	for(Integer keyC : pressedKeys) camera.moveFromKeyCode(keyC);
	camera.viser();
	endCamera();

	shader(shader);
	ambientLight(20, 20, 20);

	for(int i=0; i<lightPos.length; i++) {
		lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
		pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
		lightPos[i].x, lightPos[i].y, lightPos[i].z);
	}

	salle.drawShape();
	tableau.dessine();
	tablesCompletes.forEach(TableComplete::dessine);
}

void keyPressed() {
	pressedKeys.add(keyCode);
}

void keyReleased() {
	pressedKeys.remove(pressedKeys.indexOf(keyCode));
}

void mouseWheel(MouseEvent event) {
	camera.addFac(event.getCount());
}
/*
void mouseMoved() {
	if(pmouseX < mouseX) camera.visRight(camera.angFac);
	else if(pmouseX > mouseX) camera.visLeft(camera.angFac);
	if(pmouseY < mouseY) camera.visDown(camera.angFac);
	else if(pmouseY > mouseY) camera.visUp(camera.angFac);
	camera.camChanged = true;
}
*/
