%script di esecuzione
%si caricano i parametri neecessari all'esecuzione della simulazione
%del moto del robot e dell'algoritmo di inversione cinematica
%per ottenere i valori delle variabili di giunto ottenute dall'inseguimento
%della traiettoria scelta per il tool, ovvero una spirale logaritmica

%parametri numerici di Denavit-Hartenberg
a = [ 0 0 120 127 0 ];
d = [ 70 0 0 0 100 0 ];

%modellistica del robot su Simscape Multibody

%parametri che descrivono la geometria del robot 
L1 = 1;
L2 = 1;
L3 = 0.8;
L4 = 0.1;
L5 = 0.5;

%si avvia la simulazione tramite Simulink
sim('robot_5dof_sim')

%validazione della cinematica inversa
ik_test;
