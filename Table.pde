public class Table {
	final float LARGEUR_PIED = 1;
	final float HAUTEUR_PIED = 30;
	final float LONGUEUR_PLATEAU = 90;
	final float LARGEUR_PLATEAU = 30;
	final float HAUTEUR_PLATEAU = 1;
	float x, y, z;
	private PShape table;
	Table(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		table = createShape(GROUP);
		table.addChild(creerPieds());
		table.addChild(new Box(x, y-HAUTEUR_PIED, z, LONGUEUR_PLATEAU, HAUTEUR_PLATEAU, LARGEUR_PLATEAU).getShape());
	}

	void dessine() {
		shape(table);
	}

	PShape creerPieds() {
		PShape pieds = createShape(GROUP);
		PShape p1, p2, p3, p4;
		p1 = new Box(x, y, z, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500).getShape();
		p2 = new Box(x + LONGUEUR_PLATEAU - LARGEUR_PIED, y, z, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500).getShape();
		p3 = new Box(x, y, z + LARGEUR_PLATEAU - LARGEUR_PIED, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500).getShape();
		p4 = new Box(x + LONGUEUR_PLATEAU - LARGEUR_PIED, y, z + LARGEUR_PLATEAU - LARGEUR_PIED, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500).getShape();
		pieds.addChild(p1);
		pieds.addChild(p2);
		pieds.addChild(p3);
		pieds.addChild(p4);
		return pieds;
	}
}
