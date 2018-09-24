clear; 
clc;
clf;

disp('Devoir #1')
% Fonction appelé : [pcm, MI, aa]=Devoir1(posA,ar,va,Forces)
% posA indique la position dans l?espace du nez de l?avion.
% ar represente l?angle de rotation (en rad) autour de l?axe des y.
% va represente la vitesse angulaire autour de son centre de masse
% Force est la force exercé par les moteurs est la porté

%calculer le nez de lavion en X
hauteurCabineCone=3.82;
hauteurFuselage=22.95;
nezDeLavionEnX=hauteurCabineCone+hauteurFuselage;
%calculer le nez de lavion en Z
epaisseurAil=0.25;
rayonConeCabine=1.345;
nezAvionEnZ=epaisseurAil+rayonConeCabine;
%posA represente ici le nez de lavion
posA=[nezDeLavionEnX,0,nezAvionEnZ]; 
va=[0;0;0];
ar=0;
Forces=[11000000; 11000000; 260000000];
% Cas 1
disp('---- CAS 1 ----');
[pcm, MI, aa]=Devoir1(posA,ar,va,Forces);


disp('---- Centre de Masse ----');
disp(pcm);
disp('---- Moment dinertie ----');
disp(MI);
disp('---- Acceleration angulaire ----');

disp(aa);


% Cas 2
disp('---- CAS 2 ----');
posA = [4198, 0, 618];
ar = 0.15;
va = [0.0; -0.003; -0.01];
Forces = [8000000; 11000000; 260000000];
[pcm, MI, aa]=Devoir1(posA,ar,va,Forces);

disp('---- Centre de Masse ----');
disp(pcm);

disp('---- Moment dinertie ----');
disp(MI);

disp('---- Acceleration angulaire ----');
disp(aa);
