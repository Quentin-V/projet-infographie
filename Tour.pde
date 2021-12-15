public class Tour {
	final float LARGEUR_TOUR  = 8;
	final float LONGUEUR_TOUR = 24;
	final float HAUTEUR_TOUR  = 21;
	float x, y, z;
	PShape tour;
	Tour(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		PImage texTour = loadImage("./tour.jpg");
		tour = createShape(GROUP);
		PShape blocTour = creerParalepipede(
			x, y, z,  // Coords
			LARGEUR_TOUR, -HAUTEUR_TOUR, LONGUEUR_TOUR, // Size
			metal,
			color(80, 80, 80),
			10
		);
		tour.addChild(blocTour);

		PShape avantTour = creerParalepipede(
			x, y, z,
			LARGEUR_TOUR, -HAUTEUR_TOUR, -1,
			texTour,
			whiteCol,
			-1,
			-1,
			-1
		);
		tour.addChild(avantTour);
	}

	void dessine() {
		shape(tour);
	}
}
