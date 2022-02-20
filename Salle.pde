public class Salle extends QShape {
	public final static float LARGEUR_SALLE = 620;
	public final static float LONGUEUR_SALLE = 980;
	public final static float HAUTEUR_SALLE = 280;
	final int MUR_COLOR = color(150, 210, 200);
	Salle() {
		super(0, 0, 0);
		shape = createShape(GROUP);
		Box m1, m3, m4, sol;
		PShape murFenetre;
		//                   x         y          z                  tx           ty             tz                color
		m1 = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2,             5, -HAUTEUR_SALLE, LONGUEUR_SALLE, MUR_COLOR);
		murFenetre = createMurFenetre();
		m3 = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2, LARGEUR_SALLE, -HAUTEUR_SALLE,              5, MUR_COLOR);
		m4 = new Box(-LARGEUR_SALLE/2, 0,  LONGUEUR_SALLE/2, LARGEUR_SALLE, -HAUTEUR_SALLE,              5, MUR_COLOR);
		shape.addChild(m1.getShape());
		shape.addChild(murFenetre);
		shape.addChild(m3.getShape());
		shape.addChild(m4.getShape());
		PImage solTex = loadImage("./sol.jpg");
		sol = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2, LARGEUR_SALLE, 1, LONGUEUR_SALLE, solTex, whiteCol, -1, 10, 20);
		shape.addChild(sol.getShape());

		shape.addChild(new Porte(-306, 0, 370).getShape());
		Porte porteDerriere = new Porte(0,0,0);
		porteDerriere.getShape().rotateY(-PI/2);
		porteDerriere.getShape().translate(230, 0, -485);
		shape.addChild(porteDerriere.getShape());	
		Porte porteTableau = new Porte(0,0,0);
		porteTableau.getShape().rotateY(PI/2);
		porteTableau.getShape().translate(200, 0, 490);
		shape.addChild(porteTableau.getShape());

		shape.addChild(new Fenetre(LARGEUR_SALLE/2, -100, -390).getShape());
		shape.addChild(new Fenetre(LARGEUR_SALLE/2, -100, 60).getShape());	
	}

	PShape createMurFenetre() {
		PShape mur = createShape(GROUP);
		mur.addChild(new Box(LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2,                                                                   5, -HAUTEUR_SALLE, 100, MUR_COLOR).getShape());
		mur.addChild(new Box(LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2 + 100 + Fenetre.LONGUEUR_FENETRE,                                  5, -HAUTEUR_SALLE, 200, MUR_COLOR).getShape());
		mur.addChild(new Box(LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2 + 100 + Fenetre.LONGUEUR_FENETRE + 200 + Fenetre.LONGUEUR_FENETRE, 5, -HAUTEUR_SALLE, 185, MUR_COLOR).getShape());

		mur.addChild(new Box(LARGEUR_SALLE/2, 0   , -390, 5,                   -100, Fenetre.LONGUEUR_FENETRE, MUR_COLOR).getShape());
		mur.addChild(new Box(LARGEUR_SALLE/2, -200, -390, 5, -(HAUTEUR_SALLE - 200), Fenetre.LONGUEUR_FENETRE, MUR_COLOR).getShape());

		mur.addChild(new Box(LARGEUR_SALLE/2, 0   , 60, 5,                   -100, Fenetre.LONGUEUR_FENETRE, MUR_COLOR).getShape());
		mur.addChild(new Box(LARGEUR_SALLE/2, -200, 60, 5, -(HAUTEUR_SALLE - 200), Fenetre.LONGUEUR_FENETRE, MUR_COLOR).getShape());
		return mur;
	}
}
