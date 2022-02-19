public class Salle extends QShape {
	public final static float LARGEUR_SALLE = 620;
	public final static float LONGUEUR_SALLE = 980;
	public final static float HAUTEUR_SALLE = 280;
	Salle() {
		super(0, 0, 0);
		shape = createShape(GROUP);
		Box m1, m2, m3, m4, sol;
		//                   x         y          z                  tx           ty             tz                color
		m1 = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2,             5, -HAUTEUR_SALLE, LONGUEUR_SALLE, color(200, 240, 220));
		m2 = new Box( LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2,             5, -HAUTEUR_SALLE, LONGUEUR_SALLE, color(200, 240, 220));
		m3 = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2, LARGEUR_SALLE, -HAUTEUR_SALLE,              5, color(200, 240, 220));
		m4 = new Box(-LARGEUR_SALLE/2, 0,  LONGUEUR_SALLE/2, LARGEUR_SALLE, -HAUTEUR_SALLE,              5, color(200, 240, 220));
		shape.addChild(m1.getShape());
		shape.addChild(m2.getShape());
		shape.addChild(m3.getShape());
		shape.addChild(m4.getShape());
		PImage solTex = loadImage("./sol.jpg");
		sol = new Box(-LARGEUR_SALLE/2, 0, -LONGUEUR_SALLE/2, LARGEUR_SALLE, 1, LONGUEUR_SALLE, solTex, whiteCol, -1, 10, 20);
		shape.addChild(sol.getShape());
	}
}
