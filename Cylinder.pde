public class Cylinder extends QShape {
	float diameter, hei;
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col, int shininess, int sideCount) {
		super(x, y, z);
		this.diameter = diameter;
		this.hei = hei;
		shape = createShape(GROUP);
		PShape contour = createShape();
		contour.beginShape(QUADS);
		contour.noStroke();
		contour.texture(tex);
		contour.tint(col);
		contour.shininess(shininess);
		float r = diameter / 2.0;
		float step = TWO_PI/sideCount;
		for(int i = 0; i < 2*sideCount; ++i) {
			PVector vecLargeur = PVector.sub(new PVector(x + r*cos(i*step), y    , z + r*sin(i*step)), new PVector(x + r*cos(step*(i+1)), y    , z + r*sin(step*(i+1))));
			PVector normal = vecLargeur.normalize().cross(vecY);
			contour.normal(normal.x, normal.y, normal.z);
			contour.vertex(x + r*cos(i*step), y    , z + r*sin(i*step), (i*step) / TWO_PI, 0);
			contour.vertex(x + r*cos(i*step), y-hei, z + r*sin(i*step), (i*step) / TWO_PI, 1);
			contour.vertex(x + r*cos(step*(i+1)), y-hei, z + r*sin(step*(i+1)), ((i+1)*step) / TWO_PI, 1);
			contour.vertex(x + r*cos(step*(i+1)), y    , z + r*sin(step*(i+1)), ((i+1)*step) / TWO_PI, 0);
		}
		contour.endShape();

		PShape dessus = createShape();
		dessus.beginShape();
		dessus.texture(tex);
		dessus.tint(col);
		dessus.shininess(shininess);
		dessus.normal(0, -1, 0);
		for(int i = 0; i < sideCount; ++i) {
			dessus.vertex(x+ r*cos(i*step), y-hei, z + r*sin(i*step), cos(i*step), sin(i*step));
		}
		dessus.endShape(CLOSE);

		PShape dessous = createShape();
		dessous.beginShape();
		dessous.texture(tex);
		dessous.tint(col);
		dessous.shininess(shininess);
		dessous.normal(0, 1, 0);
		for(int i = 0; i < sideCount; ++i) {
			dessous.vertex(x+ r*cos(i*step), y, z + r*sin(i*step), cos(i*step), sin(i*step));
		}
		dessous.endShape(CLOSE);

		shape.addChild(contour);
		shape.addChild(dessus);
		shape.addChild(dessous);
	}

	// Coords
	Cylinder(float x, float y, float z, float diameter, float hei) {
		this(x, y, z, diameter, hei, white, whiteCol, -1, 10);
	}

	// Coords, tex
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex) {
		this(x, y, z, diameter, hei, tex, whiteCol, -1, 10);
	}

	// Coords, col
	Cylinder(float x, float y, float z, float diameter, float hei, int col) {
		this(x, y, z, diameter, hei, white, col, -1, 10);
	}

	// Coords, tex, col, shininess
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col, int shininess) {
		this(x, y, z, diameter, hei, tex, col, shininess, 10);
	}

	// Coords, tex, col
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col) {
		this(x, y, z, diameter, hei, tex, col, -1, 10);
	}

	// Coords, col, shininess
	Cylinder(float x, float y, float z, float diameter, float hei, int col, int shininess) {
		this(x, y, z, diameter, hei, white, col, shininess, 10);
	}
}
