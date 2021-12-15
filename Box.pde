public class Box extends QShape {

	Box(float x, float y, float z, float tx, float ty, float tz, PImage[] texs, int[] cols, int[] shininess, float textureMultU, float textureMultV) {
		super(x, y, z);
		if(texs.length != 6) throw new IllegalArgumentException("The textures parameter must be an array of PImage of size 6");
		if(cols.length != 6) throw new IllegalArgumentException("The cols parameter must be an array of color (int) of size 6");
		if(shininess.length != 6) throw new IllegalArgumentException("The shininess parameter must be an array of int of size 6");
		shape = createShape(GROUP);

		// Dessus
		PShape dessus = createShape();
		dessus.beginShape(QUADS);
			dessus.textureMode(NORMAL);
			dessus.shininess(shininess[0]);
			dessus.texture(texs[0]);
			dessus.tint(cols[0]);
			dessus.normal(0, ty < 0 ? -1 : 1, 0);
			dessus.vertex(x, y, z, 0, 0);
			dessus.vertex(x, y, z+tz, 0, textureMultV);
			dessus.vertex(x+tx, y, z+tz, textureMultU, textureMultV);
			dessus.vertex(x+tx, y, z, textureMultU, 0);
		dessus.endShape(CLOSE);

		// Dessous
		PShape dessous = createShape();
		dessous.beginShape(QUADS);
			dessous.textureMode(NORMAL);
			dessous.shininess(shininess[1]);
			dessous.texture(texs[1]);
			dessous.tint(cols[1]);
			dessous.normal(0, ty < 0 ? 1 : -1, 0);
			dessous.vertex(x, y+ty, z, 0, 0);
			dessous.vertex(x, y+ty, z+tz, 0, textureMultV);
			dessous.vertex(x+tx, y+ty, z+tz, textureMultU, textureMultV);
			dessous.vertex(x+tx, y+ty, z, textureMultU, 0);
		dessous.endShape(CLOSE);

		// Cotés

		// Avant
		PShape devant = createShape();
		devant.beginShape(QUADS);
			devant.textureMode(NORMAL);
			devant.shininess(shininess[2]);
			devant.texture(texs[2]);
			devant.tint(cols[2]);
			devant.normal(0, 0, tz > 0 ? 1 : -1);
			devant.vertex(x, y, z+tz, 0, 0);
			devant.vertex(x, y+ty, z+tz, 0, textureMultV);
			devant.vertex(x+tx, y+ty, z+tz, textureMultU, textureMultV);
			devant.vertex(x+tx, y, z+tz, textureMultU, 0);
		devant.endShape(CLOSE);

		//Arrière
		PShape derriere = createShape();
		derriere.beginShape(QUADS);
			derriere.textureMode(NORMAL);
			derriere.shininess(shininess[3]);
			derriere.texture(texs[3]);
			derriere.tint(cols[3]);
			derriere.normal(0, 0, tz > 0 ? -1 : 1);
			derriere.vertex(x, y, z, 0, 0);
			derriere.vertex(x, y+ty, z, 0, textureMultV);
			derriere.vertex(x+tx, y+ty, z, textureMultU, textureMultV);
			derriere.vertex(x+tx, y, z, textureMultU, 0);
		derriere.endShape(CLOSE);

		// Gauche
		PShape gauche = createShape();
		gauche.beginShape(QUADS);
			gauche.textureMode(NORMAL);
			gauche.shininess(shininess[4]);
			gauche.texture(texs[4]);
			gauche.tint(cols[4]);
			gauche.normal(tx > 0 ? -1 : 1, 0, 0);
			gauche.vertex(x, y, z, 0, 0);
			gauche.vertex(x, y+ty, z, 0, textureMultV);
			gauche.vertex(x, y+ty, z+tz, textureMultU, textureMultV);
			gauche.vertex(x, y, z+tz, textureMultU, 0);
		gauche.endShape(CLOSE);

		// Droite
		PShape droite = createShape();
		droite.beginShape(QUADS);
			droite.textureMode(NORMAL);
			droite.shininess(shininess[5]);
			droite.texture(texs[5]);
			droite.tint(cols[5]);
			droite.normal(tx > 0 ? 1 : -1, 0, 0);
			droite.vertex(x+tx, y, z, 0, 0);
			droite.vertex(x+tx, y+ty, z, 0, textureMultV);
			droite.vertex(x+tx, y+ty, z+tz, textureMultU, textureMultV);
			droite.vertex(x+tx, y, z+tz, textureMultU, 0);
		droite.endShape(CLOSE);

		shape.addChild(dessus);
		shape.addChild(dessous);
		shape.addChild(devant);
		shape.addChild(derriere);
		shape.addChild(gauche);
		shape.addChild(droite);
	}

	// Coords, tex, col, shininess
	Box(float x, float y, float z, float tx, float ty, float tz, PImage tex, int col, int shininess) {
		this(x, y, z, tx, ty, tz, toArraySix(tex), toArraySix(col), toArraySix(shininess), 1, 1);
	}

	// Coords, tex, col, shininess
	Box(float x, float y, float z, float tx, float ty, float tz, PImage tex, int col, int shininess, float uFact, float vFact) {
		this(x, y, z, tx, ty, tz, toArraySix(tex), toArraySix(col), toArraySix(shininess), uFact, vFact);
	}

	// Coords, tex, col
	Box(float x, float y, float z, float tx, float ty, float tz, PImage tex, int col) {
		this(x, y, z, tx, ty, tz, toArraySix(tex), toArraySix(col), NOT_SHINY, 1, 1);
	}

	// Coords, tex
	Box(float x, float y, float z, float tx, float ty, float tz, PImage tex) {
		this(x, y, z, tx, ty, tz, tex, -1);
	}

	// Coords, col, shininess
	Box(float x, float y, float z, float tx, float ty, float tz, int col, int shininess) {
		this(x, y, z, tx, ty, tz, aTexWhite, toArraySix(col), toArraySix(shininess), 1, 1);
	}

	// Coords, col
	Box(float x, float y, float z, float tx, float ty, float tz, int col) {
		this(x, y, z, tx, ty, tz, aTexWhite, whiteCols, NOT_SHINY, 1, 1);
	}

	// Coords
	Box(float x, float y, float z, float tx, float ty, float tz) {
		this(x, y, z, tx, ty, tz, aTexWhite, whiteCols, NOT_SHINY, 1, 1);
	}
}
