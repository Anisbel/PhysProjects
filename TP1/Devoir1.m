function [pcm, MI, aa]=Devoir1(posA,ar,va,Forces)

cabinePilotage = Cone();
cabinePilotage.Masse=0.7;
cabinePilotage.Hauteur=3.82;
cabinePilotage.Rayon= 1.345;
eppaiseurAil=0.25;
cabinePilotage.Position=[22.95,0,cabinePilotage.Rayon+eppaiseurAil];
cabinePilotage.CentreDeMasse=cabinePilotage.CalculeCentreDeMasseCone();
cabinePilotage.MI = cabinePilotage.CalculMomentInertie();

fuselage = Cylindre();
fuselage.Masse=15.1;
fuselage.Hauteur=22.95;
fuselage.Rayon= 1.345;
fuselage.Position=[0,0,fuselage.Rayon+eppaiseurAil];
fuselage.CentreDeMasse=fuselage.CentreDeMasseCylindre();
fuselage.MI = fuselage.CalculMomentInertie();

moteurGauche = Cylindre();
moteurGauche.Masse=1.7;
moteurGauche.Hauteur=3.68;
moteurGauche.Rayon= 0.724;
moteurGauche.Position=[5,fuselage.Rayon+moteurGauche.Rayon,fuselage.Rayon+eppaiseurAil];
moteurGauche.CentreDeMasse=moteurGauche.CentreDeMasseCylindre();
moteurGauche.MI = moteurGauche.CalculMomentInertie();

moteurDroit = Cylindre();
moteurDroit.Masse=1.7;
moteurDroit.Hauteur=3.68;
moteurDroit.Rayon= 0.724;
moteurDroit.Position=[5,-(fuselage.Rayon+moteurDroit.Rayon),fuselage.Rayon-eppaiseurAil];
moteurDroit.CentreDeMasse=moteurDroit.CentreDeMasseCylindre();
moteurDroit.MI = moteurDroit.CalculMomentInertie();



aileGauche = Parallelipipede();
aileGauche.Masse=3.25;
aileGauche.Longueur=10.6;
aileGauche.Largeur=1.14;
aileGauche.Epaisseur=0.25;
aileGauche.Position=[10.54, 0, aileGauche.Epaisseur/2 ];
aileGauche.CentreDeMasse=aileGauche.CalculeCentreDeMassePara();
aileGauche.MI = aileGauche.CalculMomentInertie();

aileDroite = Parallelipipede();
aileDroite.Masse=3.25;
aileDroite.Longueur=10.6;
aileDroite.Largeur=1.14;
aileDroite.Epaisseur=0.25;
aileDroite.Position=[10.54,  - aileDroite.Longueur, aileDroite.Epaisseur/2 ];
aileDroite.CentreDeMasse=aileDroite.CalculeCentreDeMassePara();
aileDroite.MI = aileDroite.CalculMomentInertie();


aileron = Parallelipipede();
aileron.Masse=0.5;
aileron.Longueur=0.07;
aileron.Largeur=1.28;
aileron.Epaisseur= 2.1;
aileron.Position=[aileron.Largeur/2,0, 2*fuselage.Rayon + aileGauche.Epaisseur + aileron.Epaisseur/2];
aileron.CentreDeMasse=aileron.CentreMasseAileron();
aileron.MI = aileron.CalculMomentInertie();


avion = Avion();

avion.Fuselage = fuselage;
avion.Cabine = cabinePilotage;
avion.AileGauche = aileGauche;
avion.AileDroite = aileDroite;
avion.Aileron = aileron;
avion.MoteurGauche = moteurGauche;
avion.MoteurDroit = moteurDroit;
masseTotale = avion.MasseTotale();

disp(masseTotale);

centreAvionLoc = avion.CentreDeMasseAvion();
centreAvion = Rotation(0, centreAvionLoc);
posNez0 = [22.95 + cabinePilotage.Hauteur,0,cabinePilotage.Rayon+eppaiseurAil];

diff = posA - posNez0;

centreFinal = centreAvion + diff;

% ajustement de tous les moments d'inertie par rapport au système d'axes du
% laboratoire

MI_fuselage = MomentInertie.InertieAjusteeCM(fuselage.MI, fuselage.Masse, fuselage.CentreDeMasse, centreFinal);
MI_cabine = MomentInertie.InertieAjusteeCM(cabinePilotage.MI, cabinePilotage.Masse, cabinePilotage.CentreDeMasse, centreFinal);
MI_aileD = MomentInertie.InertieAjusteeCM(aileDroite.MI, aileDroite.Masse, aileDroite.CentreDeMasse, centreFinal);
MI_aileG = MomentInertie.InertieAjusteeCM(aileGauche.MI, aileGauche.Masse, aileGauche.CentreDeMasse, centreFinal);
MI_motD = MomentInertie.InertieAjusteeCM(moteurDroit.MI, moteurDroit.Masse, moteurDroit.CentreDeMasse, centreFinal);
MI_motG = MomentInertie.InertieAjusteeCM(moteurGauche.MI, moteurGauche.Masse, moteurGauche.CentreDeMasse, centreFinal);
MI_aileron = MomentInertie.InertieAjusteeCM(aileron.MI, aileron.Masse, aileron.CentreDeMasse, centreFinal);

Vecteur_MI_objets = [MI_fuselage, MI_cabine, MI_aileD, MI_aileG, MI_motD, MI_motG, MI_aileron];

MIsansRot = MomentInertie.InertieSysteme(Vecteur_MI_objets, ar);
MI = Rotation(ar, MIsansRot);

pcm = centreFinal;

%calcul des positions des forces

Lm = moteurDroit.Hauteur;
rm = moteurDroit.Rayon;
rc = cabinePilotage.Rayon;
eA = aileDroite.Epaisseur;


% Position des forces appliquees sur l'avion
pos_md = [5-Lm/2;rc+rm;eA+rc] - pcm+diff; % position de l'application de la force sur le moteur droit 
pos_mg = [5-Lm/2;-(rc+rm);eA+rc] - pcm+diff; % position de l'application de la force sur le moteur gauche
pos_p = [10.54;0;0] - pcm+diff; % position de la force de la portee
posF=[pos_md,pos_mg,pos_p];
aa = AccelerationAngulaire( ar, posF, MI, va,Forces );
% disp('Son acceleration angulaire en rad/s est ');




end

