 public class Clavier {
	final float LARGEUR_CLAVIER  = 45;//7;
	final float LONGUEUR_CLAVIER = 12;//25;
	final float HAUTEUR_CLAVIER  = 1;//1;
	float x, y, z;
	PShape clavier;
	Clavier(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
        PImage texClavier = loadImage("./keyboard.jpg");
		clavier = createShape(GROUP);
		QShape blocClavier = new Box(
			0, 0, 0,  // Coords
			LARGEUR_CLAVIER, -HAUTEUR_CLAVIER, LONGUEUR_CLAVIER, // Size
			metal,
			color(80, 80, 80),
			10
		);
		float rotateRandom = (float)(Math.random() * PI/8) - PI/16;
		blocClavier.rotateY(rotateRandom);
		blocClavier.translate(x, y, z);
		clavier.addChild(blocClavier.getShape());

		QShape dessusClavier = new Box(
			0, 0, 0,
			LARGEUR_CLAVIER, -1, LONGUEUR_CLAVIER,
			texClavier,
			whiteCol,
			-1,
			-1,
			-1
		);
		dessusClavier.rotateY(rotateRandom);
		dessusClavier.translate(x, y-HAUTEUR_CLAVIER, z);
		clavier.addChild(dessusClavier.getShape());
	}

	void dessine() {
		shape(clavier);
	}
}
