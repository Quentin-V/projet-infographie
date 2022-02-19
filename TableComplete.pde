public class TableComplete {
	float x, y, z;
	private PShape tableComplete;
    private Table table;
    private Clavier cl, cl2;
    private Ecran ec, ec2;
    private Souris sou, sou2;
    private Chaise ch, ch2;
	TableComplete(float x, float y, float z) {
		this.x = x;
		this.y = y;
		this.z = z;
        creerObjets();
	}

	void dessine() {
		table.dessine();
        cl.dessine();
        ec.dessine();
        sou.dessine();
        cl2.dessine();
        ec2.dessine();
        sou2.dessine();
        ch.dessine();
        ch2.dessine();
	}

	private void creerObjets() {
		table = new Table(x, y, z);
	    cl = new Clavier(x+20, y-75, z+20);
	    ec = new Ecran(x+15, y-87, z+60);
	    sou = new Souris(x+9, y-75, z+23);
        cl2 = new Clavier(x+105, y-75, z+20);
	    ec2 = new Ecran(x+100, y-87, z+60);
	    sou2 = new Souris(x+90, y-75, z+23);
        int randChaise1 = (int) (Math.random() * 10);
        int randChaise2 = (int) (Math.random() * 10);
        ch = new Chaise(x+15, y, z-10-randChaise1);
        ch2 = new Chaise(x+105, y, z-10-randChaise2);
	}
}
