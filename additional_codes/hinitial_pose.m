%valore iniziale della posa del tool
%il valore iniziale degli angoli e' scelto a priori
%in modo da determinare una 

%CONFIGURAZIONE INIZIALE del robot
%q(1)=0,  q(2)=0,   q(3)=0, 
%q(4)= (q(4)-pi/2), q(5)=0

theta = [ 0 0 0 pi/2 0 ];
q = [ 0 0 0 0-theta(4) 0 ];
rad2deg(q);
%a_i da D-H
a = [ 0 0 120 127 0 ];
%d_i da D-H
d = [ 70 0 0 0 100 ];

fprintf('%s\n', 'matrice di trasformazione relativa alla posa INIZIALE del robot')
fprintf('%s\n', 'Angoli = [ 0 0 0 -90 0 ], w = 0')
%matrice di trasformazione omogenea che descrive la configurazione iniziale
%del robot

Hi = [  cos(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))) - sin(q(1))*sin(q(5)), - cos(q(5))*sin(q(1)) - sin(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))), - cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) - sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))), a(4)*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - d(5)*(cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3)))) + a(3)*cos(q(1))*cos(q(2));
        cos(q(1))*sin(q(5)) - cos(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   cos(q(1))*cos(q(5)) + sin(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) - cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))), a(3)*cos(q(2))*sin(q(1)) - d(5)*(cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))) - sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)))) - a(4)*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)));
                                                    cos(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                                    -sin(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                   cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))),                                                    d(1) + a(4)*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + a(3)*sin(q(2)) + d(5)*(cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))));
                                                                                                                                                     0,                                                                                                                                                       0,                                                                                                                           0,                                                                                                                                                                                                            1]