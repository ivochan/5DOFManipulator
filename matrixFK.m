function matrix = matrixFK (q1, q2, q3, q4, q5) 
%matrice che conterra' i vettori delle variabili di giunto
%ogni riga rappresenta l'insieme degli angoli calcolati per uno 
%specifico punto appartenente alla traiettoria parametrica
M(17,5)=0;

%indici di riga e colonna per iterare la matrice
r = 1;
c = 1;

%estrazione di 17 vettori di variabili di giunto
for i = 1:1000:16000
    M(r,c) = q1(i);
    M(r,c+1) = q2(i);
    M(r,c+2) = q3(i);
    M(r,c+3) = q4(i);
    M(r,c+4) = q5(i);
    r=r+1;
end

M(r,c) = q1(16417);
M(r,c+1) = q2(16417);
M(r,c+2) = q3(16417);
M(r,c+3) = q4(16417);
M(r,c+4) = q5(16417);

%matrice che contiente i valori degli angoli delle variabili di giunto
%calcolate tramite l'algoritmo di inversione cinematica nell'inseguimento
%della traiettoria stabilita
matrix = M;
end 