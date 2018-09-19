classdef Cone
    %CONE Summary of this class goes here
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
        function cone = Cone()
            %CONE Construct an instance of this class
            %   Detailed explanation goes here
            cone.CentreDeMasse = [0,0,0];
            cone.Masse = 0;
            cone.Hauteur = 0;
            cone.Rayon = 0;
            cone.Position = [0,0,0];
        end
    end
end

