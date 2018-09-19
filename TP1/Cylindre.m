classdef Cylindre
    %CYLINDRE Summary of this class goes here
    %   Un solide ayant la forme d'un cône avec comme attributs le centre
    %   de masse, la masse, le rayon et la hauteur
    
    properties
        CentreDeMasse
        Masse
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
        end
    end
end

