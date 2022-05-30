Contenuto cartella progetto .zip:

-run: carica nel workspace i parametri D-H e quelli geometrici dei link del robot,
      avvia la simulazione su Simulink/Multibody ed esegue la validazione della 
      soluzione della cinematica inversa, con relativo plot della traiettoria;

-ik_test: script utilizzato per la validazione, richiama la funzione matrixFK.m;

-matrixFK: funzione che estrae dai vettori delle variabili di giunto calcolati
	   dalla cinematica inversa i (17 x 5) campioni utilizzati nella validazione;

-robot_5dof_sim: modello simulink

-additional_codes: contiene gli scripts utilizzati per il calcolo di matrici numeriche e simboliche, 
		   delle equazioni della cinematica, posa iniziale del robot, ecc.