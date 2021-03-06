 public class Ecran {
	static final float LARGEUR_ECRAN  = 55;;
	static final float LONGUEUR_ECRAN = 1;;
	static final float HAUTEUR_ECRAN  = 30;;
	static final float HAUTEUR_CYL_PIED = 15;
	static final float LARGEUR_CYL_PIED = 1;
	static final float LARGEUR_PIED = 30;
	static final float LONGUEUR_PIED = 18;
	static final float HAUTEUR_PIED = 1;
	float x, y, z;
	PShape ecran;
	Ecran(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		PImage texEcran = wallpapers[(int)(Math.random() * wallpapers.length)];
		ecran = createShape(GROUP);
		PShape blocEcran = new Box(
			x, y, z,  // Coords
			LARGEUR_ECRAN, -HAUTEUR_ECRAN, LONGUEUR_ECRAN, // Size
			white,
			color(80, 80, 80),
			10
		).getShape();
		ecran.addChild(blocEcran);

		PShape pied = new Box(
			x + LARGEUR_ECRAN/2 - LARGEUR_PIED/2, y + HAUTEUR_CYL_PIED - 4, z + LONGUEUR_ECRAN/2 - LONGUEUR_PIED/2,
			LARGEUR_PIED, HAUTEUR_PIED, LONGUEUR_PIED, // Size
			white,
			color(80, 80, 80),
			100
		).getShape();
		ecran.addChild(pied);

		PShape cylPied = new Cylinder(
			x + LARGEUR_ECRAN/2 - LARGEUR_CYL_PIED/2, y+HAUTEUR_CYL_PIED-4, z + LONGUEUR_ECRAN/2,
			LARGEUR_CYL_PIED, HAUTEUR_CYL_PIED,
			white,
			color(80, 80, 80),
			100
		).getShape();
		ecran.addChild(cylPied);

		PShape dale = new Box(
			x, y, z-1,
			LARGEUR_ECRAN, -HAUTEUR_ECRAN, 1,
			texEcran,
			color(255, 255, 255),
			100,
			-1, -1 // On doit retourner l'image verticalement pour qu'elle soit à l'endroit
		).getShape();
		ecran.addChild(dale);
	}

	void dessine() {
		shape(ecran);
	}
}
