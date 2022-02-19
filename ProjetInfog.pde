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
	new PVector(180, 180, 180),
	new PVector(180, 180, 180),
	new PVector(180, 180, 180),
	new PVector(180, 180, 180)
};

Salle salle;
Tableau tableau;
Camera camera;
ArrayList<TableComplete> tablesCompletes;

// Textures
public PImage wood, metal, white;
PImage[] aTexWhite, aTexMetal, aTexWood;
void setup() {
	// SETTINGS AND SHADER
	size(1920, 1080, P3D);
	textureWrap(REPEAT);
	shader = loadShader("./LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");

	// TEXTURES
	wood = loadImage("./wood.jpg");
	metal = loadImage("./metal.jpg");
	white = loadImage("./white.jpg");
	aTexWood = new PImage[] {wood, wood, wood, wood, wood, wood};
	aTexMetal = new PImage[] {metal, metal, metal, metal, metal, metal};
	aTexWhite = new PImage[] {white, white, white, white, white, white};

	// OBJETS
	camera = new Camera(0, -100, -250);
	salle = new Salle();
	tableau = new Tableau(170, -60, Salle.LONGUEUR_SALLE/2-1);
	tablesCompletes = new ArrayList<TableComplete>();
	for(int x = -300; x <= 100; x += 161)
		for(int z = -350; z <= 300; z += 150)
			tablesCompletes.add(new TableComplete(x, 0, z));
}

void draw() {
	background(0);

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

void mouseMoved() {
	if(pmouseX < mouseX) camera.visRight(Camera.angFac);
	else if(pmouseX > mouseX) camera.visLeft(Camera.angFac);
	if(pmouseY < mouseY) camera.visDown(Camera.angFac);
	else if(pmouseY > mouseY) camera.visUp(Camera.angFac);
}

