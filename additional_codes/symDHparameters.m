%parametri di Dentavit-Hartenberg
%variabili simboliche REALI della struttura del robot
%utilizzate per calcolare la cinematica in forma parametrica
%in modo da sfruttare le variabili per ricavare le formule
function [ symDH ] = symDHparameters()
%varibili simboliche associate alla configurazione del robot
syms a3 real
syms a4 real
syms d1 real
syms d5 real
%variabili simboliche associate alle variabili di giunto
syms q1 real
syms q2 real
syms q3 real
syms q4 real
syms q5 real
%elenco dei parametri
%alpha_i
alpha = [   0   pi/2    0   0   -pi/2   ];
%a_i
a = [   0   0   a3  a4   0	];
%d_i
d = [   d1  0   0   0   d5	];
%theta_i
theta = [   q1  q2  q3  q4  q5	];
%si raccolgono tutti i parametri in una matrice 
%ogni tipo di parametro occupa una colonna
fprintf('%s\n','parametri di Denavit-Hartenberg');
%tabella D-H
symDH =  [  alpha;  a;  d;  theta]';

end

            
