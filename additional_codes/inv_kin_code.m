%ALGORITMO DI INVERSIONE CINEMATICA

%si devono calcolare le variabili di giunto partendo dalla posa
%quindi dalla posizione e dall'orientazione del robot

%Hi e' la matrice di trasformazione omogenea che descrive la configurazione
%iniziale che il robot assume in funzione del valore iniziale che e'
%stato scelto per gli angoli
Hi = [  0	0	1	347;
        0	1	0	  0;
       -1	0	0	 70;
        0	0	0     1]

    
%dati dell'end effector
%posizione (quella iniziale del tool, scelta per verifica)
X = -150;
Y = 200;
Z = 200;

%coordianta x
xt = Hi(1,4) - X;
x  = Hi(1,4) - xt;
%coordinata y
yt = Hi(2,4) - Y;
y  = Hi(2,4) - yt;
%coordinata z
zt = Hi(3,4) - Z;
z  = Hi(3,4) - zt;

%orientamento
w = 0;%angolo wartg
%inidica che la somma q2* + q3* + q4* = w 
%allora nel totale si avra' q2 + q3 + q4 - 90°
%poiche' q4 = theta4 - 90° per costruzione
qw = w + (-pi/2); 

%inizio del calcolo degli angoli

%limite: -90 <= joint 1 <= +90 
%giunto q1
q1 = atan2( y, x );

%equazione op1 : secondo membro
op1b = sqrt( x^2+y^2 ) + d(5)*sin(qw);
%equazione op2 : secondo membro
op2b = z -d(1) -d(5)*cos(qw);
%espressione risultante
op3b = op1b^2 + op2b^2;
%calcolo di c3

%il valore deve essere compreso tra -1 e 1
%altrimenti la posizione richiesta e' fuori
%dallo spazio di lavoro
c3 =  ( op3b - a(3)^2 - a(4)^2 )/(2*a(3)*a(4));


%limite: -90 <= joint 3 <= +90 
%giunto q3 (giunto del gomito)
%posivo -> configurazione a gomito alto (quella scelta)
%q3 = acos(c3);
%negativo -> configurazione a gomito basso 
q3 = -acos(c3);

%angolo ausiliario alpha = beta + q2
alpha = atan2( op2b, op1b );

%angolo ausiliario beta
beta = atan2 ( a(4)*sin(q3), a(3)+a(4)*cos(q3) );

%limite: 0 <= joint 2 <= +180
%giunto q2
q2 = (alpha - beta);

%limite: -90 <= joint 4 <= +90 
%giunto q4
q4 = qw - q2 - q3;

%limite: -80 <= joint 5 <= +80 
%giunto q5

%nx e ny
r11 = Hi(1,1);
r21 = Hi(2,1);
%calcolo del s5
s5 =  -sin(q1)*r11 + cos(q1)*r21;
%ox e oy
r12 = Hi(1,2);
r22 = Hi(2,2);
%calcolo di c5
c5 = -sin(q1)*r12 + cos(q1)*r22;
%giunto q5
q5 = atan2( s5, c5);

%si crea il vettore che contiene le variabili di giunto
%corrispondenti alla posa iniziale dell'end-effector
qi = [ q1 q2 q3 q4 q5 ];

%in gradi
fprintf('%s', 'Angoli in gradi: ')
rad2deg(qi)
