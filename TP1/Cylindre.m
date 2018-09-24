classdef Cylindre
    %CYLINDRE Summary of this class goes here
    %   Un solide ayant la forme d'un cône avec comme attributs le centre
    %   de masse, la masse, le rayon et la hauteur
    
    properties
        CentreDeMasse
        Masse
        MI
        Hauteur
        Rayon
        Position
    end
    
    methods
        function cylindre = Cylindre()
            cylindre.CentreDeMasse = [0,0,0];
            cylindre.Masse = 0;
            cylindre.Hauteur = 0;
            cylindre.Rayon = 0;
            cylindre.Position = [0,0,0];
            cylindre.MI = [0,0,0];
        end
                %FONCTION A REVOIR !!!!!
        function [centre] = CentreDeMasseCylindre(obj)
			% x, y, z
		
			centre = [obj.Hauteur/2 + obj.Position(1),obj.Position(2),obj.Position(3)];
        end
        
        function [momentInertie] = CalculMomentInertie(obj)
		
			momentInertie = MomentInertie.InertieCylindre(obj.Masse, obj.Rayon, obj.Hauteur);
		
        end
    end
end

