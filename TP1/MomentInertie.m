 classdef MomentInertie
    methods(Static)
        
        function [inertie] = InertieCone( masse, r, h )
            % r : rayon du cone , h:hauteur du cone 
            
            %matrice de base
            inertie = [1, 0, 0 ;0, 1, 0;0, 0, 1];
            
            %Ic,xx = m(12r^2+3h^2)/80
            Ic_xx = masse * ((3*(r^2)) / 10);
            
                
            %Ic,yy = %Ic,xx = m(12r^2+3h^2)/80
            Ic_yy = masse * (((12 * (r^2) + 3 * (h^2))) / 80);
                
            %Ic,zz = m(3r^2/10)
            Ic_zz = Ic_yy;
            
            inertie(1,1) = Ic_xx;
            inertie(2,2) = Ic_yy;
            inertie(3,3) = Ic_zz;
        end
        
        function [inertie] = InertieCylindre( masse, r, h )
            % r : rayon du cone , h:hauteur du cone 
            
            %matrice de base
            inertie = [1, 0, 0 ;0, 1, 0;0, 0, 1];
            
            %Ic,xx = (m/4)*(r^2) + (m/12)*(l^2)
            Ic_xx = (masse/2) * (r^2);
                
            %Ic,yy = %Ic,xx = (m/4)*(r^2) + (m/12)*(l^2)
            Ic_yy = masse * ((r^2)/4+(h^2)/12);
                
            %Ic,zz = (m/2)*(r^2)
            Ic_zz =Ic_yy;
            
            inertie(1,1) = Ic_xx;
            inertie(2,2) = Ic_yy;
            inertie(3,3) = Ic_zz;
        end 
   
        function [inertie] = InertieParallelepipede( masse, lx,ly, lz )
            % lx longueur est suivant x , ly suivant y , lz suivant z 
            
            %matrice de base
            inertie = [1, 0, 0 ;0, 1, 0;0, 0, 1];
            
            %Ic,xx = (masse/12)*((ly^2) + (lz^2))
            Ic_xx = (masse/12)*((ly^2) + (lz^2));
                
            %Ic,yy = (masse/12)*((lx^2) + (lz^2))
            Ic_yy = (masse/12)*((lx^2) + (lz^2));
                
            %Ic,zz = (masse/12)*((ly^2) + (lz^2))
            Ic_zz = (masse/12)*((lx^2) + (ly^2));
            
            inertie(1,1) = Ic_xx;
            inertie(2,2) = Ic_yy;           
            inertie(3,3) = Ic_zz;
        end 
        
        function [inertieAjustee] = InertieAjusteeCM( inertieObj, masseObj, cmObj, cmGlob )
%                              cette fonction ? pour but de rapporter l'inertie de chaque objet au
%                                            centre de masse globale du syst?me 

% les variables d'entr?e sont :
% masseObj --> masse de l'objet en kg
% inertieObj --> est l'inertie de l'objet par % ? son centre de masse 
% cmObj --> Centre de masse de l'objet 
% cmGlob --> Centre de masse du syst?me global 

%Variable de sortie :
% inertieAjustee --> matrice de l'inertie ajust?e de l'objet en kg.m?

%                 dx = cmGlob(1) - cmObj(1);
%                 dy = cmGlob(2) - cmObj(2);
%                 dz = cmGlob(3) - cmObj(3);

                dx = cmObj(1) - cmGlob(1);
                dy = cmObj(2) - cmGlob(2);
                dz = cmObj(3) - cmGlob(3);
                
                inertieAjustee = [0 0 0 ;0 0 0;0 0 0];
                
                inertieAjustee(1,1) = inertieObj(1,1) + masseObj * (dy^2 + dz^2);
                inertieAjustee(1,2) = inertieObj(1,2) + masseObj * (-dx * dy);
                inertieAjustee(1,3) = inertieObj(1,3) + masseObj * (-dx * dz);

                inertieAjustee(2,1) = inertieObj(2,1) + masseObj * (-dy * dx);
                inertieAjustee(2,2) = inertieObj(2,2) + masseObj * (dx^2 + dz^2);
                inertieAjustee(2,3) = inertieObj(2,3) + masseObj * (-dy * dz);

                inertieAjustee(3,1) = inertieObj(3,1) + masseObj * (-dz * dx);
                inertieAjustee(3,2) = inertieObj(3,2) + masseObj * (-dz * dy);
                inertieAjustee(3,3) = inertieObj(3,3) + masseObj * (dx^2 + dy^2);
                
        end
        
        function [inertieTotale] = InertieSysteme( I, ar )
            
            %I vecteur contenant les inerties des objects
            
            inertieCalcul = [0, 0, 0 ;0, 0, 0;0, 0, 0];
            
            n=numel(I(1,:))/3;
            for i = 0:n-1
				inertieCalcul = inertieCalcul + I(:,3*i+1:3*i+3);
            end
            %fin de la boucle 'for'
            
            %Matrice de rotation (la rotation est autour  de l'axe des y
            RotY = [cos(ar), 0, sin(ar); 0, 1, 0; -sin(ar),0, cos(ar)];
            inertieTotale = RotY * inertieCalcul * transpose(RotY);
        end
        
    end
end