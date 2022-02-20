 public class Fenetre {
	static final float LARGEUR_FENETRE  = 4;
	static final float LONGUEUR_FENETRE = 250;
	static final float HAUTEUR_FENETRE  = 100;
	float x, y, z;
	PShape fenetre;
	Fenetre(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		PImage texFenetre = loadImage("./glass.png");
		fenetre = createShape(GROUP);
		PShape blocFenetre = new Box(
			x, y, z,  // Coords
			LARGEUR_FENETRE, -HAUTEUR_FENETRE, LONGUEUR_FENETRE, // Size
			texFenetre,
			color(255, 255, 255),
			10,
            LONGUEUR_FENETRE/25,
            HAUTEUR_FENETRE/25
		).getShape();
		fenetre.addChild(blocFenetre);
	}

    PShape getShape() {return fenetre;}

	void dessine() {
		shape(fenetre);
	}
}
