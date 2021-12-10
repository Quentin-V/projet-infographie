PShader shader;

// Variables pour faire bouger la caméra avec la souris
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
	new PVector( 0, -100,  0),
	//new PVector(-50, 100, 0),
	//new PVector(0, 100, -50),
	new PVector(50, 100, 50)
};

PVector[] lightColor = {
	//new PVector(255, 255, 255),
	new PVector(255, 255, 255),
	//new PVector(255, 255, 255),
	//new PVector(255, 255, 255),
	new PVector(255, 255, 255)
};
Chaise chaise, chaise2;
Table table;
Tour tour;
PShape para;
PShape murs, sol;
PImage wood, metal, white;
PImage[] woods, metals, whites;
Repere re;
Camera camera;
void setup() {
	size(800, 800, P3D);
	shader = loadShader("./LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");
	wood = loadImage("./wood.jpg");
	metal = loadImage("./metal.jpg");
	white = loadImage("./white.jpg");
	woods = new PImage[] {wood, wood, wood, wood, wood, wood};
	metals = new PImage[] {metal, metal, metal, metal, metal, metal};
	whites = new PImage[] {white, white, white, white, white, white};
	camera = new Camera(0, -100, 250, 0, -30, 0);
	chaise = new Chaise(0, 0, 0);
	chaise2 = new Chaise(30, 0, 0);
	table = new Table(-20, 0, 10);
	murs = creerMurs();
	sol = creerParalepipede(-200, 0, -400, 400, 1, 800);
	tour = new Tour(20, -31, 15);
	re = new Repere();

	//para = creerParalepipede(0.0,0.0,0.0, 10.0, 10.0, 10.0, whites, new int[] {color(255, 255, 0), color(255, 0, 255), whiteCol, color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)});

}

void draw() {
	background(0);

	// Calcul de la position de la caméra dans la classe Camera
	for(Integer keyC : pressedKeys) camera.moveFromKeyCode(keyC);
	camera.viser();

	shader(shader);
	ambientLight(10, 10, 10);
	for(int i=0; i<lightPos.length; i++) {
		lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
		pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
		lightPos[i].x, lightPos[i].y, lightPos[i].z);
	}

	re.dessine();
	chaise.dessine();
	chaise2.dessine();
	table.dessine();
	shape(murs);
	shape(sol);
	tour.dessine();
	//shape(para);
}

/**
*
* @param texs : textures des faces, dans l'ordre dessus, dessous, avant, arrière, gauche, droite
* @param cols : couleurs des faces, dans l'ordre dessus, dessous, avant, arrière, gauche, droite
*
*/
PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, PImage[] texs, int[] cols, int shininess) {
	if(texs.length != 6 || cols.length != 6) return null;
	PShape par = createShape();
	par.beginShape(QUADS);
	par.textureMode(REPEAT);
	par.shininess(shininess);
	par.noStroke();

	// Dessus
	par.texture(texs[0]);
	par.tint(cols[0]);
	par.normal(0, ty < 0 ? -1 : 1, 0);
	par.vertex(x, y, z, 0, 0);
	par.vertex(x, y, z+tz, 0, 1);
	par.vertex(x+tx, y, z+tz, 1, 0);
	par.vertex(x+tx, y, z, 1, 1);

	// Dessus
	par.texture(texs[1]);
	par.tint(cols[1]);
	par.normal(0, ty < 0 ? 1 : -1, 0);
	par.vertex(x, y+ty, z, 0, 0);
	par.vertex(x, y+ty, z+tz, 0, 1);
	par.vertex(x+tx, y+ty, z+tz, 1, 0);
	par.vertex(x+tx, y+ty, z, 1, 1);

	// Cotés

	// Avant
	par.texture(texs[2]);
	par.tint(cols[2]);
	par.normal(0, 0, tz > 0 ? 1 : -1);
	par.vertex(x, y, z+tz, 0, 0);
	par.vertex(x, y+ty, z+tz, 0, 1);
	par.vertex(x+tx, y+ty, z+tz, 1, 0);
	par.vertex(x+tx, y, z+tz, 1, 1);
	//Arrière
	par.texture(texs[3]);
	par.tint(cols[3]);
	par.normal(0, 0, tz > 0 ? -1 : 1);
	par.vertex(x, y, z, 0, 0);
	par.vertex(x, y+ty, z, 0, 1);
	par.vertex(x+tx, y+ty, z, 1, 0);
	par.vertex(x+tx, y, z, 1, 1);

	// Gauche
	par.texture(texs[4]);
	par.tint(cols[4]);
	par.normal(tx > 0 ? -1 : 1, 0, 0);
	par.vertex(x, y, z, 0, 0);
	par.vertex(x, y+ty, z, 0, 1);
	par.vertex(x, y+ty, z+tz, 1, 0);
	par.vertex(x, y, z+tz, 1, 1);

	// Droite
	par.texture(texs[5]);
	par.tint(cols[5]);
	par.normal(tx > 0 ? 1 : -1, 0, 0);
	par.vertex(x+tx, y, z, 0, 0);
	par.vertex(x+tx, y+ty, z, 0, 1);
	par.vertex(x+tx, y+ty, z+tz, 1, 0);
	par.vertex(x+tx, y, z+tz, 1, 1);


	par.endShape();
	return par;
}

