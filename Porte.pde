public class Porte {
	final float LARGEUR_PORTE  = 3;
	final float LONGUEUR_PORTE = 80;
	final float HAUTEUR_PORTE  = 180;
	float x, y, z;
	PShape porte;
	Porte(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
		//PImage texPorte = loadImage("./porte.jpg");
		porte = createShape(GROUP);
		PShape blocPorte = new Box(
			x, y, z,  // Coords
			LARGEUR_PORTE, -HAUTEUR_PORTE, LONGUEUR_PORTE, // Size
			wood,
			color(80, 80, 80),
			-1
		).getShape();
		porte.addChild(blocPorte);

        PShape cadranD = new Box(
            x, y, z-3,
            LARGEUR_PORTE+2, -HAUTEUR_PORTE, 3,
            white,
            color(0, 0, 0),
            -1
        ).getShape();
        porte.addChild(cadranD);

        PShape cadranH = new Box(
            x, y-HAUTEUR_PORTE, z-3,
            LARGEUR_PORTE+2, -2, LONGUEUR_PORTE+6,
            white,
            color(0, 0, 0),
            -1
        ).getShape();
        porte.addChild(cadranH);

        PShape cadranG = new Box(
            x, y, z+LONGUEUR_PORTE,
            LARGEUR_PORTE+2, -HAUTEUR_PORTE, 3,
            white,
            color(0, 0, 0),
            -1
        ).getShape();
        porte.addChild(cadranG);

        PShape clanche = new Box(
            x+LARGEUR_PORTE, y-90, z+10,
            5, -2, -2,
            metal,
            color(255, 255, 255),
            20
        ).getShape();
        porte.addChild(clanche);
        PShape clanche2 = new Box(
            x+LARGEUR_PORTE+5, y-90, z+10,
            -1, -2, 15,
            metal,
            color(255, 255, 255),
            20
        ).getShape();
        porte.addChild(clanche2);
	}

    PShape getShape() {return porte;}

	void dessine() {
		shape(porte);
	}

}