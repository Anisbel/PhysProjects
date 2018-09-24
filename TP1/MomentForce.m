function [ tau ] = MomentForce( posForce, force)
% cette fonction calcul le moment de force "tau" gener� par l'application de la force au niveau de la posion "posForce"

    tau = cross(posForce, force);  % cross est la fonction d�finit sur MATLAB pour le calcul du produit vectoriel
	
end