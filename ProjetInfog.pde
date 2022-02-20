static final boolean CODING_MODE = false;
static final boolean LOW_NETWORK_MODE = false;

// Shader
PShader shader;
// Textures
PImage wood, metal, white, back;
PImage[] wallpapers;
PImage[] aTexWhite, aTexMetal, aTexWood;

// Constantes globales
public final static int[] NOT_SHINY = {-1, -1, -1, -1, -1, -1};
public final static PVector vecY = new PVector(0, 1, 0);
public final int whiteCol = color(255, 255, 255);
public final int[] whiteCols = {whiteCol, whiteCol, whiteCol, whiteCol, whiteCol, whiteCol};

// Méthodes utiles
public static int[] toArraySix(int i) {return new int[] {i,i,i,i,i,i};}
public static PImage[] toArraySix(PImage i) {return new PImage[] {i,i,i,i,i,i};}

// Liste des touches actuellement appuyées
ArrayList<Integer> pressedKeys = new ArrayList();

// Positions et couleur des lumières
final PVector[] lightPos = {
	//new PVector( 300, 300,  300),
	new PVector(-360, 300,  490),
	new PVector(-360, 300, -490),
	new PVector( 360, 300,  490),
	new PVector( 360, 300, -490)
};
final PVector[] lightColor = {
	//new PVector(255, 255, 255),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100),
	new PVector(100, 100, 100)
};

// Objets de la salle
Camera camera;
Salle salle;
Tableau tableau;
ArrayList<TableComplete> tablesCompletes;

// Comme pmouseX et pmouseY mais pour la taille de l'écran
// Sert pour détecter le resize
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
	if(LOW_NETWORK_MODE || CODING_MODE) {
		wallpapers = new PImage[] {loadImage("./xp.jpg")};
	}else {
		wallpapers = new PImage[5];
		// On récuupère les fond d'écran aléatoirement
		for(int i = 0; i < 5; ++i) wallpapers[i] = loadImage("https://quinta.ovh/processingwp.php?dir=genshin", "png");
		// Resize en 1280x720 pour ne pas avoir de bordures sur les côtés de l'écran
		for(int i = 0; i < 5; ++i) wallpapers[i].resize(1280, 720);
	}


	// OBJETS
	noStroke();
	camera = new Camera(200, -300, -400, -PI/6, PI/8); // Initialisation de la caméra dans le coin de la salle
	salle = new Salle();
	tableau = new Tableau(170, -60, Salle.LONGUEUR_SALLE/2-1);
	
	tablesCompletes = new ArrayList<TableComplete>(); // Initialisation de la liste des tables
	
	// Création des tables
	if(!CODING_MODE) // En coding mode, on cache les tables car elles utilisent beaucoup de ressources
		for(int x = -300; x <= 100; x += 161)
			for(int z = -350; z <= 300; z += 150)
				tablesCompletes.add(new TableComplete(x, 0, z));
	
	pwidth = pheight = 0; // Initialisation des variables
	frameRate(30); // On définit le frameRate à 30 pour éviter les lags
}

void draw() {
	if(pwidth != width || pheight != height) { // Detection du resize
		back.resize(width, height); // Resize du background sinon erreur
		camera.camChanged = true; // On indique à la caméra qu'on a changé
	}
  
	background(back);
	pwidth = width;
	pheight = height;

	// Calcul de la position de la caméra dans la classe Camera
	for(Integer keyC : pressedKeys) camera.moveFromKeyCode(keyC);
	camera.viser();

	shader(shader);
	ambientLight(20, 20, 20);

	// Création des lumières
	for(int i=0; i<lightPos.length; i++) {
		lightSpecular(lightColor[i].x, lightColor[i].y, lightColor[i].z);
		pointLight(lightColor[i].x, lightColor[i].y, lightColor[i].z,
		lightPos[i].x, lightPos[i].y, lightPos[i].z);
	}

	// Dessin des objets
	salle.drawShape();
	tableau.dessine();
	tablesCompletes.forEach(TableComplete::dessine);
}

// Fonctions pour la caméra
void keyPressed() {
	pressedKeys.add(keyCode);
}

void keyReleased() {
	pressedKeys.remove(pressedKeys.indexOf(keyCode));
}

// Changement du facteur de déplacement (pour aller plus vite ou plus doucement)
void mouseWheel(MouseEvent event) {
	camera.addFac(event.getCount());
}
