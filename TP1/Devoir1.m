function [pcm, MI, aa]=Devoir1(posA,ar,va,Forces)

cabinePilotage = Cone();
cabinePilotage.Masse=0.7;
cabinePilotage.Hauteur=3.82;
cabinePilotage.Rayon= 1.345;
eppaiseurAil=0.25;
cabinePilotage.Position=[22.95,0,cabinePilotage.Rayon+eppaiseurAil];
cabinePilotage.CentreDeMasse=cabinePilotage.CalculeCentreDeMasseCone();

fuselage = Cylindre();
fuselage.Masse=15.1;
fuselage.Hauteur=22.95;
fuselage.Rayon= 1.345;
fuselage.Position=[0,0,fuselage.Rayon+eppaiseurAil];

fuselage.CentreDeMasse=fuselage.CentreDeMasseCylindre();

moteurGauche = Cylindre();
moteurGauche.Masse=1.7;
moteurGauche.Hauteur=3.68;
moteurGauche.Rayon= 0.724;
moteurGauche.Position=[5,fuselage.Rayon+moteurGauche.Rayon,fuselage.Rayon+eppaiseurAil];

moteurGauche.CentreDeMasse=moteurGauche.CentreDeMasseCylindre();

moteurDroit = Cylindre();
moteurDroit.Masse=1.7;
moteurDroit.Hauteur=3.68;
moteurDroit.Rayon= 0.724;
moteurDroit.Position=[5,-(fuselage.Rayon+moteurDroit.Rayon),fuselage.Rayon-eppaiseurAil];

moteurDroit.CentreDeMasse=moteurDroit.CentreDeMasseCylindre();


aileGauche = Parallelipipede();
aileGauche.Masse=3.25;
aileGauche.Longueur=10.6;
aileGauche.Largeur=1.14;
aileGauche.Epaisseur=0.25;
aileGauche.Position=[10.54, 0, aileGauche.Epaisseur/2 ];

aileGauche.CentreDeMasse=aileGauche.CalculeCentreDeMassePara();

aileDroite = Parallelipipede();
aileDroite.Masse=3.25;
aileDroite.Longueur=10.6;
aileDroite.Largeur=1.14;
aileDroite.Epaisseur=0.25;
aileDroite.Position=[10.54,  - aileDroite.Longueur, aileDroite.Epaisseur/2 ];

aileDroite.CentreDeMasse=aileDroite.CalculeCentreDeMassePara();

aileron = Parallelipipede();
aileron.Masse=0.5;
aileron.Longueur=0.07;
aileron.Largeur=1.28;
aileron.Epaisseur= 2.1;
aileron.Position=[aileron.Largeur/2,0, 2*fuselage.Rayon + aileGauche.Epaisseur + aileron.Epaisseur/2];

aileron.CentreDeMasse=aileron.CentreMasseAileron();

% disp("---aileron---");
% disp(aileron.CentreDeMasse);
% disp("---aile gauche---");
% disp(aileGauche.CentreDeMasse);
% disp("---aile droite---");
% disp(aileDroite.CentreDeMasse);
% disp("---fuselage---");
% disp(fuselage.CentreDeMasse);
% disp("---cabine---");
% disp(cabinePilotage.CentreDeMasse);
% disp("---moteur gauche---");
% disp(moteurGauche.CentreDeMasse);
% disp("---moteur droit---");
% disp(moteurDroit.CentreDeMasse);



end

