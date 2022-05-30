%matrice di trasformazione omogenea

%calcolo della matrice di trasformazione complessiva
function [ H ] = transformation_matrix()

%variabili associate ai giunti
syms q1 real
syms q2 real
syms q3 real
syms q4 real
syms q5 real
%variabili simboliche associate ai parametri di D-H
syms a3 real
syms a4 real
syms d1 real 
syms d5 real

%%% matrici di trasformazione associate ai links %%%

%Link 1
T01 = [ cos(q1), -sin(q1),  0,  0;
        sin(q1),  cos(q1),  0,  0;
              0,        0,  1, d1;
              0,        0,  0,  1];
  
%Link 2
T12 = [ cos(q2),        0,  sin(q2),  0;
        sin(q2),        0, -cos(q2),  0;
              0,        1,        0,  0;
              0,        0,        0,  1];
 
%Link 3 
T23 = [ cos(q3), -sin(q3),  0,  a3*cos(q3);
        sin(q3),  cos(q3),  0,  a3*cos(q3);
              0,        0,  1,           0;
              0,        0,  0,           1];

%Link 4
T34 = [ cos(q4), -sin(q4),   0,  a4*cos(q4);
        sin(q4),  cos(q4),   0,  a4*sin(q4);
              0,        0,   1,           0;
              0,        0,   0,           1];
 
%Link 5
T45 = [ cos(q5),        0,   -sin(q5),   0;
        sin(q5),        0,    cos(q5),   0;
              0,       -1,          0,  d5;
              0,        0,          0,   1];
        

%matrice di trasformazione complessiva
%ottenuta dal prodotto delle precedenti

H = T01 * T12 * T23 * T34 * T45;
%fine funzione
end
