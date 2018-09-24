function [ tau ] = MomentForce( posForce, force)
% cette fonction calcul le moment de force "tau" generé par l'application de la force au niveau de la posion "posForce"

    tau = cross(posForce, force);  % cross est la fonction définit sur MATLAB pour le calcul du produit vectoriel
	
end