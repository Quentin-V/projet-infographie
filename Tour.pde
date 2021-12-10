public class Tour {
	final float LARGEUR_TOUR  = 9;
	final float LONGUEUR_TOUR = 24;
	final float HAUTEUR_TOUR  = 21;
	float x, y, z;
	PShape tour;
	Tour(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		//PImage texTour = loadImage("./wood.jpg"); // TODO: Change the texture
		tour = creerParalepipede(
			x, y, z,  // Coords
			LARGEUR_TOUR, -HAUTEUR_TOUR, LONGUEUR_TOUR, // Size
			new PImage[] {white, wood, wood, wood, wood, white}, // Textures
			new int[] {color(70, 70, 70), color(70, 70, 70), color(70, 70, 70), color(255, 255, 255), color(70, 70, 70), color(70, 70, 70)}, // Couleurs
			-1 // Shininess
		);
	}

	void dessine() {
		shape(tour);
	}
}
