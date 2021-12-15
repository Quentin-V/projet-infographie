public class Tableau {
	final float LONGUEUR_TABLEAU = 400;
	final float HAUTEUR_TABLEAU  = 130;
	final float LARGEUR_TABLEAU  = 3;

	float x, y, z;
	PShape tableau;
	Tableau(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		PImage texTableau = loadImage("./tableau.jpg");
		tableau = createShape(GROUP);
		PShape partieCraie = new Box(
			this.x, this.y, this.z,
			-LONGUEUR_TABLEAU, -HAUTEUR_TABLEAU, -LARGEUR_TABLEAU,
			toArraySix(texTableau),
			whiteCols,
			toArraySix(1000),
			1.0,
			-1.0
		).getShape();
		tableau.addChild(partieCraie);
		PShape rebordBas = new Box(
			this.x, this.y, this.z,
			-LONGUEUR_TABLEAU, 1, -10,
			metal,
			color(200, 200, 200)
		).getShape();

		PShape rebordHaut = new Box(
			this.x+1, this.y-HAUTEUR_TABLEAU-1, this.z,
			-LONGUEUR_TABLEAU-2, 1, -LARGEUR_TABLEAU,
			metal,
			color(200, 200, 200)
		).getShape();

		PShape rebordGauche = new Box(
			this.x, this.y+1, this.z,
			1, -HAUTEUR_TABLEAU-2, -LARGEUR_TABLEAU,
			metal,
			color(200, 200, 200)
		).getShape();

		PShape rebordDroite = new Box(
			this.x-LONGUEUR_TABLEAU, this.y+1, this.z,
			-1, -HAUTEUR_TABLEAU-2, -LARGEUR_TABLEAU,
			metal,
			color(200, 200, 200)
		).getShape();

		tableau.addChild(rebordBas);
		tableau.addChild(rebordHaut);
		tableau.addChild(rebordGauche);
		tableau.addChild(rebordDroite);
	}

	void dessine() {
		shape(tableau);
	}
}
