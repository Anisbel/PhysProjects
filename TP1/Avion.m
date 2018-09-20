classdef Avion
    %AVION Summary of this class goes here
    %   La classe qui représente l'avion au complet
    
    properties
        AileGauche
        AileDroite
        MoteurGauche
        MoteurDroit
        Cabine
        Fuselage
        Aileron
        Composantes
    end
    
    methods
        function avion = Avion()
            avion.Fuselage = Cylindre();
            avion.Cabine = Cone();
            avion.AileGauche = Parallelipipede();
            avion.AileDroite = Parallelipipede();
            avion.Aileron = Parallelipipede();
            avion.MoteurGauche = Cylindre();
            avion.MoteurDroit = Cylindre();
            avion.Composantes = cell(7, 1);
            avion.Composantes = {avion.Fuselage, avion.Cabine, avion.AileGauche, avion.AileDroite, avion.Aileron, avion.MoteurGauche, avion.MoteurDroit};
        end
        
        function masseTotale = MasseTotale(obj)
            masseTotale = obj.Fuselage.Masse + obj.Cabine.Masse + obj.AileGauche.Masse + obj.AileDroite.Masse + obj.Aileron.Masse + obj.MoteurGauche.Masse + obj.MoteurDroit.Masse;
        end
        
        function [centre] = CentreDeMasseAvion(obj)
            for n = 1:7
                
            end
        end
                
    end
end

