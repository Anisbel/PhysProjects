classdef Avion
    %AVION Summary of this class goes here
    %   La classe qui représente l'avion au complet
    
    properties
        AileGauche
        AileDroite
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
            avion.Composantes = [avion.Fuselage, avion.Cabine, avion.AileGauche, avion.AileDroite, avion.Aileron];
        end
                
    end
end

