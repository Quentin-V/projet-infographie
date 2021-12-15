public class Cylinder extends QShape {
	float diameter, hei;
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col, int shininess, int sideCount) {
		super(x, y, z);
		this.diameter = diameter;
		this.hei = hei;
		shape = createShape();
		shape.beginShape(QUADS);
		shape.noStroke();
		shape.texture(tex);
		shape.tint(col);
		shape.shininess(shininess);
		float r = diameter / 2.0;
		float step = TWO_PI/sideCount;
		for(int i = 0; i < 2*sideCount; ++i) {
			PVector vecLargeur = PVector.sub(new PVector(x + r*cos(i*step), y    , z + r*sin(i*step)), new PVector(x + r*cos(step*(i+1)), y    , z + r*sin(step*(i+1))));
			PVector normal = vecLargeur.normalize().cross(vecY);
			shape.normal(normal.x, normal.y, normal.z);
			shape.vertex(x + r*cos(i*step), y    , z + r*sin(i*step), (i*step) / TWO_PI, 0);
			shape.vertex(x + r*cos(i*step), y-hei, z + r*sin(i*step), (i*step) / TWO_PI, 1);
			shape.vertex(x + r*cos(step*(i+1)), y-hei, z + r*sin(step*(i+1)), ((i+1)*step) / TWO_PI, 1);
			shape.vertex(x + r*cos(step*(i+1)), y    , z + r*sin(step*(i+1)), ((i+1)*step) / TWO_PI, 0);
		}
		shape.endShape();
	}

	// Coords
	Cylinder(float x, float y, float z, float diameter, float hei) {
		this(x, y, z, diameter, hei, white, whiteCol, -1, 100);
	}

	// Coords, tex
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex) {
		this(x, y, z, diameter, hei, tex, whiteCol, -1, 100);
	}

	// Coords, col
	Cylinder(float x, float y, float z, float diameter, float hei, int col) {
		this(x, y, z, diameter, hei, white, col, -1, 100);
	}

	// Coords, tex, col, shininess
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col, int shininess) {
		this(x, y, z, diameter, hei, tex, col, shininess, 100);
	}

	// Coords, tex, col
	Cylinder(float x, float y, float z, float diameter, float hei, PImage tex, int col) {
		this(x, y, z, diameter, hei, tex, col, -1, 100);
	}

	// Coords, col, shininess
	Cylinder(float x, float y, float z, float diameter, float hei, int col, int shininess) {
		this(x, y, z, diameter, hei, white, col, shininess, 100);
	}
}

void calculCamera() {
	camX = rayon * cos(phi) * cos(theta);
	camY = rayon * sin(phi);
	camZ = rayon * cos(phi) * sin(theta);
	theta = (float(mouseX)/width) * TWO_PI;
	phi = (float(mouseY)/width) * TWO_PI;
}
