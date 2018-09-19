function [pcm, MI, aa]=Devoir1(posA,ar,va,Forces)

cabinePilotage = Cone();
cabinePilotage.Masse=0.7;
cabinePilotage.Hauteur=3.82;
cabinePilotage.Rayon= 1.345;
eppaiseurAil=0.25;
cabinePilotage.Position=[22.95,0,cabinePilotage.Rayon+eppaiseurAil];
cabinePilotage.CentreDeMasse=cabinePilotage.CalculeCentreDeMasseCone(cabinePilotage);

fuselage = Cylindre();
fuselage.Masse=15.1;
fuselage.Hauteur=22.95;
fuselage.Rayon= 1.345;
fuselage.Position=[0,0,fuselage.Rayon+eppaiseurAil];

fuselage.CentreDeMasse=fuselage.CalculeCentreDeMasseCylindre(fuselage);

moteurGauche = Cylindre();
moteurGauche.Masse=1.7;
moteurGauche.Hauteur=3.68;
moteurGauche.Rayon= 0.724;
moteurGauche.Position=[5,fuselage.Rayon+moteurGauche.Rayon,fuselage.Rayon+eppaiseurAil];

moteurGauche.CentreDeMasse=moteurGauche.CalculeCentreDeMasseCylindre(moteurGauche);

moteurDroit = Cylindre();
moteurDroit.Masse=1.7;
moteurDroit.Hauteur=3.68;
moteurDroit.Rayon= 0.724;
moteurDroit.Position=[5,(fuselage.Rayon+moteurDroit.Rayon),fuselage.Rayon-eppaiseurAil];

moteurDroit.CentreDeMasse=moteurDroit.CalculeCentreDeMasseCylindre(moteurDroit);

   
end

