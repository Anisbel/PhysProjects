classdef Cone
    %CONE Summary of this class goes here
    %   Un solide ayant la forme d'un cône avec comme attributs le centre
    %   de masse, la masse, le rayon et la hauteur
    
    properties
        CentreDeMasse
        MI
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
            cone.MI = [0,0,0];
            
        end
        
        %fonction a revoir !!!!!
		function [centre] = CalculeCentreDeMasseCone(obj)
		
			centre = [obj.Hauteur/4 + obj.Position(1), obj.Position(2), obj.Position(3)];
		
        end
        
        function [momentInertie] = CalculMomentInertie(obj)
		
			momentInertie = MomentInertie.InertieCone(obj.Masse, obj.Rayon, obj.Hauteur);
		
        end
    end
end

