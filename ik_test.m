%test per la validazione della cinematica inversa
%tramite la cinematica diretta

%matrice campioni variabili di giunto 
M = matrixFK(q1, q2, q3, q4, q5);

%matrice posizione
P(17,3) = 0;

for i = 1 : 17
    
    %vettore riga estratto dalla matrice delle variabili di giunto
    %contiene gli angoli qi, con i da 1 a 5, calcolati per uno
    %specifico istante di tempo
    q = M(i,:);
  
    %matrice di trasformazione complessiva
    Ht = [  cos(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))) - sin(q(1))*sin(q(5)), - cos(q(5))*sin(q(1)) - sin(q(5))*(cos(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2)))), - cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) - sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))), a(4)*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3))) - d(5)*(cos(q(4))*(cos(q(1))*cos(q(2))*sin(q(3)) + cos(q(1))*cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(1))*cos(q(2))*cos(q(3)) - cos(q(1))*sin(q(2))*sin(q(3)))) + a(3)*cos(q(1))*cos(q(2));
            cos(q(1))*sin(q(5)) - cos(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   cos(q(1))*cos(q(5)) + sin(q(5))*(cos(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) + sin(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2)))),   sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1))) - cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))), a(3)*cos(q(2))*sin(q(1)) - d(5)*(cos(q(4))*(cos(q(2))*sin(q(1))*sin(q(3)) + cos(q(3))*sin(q(1))*sin(q(2))) - sin(q(4))*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)))) - a(4)*(sin(q(1))*sin(q(2))*sin(q(3)) - cos(q(2))*cos(q(3))*sin(q(1)));
                                                    cos(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                                    -sin(q(5))*(cos(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + sin(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3)))),                                   cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))),                                                    d(1) + a(4)*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))) + a(3)*sin(q(2)) + d(5)*(cos(q(4))*(cos(q(2))*cos(q(3)) - sin(q(2))*sin(q(3))) - sin(q(4))*(cos(q(2))*sin(q(3)) + cos(q(3))*sin(q(2))));
                                                                                                                                                     0,                                                                                                                                                       0,                                                                                                                           0,                                                                                                                                                                                                            1];


    %coordinate del punto
    P(i,1) = Ht(1,4);
    P(i,2) = Ht(2,4);
    P(i,3) = Ht(3,4);
end 

%plot della traiettoria scelta: spirale 
figure;
t =0 : 0.01: 40;
t = t+15;
r = exp(t/10);
X = r.*cos(t);
Y = r.*sin(t);
Z = t;
plot3(X, Y, Z, 'b','LineWidth',1.2)

%plot dei 16 punti descritti tramite le coordinate (x,y,z) 
%sono stati ottenuti tramite la cinematica diretta
%utilizzando gli angoli dei giunti calcolati con l'algoritmo di
%inversione cinematica

hold on
plot3(P(:,1), P(:,2), P(:,3), 'r*')
grid;
xlabel('x');
ylabel('y');
zlabel('z');

legend('traiettoria', 'punti campionati');
                                                                                                                                                