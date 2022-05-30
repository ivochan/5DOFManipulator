%calcolo delle matrici di trasformazione associate ad ogni link
%che costituisce la struttura, espresse in maniera simbolica

%generica matrice di trasformazione omogenea H 
%H=[            cos(theta),           -sin(theta),           0,             a;
%  [ cos(alpha)*sin(theta), cos(alpha)*cos(theta), -sin(alpha), -d*sin(alpha);
%  [ sin(alpha)*sin(theta), sin(alpha)*cos(theta),  cos(alpha),  d*cos(alpha);
%  [                     0,                     0,           0,             1]

%la funzione riceve come argomenti i parametri D-H
function [ T01 T12 T23 T34 T45 ]  = symtmatrices(alpha,a,d)

%variabili simboliche associate alle variabili di giunto
syms q1 real
syms q2 real
syms q3 real
syms q4 real
syms q5 real
syms a3 real
syms a4 real
syms d1 real
syms d5 real
%alpha_i
alpha = [   0   pi/2    0   0   -pi/2	];
%a_i
a = [   0   0   a3  a4   0	];
%d_i
d = [   d1  0   0   0   d5	];

%variabili di giunto theta_i = [   q1  q2  q3  q4  q5	]

%doppia precisione dopo la virgola
dp = 2;

%Link 1
T01=vpa([               cos(q1),               -sin(q1),               0,                a(1);
          cos(alpha(1))*sin(q1),  cos(alpha(1))*cos(q1),   -sin(alpha(1)),  d(1)*sin(alpha(1));
          sin(alpha(1))*sin(q1),  sin(alpha(1))*cos(q1),    cos(alpha(1)),  d(1)*cos(alpha(1));
                              0,                      0,                0,                  1],dp);

%Link 2
T12=vpa([              cos(q2),                -sin(q2),                0,                a(2);
          cos(alpha(2))*sin(q2),  cos(alpha(2))*cos(q2),   -sin(alpha(2)), -d(2)*sin(alpha(2));
          sin(alpha(2))*sin(q2),  sin(alpha(2))*cos(q2),    cos(alpha(2)),  d(2)*cos(alpha(2));
                              0,                      0,                0,                  1],dp);
        
%Link 3
T23=vpa([               cos(q3),               -sin(q3),                0,                a(3);
          cos(alpha(3))*sin(q3),  cos(alpha(3))*cos(q3),   -sin(alpha(3)), -d(3)*sin(alpha(3));
          sin(alpha(3))*sin(q3),  sin(alpha(3))*cos(q3),    cos(alpha(3)),  d(3)*cos(alpha(3));
                              0,                      0,                0,                  1],dp);
        
%Link 4
T34=vpa([               cos(q4),               -sin(q4),                0,                a(4);
          cos(alpha(4))*sin(q4),  cos(alpha(4))*cos(q4),   -sin(alpha(4)), -d(4)*sin(alpha(4));
          sin(alpha(4))*sin(q4),  sin(alpha(4))*cos(q4),    cos(alpha(4)),  d(4)*cos(alpha(4));
                              0,                      0,                0,                  1],dp);
        
        
%Link 5
T45=vpa([               cos(q5),               -sin(q5),                0,                a(5);
          cos(alpha(5))*sin(q5),  cos(alpha(5))*cos(q5),   -sin(alpha(5)), -d(5)*sin(alpha(5));
          sin(alpha(5))*sin(q5),  sin(alpha(5))*cos(q5),    cos(alpha(5)),  d(5)*cos(alpha(5));
                              0,                      0,                0,                  1],dp);

end 
%%%%% matrici di trasformazione ottenute %%%%%
%Link 1
%T01 = [ cos(q1), -sin(q1), 0,  0;
%        sin(q1),  cos(q1), 0,  0;
%              0,        0, 1, d1;
%              0,        0, 0,  1];
% 
%Link 2
%T12 = [ cos(q2), -sin(q2),  0,  0;
%              0,        0, -1,  0;
%        sin(q2),  cos(q2),  0,  0;
%              0,        0,  0,  1];
%
%Link 3 
%T23 = [ cos(q3), -sin(q3),  0,  a3;
%        sin(q3),  cos(q3),  0,   0;
%              0,        0,  1,   0;
%              0,        0,  0,   1];
%
%Link 4
%T34 = [ cos(q4), -sin(q4),   0,  a4;
%        sin(q4),  cos(q4),   0,   0;
%              0,        0,   1,   0;
%              0,        0,   0,   1];
% 
%Link 5
%T45 = [ cos(q5), -sin(q5),   0,   0;
%              0,        0,   1,  d5;
%       -sin(q5), -cos(q5),   0,   0;
%              0,        0,   0,   1];
%
