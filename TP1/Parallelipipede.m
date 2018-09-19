classdef Parallelipipede
    %PARALLELIPIPEDE Summary of this class goes here
    %   Un solide ayant la forme d'un Parallelipipede avec comme attributs le centre
    %   de masse, la masse, la largeur, la hauteur et l'epaisseur
    
    properties
        CentreDeMasse
        Masse
        Hauteur
        Largeur
        Epaisseur
        Position
    end
    
    methods
        function para = Parallelipipede()
            %PARALLELIPIPEDE Construct an instance of this class
            %   Detailed explanation goes here
            para.CentreDeMasse = [0,0,0];
            para.Masse = 0;
            para.Hauteur = 0;
            para.Largeur = 0;
            para.Epaisseur = 0;
            para.Position = [0,0,0];
        end
    end
end

