public class Chaise {
   final float TAILLE_PIED = 20;
   final float LARGEUR_PIED = 1;
   final float LARGEUR_CHAISE = 20;
   final float HAUTEUR_ASSISE = 1;
   final float HAUTEUR_DOSSIER = 20;
   final float LARGEUR_BARRE_DOSSIER = 1;
   float x, y, z;
   PShape chaise, pieds, assise, dossier;
   Chaise(float x, float y, float z) {
     this.x = x;
     this.y = y;
     this.z = z;
     chaise = createShape(GROUP);
     assise = creerParalepipede(x, y-TAILLE_PIED, z, LARGEUR_CHAISE, -HAUTEUR_ASSISE, LARGEUR_CHAISE, wood);
     pieds = creerPieds();
     dossier = creerDossier();
     chaise.addChild(pieds);
     chaise.addChild(assise);
     chaise.addChild(dossier);
   }
   
   private PShape creerPieds() {
     PShape p1, p2, p3, p4;
     PShape pieds = createShape(GROUP);
     p1 = creerParalepipede(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED);
     p2 = creerParalepipede(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED);
     p3 = creerParalepipede(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED);
     p4 = creerParalepipede(x, y, z, LARGEUR_PIED, -TAILLE_PIED, LARGEUR_PIED);
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
     b1 = creerParalepipede(x, y-TAILLE_PIED-HAUTEUR_ASSISE, z, LARGEUR_BARRE_DOSSIER, -HAUTEUR_DOSSIER, LARGEUR_BARRE_DOSSIER);
     b2 = creerParalepipede(x+LARGEUR_CHAISE-LARGEUR_BARRE_DOSSIER, y-TAILLE_PIED-HAUTEUR_ASSISE, z, LARGEUR_BARRE_DOSSIER, -HAUTEUR_DOSSIER, LARGEUR_BARRE_DOSSIER);
     dos = creerParalepipede(x+LARGEUR_BARRE_DOSSIER, (y-TAILLE_PIED-HAUTEUR_ASSISE)-(HAUTEUR_DOSSIER/2), z, LARGEUR_CHAISE-(2*LARGEUR_BARRE_DOSSIER), -HAUTEUR_DOSSIER/3,LARGEUR_BARRE_DOSSIER, wood);
     dossier.addChild(b1);
     dossier.addChild(b2);
     dossier.addChild(dos);
     return dossier;
   }
   void dessine() {
     shape(chaise);
   }
}
