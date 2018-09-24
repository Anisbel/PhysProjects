
        function accelerationAngulaire = AccelerationAngulaire( ar,posF, I, va, Forces)
			%%fonction calculant l'acceleration angulaire d'un systeme autour de son centre de masse
			%   posF : vecteur position o? est appliqu? la force
			%   Forces : vecteur repr?sentant la force sur l'objet
			%   cm : position du centre de masse de l'objet
			%   I : moment d'inertie de l'objet
			%   va : vecteur (colonne) de la vitesse angulaire initiale de l'objet
            %tau(t)
			
    
			%momentDeForce = MomentForce(positionForce, centreDeMasse, force);
            
            momentForce_md = MomentForce(posF(:,1), [Forces(1); 0;0 ]);
            momentForce_mg = MomentForce(posF(:,2), [Forces(2); 0; 0]);
            momentForce_p = MomentForce(posF(:,3), [0; 0; Forces(3)]);
            
            momentMoteur = momentForce_md + momentForce_mg ;
            
            
            %L(t) = I(t) * omega(t)
            momentCinetique = I * va;

            momentsRot = transpose(Rotation(ar,momentMoteur'))+ momentForce_p;  % la rotation est appliqu?e seulement aux forces sur les moteurs puisque la force de port?e ast toujour verticale
            

            %a(t) = I(t)^-1 * (tau(t) + L(t) x omega(t)
            %accelerationAngulaire = inv(momentInertie) * (momentDeForce + cross(momentCinetique, vitesseAngulaire));
            accelerationAngulaire = inv(I) * (momentsRot + cross(momentCinetique,va ));

        end
        
        function [ tau ] = MomentForce(posForce, force)
        % cette fonction calcul le moment de force "tau" generé par l'application de la force au niveau de la posion "posForce"

        tau = cross(posForce, force);  % cross est la fonction définit sur MATLAB pour le calcul du produit vectoriel
	
        end



        