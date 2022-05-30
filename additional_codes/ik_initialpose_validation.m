%test per la validazione della cinematica inversa
theta = [ 0 0 0 pi/2 0 ];

%variabili di giunto
q = [126.8699    3.1715   73.0796 -166.2511 -180.0000];

%angoli in radianti
q = deg2rad(q);
%a_i da D-H
a = [ 0 0 120 127 0 ];
%d_i da D-H
d = [ 70 0 0 0 100 ];

%verifica
fprintf('%s\n','Validazione della cinematica inversa:')
fprintf('%s\n','le coordinate scelte per il grip sono x= -150,y= 200,z= 200.')
%si attua sostituendo i valori determinati per le variabili di giunto
%nella matrice di trasformazione omogenea complessiva

Htest = [  cos(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))) - sin(q(1))*sin(q(5)), - cos(q(5))*sin(q(1)) - sin(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))), - cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) - sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))), a(4)*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - d(5)*(cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3)))) + a(3)*cos(q(1))*cos(q(2));
        cos(q(1))*sin(q(5)) - cos(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   cos(q(1))*cos(q(5)) + sin(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) - cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))), a(3)*cos(q(2))*sin(q(1)) - d(5)*(cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))) - sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)))) - a(4)*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)));
                                                    cos(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                                    -sin(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                   cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))),                                                    d(1) + a(4)*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + a(3)*sin(q(2)) + d(5)*(cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))));
                                                                                                                                                     0,                                                                                                                                                       0,                                                                                                                           0,                                                                                                                                                                                                            1]