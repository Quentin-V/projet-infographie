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
		table.addChild(creerParalepipede(x, y-HAUTEUR_PIED, z, LONGUEUR_PLATEAU, HAUTEUR_PLATEAU, LARGEUR_PLATEAU));
	}

	void dessine() {
		shape(table);
	}

	PShape creerPieds() {
		PShape pieds = createShape(GROUP);
		PShape p1, p2, p3, p4;
		p1 = creerParalepipede(x, y, z, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500);
		p2 = creerParalepipede(x + LONGUEUR_PLATEAU - LARGEUR_PIED, y, z, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500);
		p3 = creerParalepipede(x, y, z + LARGEUR_PLATEAU - LARGEUR_PIED, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500);
		p4 = creerParalepipede(x + LONGUEUR_PLATEAU - LARGEUR_PIED, y, z + LARGEUR_PLATEAU - LARGEUR_PIED, LARGEUR_PIED, -HAUTEUR_PIED, LARGEUR_PIED, metal, color(30, 30, 30), 500);
		pieds.addChild(p1);
		pieds.addChild(p2);
		pieds.addChild(p3);
		pieds.addChild(p4);
		return pieds;
	}
}
