classdef Parallelipipede
    %PARALLELIPIPEDE Summary of this class goes here
    %   Un solide ayant la forme d'un Parallelipipede avec comme attributs le centre
    %   de masse, la masse, la largeur, la hauteur et l'epaisseur
    
    properties
        CentreDeMasse
        MI
        Masse
        Longueur
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
            para.Longueur = 0;
            para.Largeur = 0;
            para.Epaisseur = 0;
            para.Position = [0,0,0];
            para.MI = [0,0,0];
        end
        
        function [centre] = CalculeCentreDeMassePara(obj)
		
            centre = [ obj.Position(1), obj.Longueur/2 + obj.Position(2), obj.Position(3)];
		
        end
        
        function [centre] = CentreMasseAileron(obj)
		
            centre = [ obj.Position(1), obj.Position(2), obj.Position(3)];
		
        end
        
         function [momentInertie] = CalculMomentInertie(obj)
		
			momentInertie = MomentInertie.InertieParallelepipede(obj.Masse, obj.Largeur, obj.Longueur, obj.Epaisseur);
		
        end
    end
end

