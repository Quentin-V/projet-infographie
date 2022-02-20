public class Chaise {
	static final float TAILLE_PIED = 45;
	static final float LARGEUR_PIED = 1;
	static final float LARGEUR_CHAISE = 40;
	static final float HAUTEUR_ASSISE = 1;
	static final float HAUTEUR_DOSSIER = 43;
	static final float LARGEUR_BARRE_DOSSIER = 1;
	float x, y, z;
	PShape chaise, pieds, assise, dossier;
	Chaise(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		chaise = createShape(GROUP);
		assise = new Box(x, y-TAILLE_PIED, z, LARGEUR_CHAISE, -HAUTEUR_ASSISE, LARGEUR_CHAISE, wood).getShape();
		pieds = creerPieds();
		dossier = creerDossier();
		chaise.addChild(pieds);
		chaise.addChild(assise);
		chaise.addChild(dossier);
	}

	private PShape creerPieds() {
		PShape p1, p2, p3, p4;
		PShape pieds = createShape(GROUP);
		p1 = new Box(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED).getShape();
		p2 = new Box(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED).getShape();
		p3 = new Box(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED).getShape();
		p4 = new Box(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED).getShape();
		p2.translate(LARGEUR_CHAISE-LARGEUR_PIED, 0, 0);
		p3.translate(0, 0, LARGEUR_CHAISE-LARGEUR_PIED);
		p4.translate(LARGEUR_CHAISE-LARGEUR_PIED, 0, LARGEUR_CHAISE-LARGEUR_PIED);
		pieds.addChild(p1);
		pieds.addChild(p2);
		pieds.addChild(p3);
		pieds.addChild(p4);
		return pieds;
	}

	private PShape creerDossier() {
		PShape dossier = createShape(GROUP);
		PShape b1, b2, dos;
		b1 = new Box(x, y-TAILLE_PIED-HAUTEUR_ASSISE, z, LARGEUR_BARRE_DOSSIER, -HAUTEUR_DOSSIER, LARGEUR_BARRE_DOSSIER).getShape();
		b2 = new Box(x+LARGEUR_CHAISE-LARGEUR_BARRE_DOSSIER, y-TAILLE_PIED-HAUTEUR_ASSISE, z, LARGEUR_BARRE_DOSSIER, -HAUTEUR_DOSSIER, LARGEUR_BARRE_DOSSIER).getShape();
		dos = new Box(x+LARGEUR_BARRE_DOSSIER, (y-TAILLE_PIED-HAUTEUR_ASSISE)-(HAUTEUR_DOSSIER/2), z, LARGEUR_CHAISE-(2*LARGEUR_BARRE_DOSSIER), -HAUTEUR_DOSSIER/3,LARGEUR_BARRE_DOSSIER, wood).getShape();
		dossier.addChild(b1);
		dossier.addChild(b2);
		dossier.addChild(dos);
		return dossier;
	}
	void dessine() {
		shape(chaise);
	}
}
