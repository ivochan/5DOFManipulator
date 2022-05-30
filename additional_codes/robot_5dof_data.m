%questo script e' stato ultizzato per il calcolo delle matrici di
%trasformazione del moto del robot sia in forma simbolica che numerica,
%oltre che epr effettuare il test dell'algoritmo di inversione cinematica e
%della corrispettiva verifica tramite la cinematica diretta

%parametri di D-H in forma simbolica
[ symDH ] = symDHparameters

%calcolo delle matrici di trasformazione associate ad ogni link
%in forma simbolica
[ T01 T12 T23 T34 T45 ]  = symtmatrices();

%calcolo della matrice di trasformazione complessiva
fprintf('%s\n','matrice di trasformazione omogenea complessiva H');
[ H ] = h_matrix()

%cinematica diretta: posa iniziale e finale
fprintf('%s\n', 'CINEMATICA DIRETTA')
%equazioni della cinematica
kin_eqs;

%matrice di trasformazione con qi = 0
%assunta come posa iniziale
hinitial_pose;

%cinematica inversa: variabili di giunto
fprintf('%s\n', 'CINEMATICA INVERSA')
%calcolo della cinematica inversa
inv_kin_code

%validazione della cinematica inversa
%la verifica viene fatta per la posa iniziale
ik_initialpose_validation

%parametri numerici di Denavit-Hartenberg
a = [ 0 0 120 127 0 ];
d = [ 70 0 0 0 100 0 ];

%geometria del robot in Simulink
L1 = 1;
L2 = 1;
L3 = 1;
L4 = 0.1;
L5 = 0.5;