PShape creerParalepipede() {
	return null;
}

// Coords, tex, col, shininess
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, PImage tex, int col, int shininess) {
	PImage[] texs = {tex, tex, tex, tex, tex, tex};
	int[] cols = {col, col, col, col, col, col};
	return creerParalepipede(x, y, z, tx, ty, tz, texs, cols, shininess);
}

// Coords, tex, col
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, PImage tex, int col) {
	return creerParalepipede(x, y, z, tx, ty, tz, tex, col, -1);
}

// Coords, tex, shininess
public PShape creerParalepipedeTexShininess(float x, float y, float z, float tx, float ty, float tz, PImage tex, int shininess) {
	PImage[] texs = {tex, tex, tex, tex, tex, tex};
	return creerParalepipede(x, y, z, tx, ty, tz, texs, whiteCols, shininess);
}

// Coords, tex
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, PImage tex) {
	return creerParalepipedeTexShininess(x, y, z, tx, ty, tz, tex, -1);
}

// Coords, col, shininess
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, int col, int shininess) {
	int[] cols = {col, col, col, col, col, col};
	return creerParalepipede(x, y, z, tx, ty, tz, whites, cols, shininess);
}

// Coords, col
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz, int col) {
	return creerParalepipede(x, y, z, tx, ty, tz, col, -1);
}

// Coords
public PShape creerParalepipede(float x, float y, float z, float tx, float ty, float tz) {
	return creerParalepipede(x, y, z, tx, ty, tz, whites, whiteCols, -1);
}

public PShape creerCylindre() {
  PShape cylindre = createShape();
  
}

PShape creerMurs() {
	PShape murs = createShape(GROUP);
	PShape m1, m2, m3, m4;
	m1 = creerParalepipede(-200, 0, -400,   5, -200, 800, color(200, 240, 220));
	m2 = creerParalepipede( 200, 0, -400,   5, -200, 800, color(200, 240, 220));
	m3 = creerParalepipede(-200, 0, -400, 400, -200,   5, color(200, 240, 220));
	m4 = creerParalepipede(-200, 0,  400, 400, -200,   5, color(200, 240, 220));
	murs.addChild(m1);
	murs.addChild(m2);
	murs.addChild(m3);
	murs.addChild(m4);
	return murs;
}

void calculCamera() {
	camX = rayon * cos(phi) * cos(theta);
	camY = rayon * sin(phi);
	camZ = rayon * cos(phi) * sin(theta);
	theta = (float(mouseX)/width) * TWO_PI;
	phi = (float(mouseY)/width) * TWO_PI;
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
