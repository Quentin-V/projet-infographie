public class Table {
	final float LARGEUR_PIED = 6;
	final float HAUTEUR_PIED = 72;
	final float LONGUEUR_PLATEAU = 160;
	final float LARGEUR_PLATEAU = 80;
	final float HAUTEUR_PLATEAU = 3;
	float x, y, z;
	private PShape table;
	Table(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		table = createShape(GROUP);
		table.addChild(creerPieds());
		table.addChild(new Box(x, y-HAUTEUR_PIED, z, LONGUEUR_PLATEAU, -HAUTEUR_PLATEAU, LARGEUR_PLATEAU).getShape());
	}

	void dessine() {
		shape(table);
	}

	PShape creerPieds() {
		PShape pieds = createShape(GROUP);
		PShape p1, p2, p3, p4;
		p1 = new Cylinder(x + LARGEUR_PIED/2                   , y, z + LARGEUR_PIED/2                  , LARGEUR_PIED, HAUTEUR_PIED, metal, color(255, 255, 255), 500).getShape();
		p2 = new Cylinder(x + LONGUEUR_PLATEAU - LARGEUR_PIED/2, y, z + LARGEUR_PIED/2                  , LARGEUR_PIED, HAUTEUR_PIED, metal, color(255, 255, 255), 500).getShape();
		p3 = new Cylinder(x + LARGEUR_PIED/2                   , y, z + LARGEUR_PLATEAU - LARGEUR_PIED/2, LARGEUR_PIED, HAUTEUR_PIED, metal, color(255, 255, 255), 500).getShape();
		p4 = new Cylinder(x + LONGUEUR_PLATEAU - LARGEUR_PIED/2, y, z + LARGEUR_PLATEAU - LARGEUR_PIED/2, LARGEUR_PIED, HAUTEUR_PIED, metal, color(255, 255, 255), 500).getShape();
		pieds.addChild(p1);
		pieds.addChild(p2);
		pieds.addChild(p3);
		pieds.addChild(p4);
		return pieds;
	}
}
