PShader shader;

// Variables pour faire bouger la caméra avec la souris
final PVector vecY = new PVector(0, 1, 0);
float rayon = 100;
float theta = 0;
float phi = 0;
float camX, camY, camZ;
float pointX, pointY, pointZ;

ArrayList<Integer> pressedKeys = new ArrayList();

final int whiteCol = color(255, 255, 255);
final int[] whiteCols = {whiteCol, whiteCol, whiteCol, whiteCol, whiteCol, whiteCol};

PVector[] lightPos = {
	//new PVector( 300, 300,  300),
	new PVector(-200, 300,    0),
	new PVector( 200, 300,    0),
	new PVector(   0, 300,  200),
	new PVector(   0, 300, -200)
};

PVector[] lightColor = {
	//new PVector(255, 255, 255),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100)
};
Chaise chaise, chaise2;
Table table;
Tour tour;
Tableau tableau;
PShape para, cyl;
Salle salle;
Repere re;
Camera camera;

// Textures
public PImage wood, metal, white;
PImage[] aTexWhite, aTexMetal, aTexWood;
void setup() {
	// SETTINGS AND SHADER
	size(800, 800, P3D);
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
	camera = new Camera(0, -100, 250, 0, -30, 0);
	chaise = new Chaise(0, 0, 0);
	chaise2 = new Chaise(30, 0, 0);
	table = new Table(-20, 0, 10);
	salle = new Salle();
	tour = new Tour(20, -31, 15);
	tableau = new Tableau(170, -60, Salle.LONGUEUR_SALLE/2-1);


	cyl = new Cylinder(100, -100, 100, 30, 200).getShape();
	re = new Repere();

	//para = creerParalepipede(0.0,0.0,0.0, 10.0, 10.0, 10.0, whites, new int[] {color(255, 255, 0), color(255, 0, 255), whiteCol, color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)});
}

void draw() {
	background(0);

	// Calcul de la position de la caméra dans la classe Camera
	for(Integer keyC : pressedKeys) camera.moveFromKeyCode(keyC);
	camera.viser();

	shader(shader);
	ambientLight(20, 20, 20);

	for(int i=0; i<lightPos.length; i++) {
		lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
		pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
		lightPos[i].x, lightPos[i].y, lightPos[i].z);
	}

	re.dessine();
	chaise.dessine();
	chaise2.dessine();
	table.dessine();
	salle.drawShape();
	tour.dessine();
	tableau.dessine();
	//shape(cyl);
	//shape(para);
}


PShape creerParalepipede() {
	return null;
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

public final static int[] NOT_SHINY = {-1, -1, -1, -1, -1, -1};
public static int[] toArraySix(int i) {return new int[] {i,i,i,i,i,i};}
public static PImage[] toArraySix(PImage i) {return new PImage[] {i,i,i,i,i,i};}
