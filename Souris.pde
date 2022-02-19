 public class Souris {
	final float LARGEUR_SOURIS  = 5;
	final float LONGUEUR_SOURIS = 8;
	final float HAUTEUR_SOURIS  = 3;
	float x, y, z;
	PShape souris;
	Souris(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		souris = createShape(GROUP);
		QShape blocSouris = new Box(
			0, 0, 0,  // Coords
			LARGEUR_SOURIS, -HAUTEUR_SOURIS, LONGUEUR_SOURIS, // Size
			white,
			color(80, 80, 80),
			-1
		);
		souris.addChild(blocSouris.getShape());
        blocSouris.rotateY((float)(Math.random() * PI/2) - PI/4);
        blocSouris.translate(x, y, z);
	}

	void dessine() {
		shape(souris);
	}
}
