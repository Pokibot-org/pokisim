%%  Parametrage du modele


Tech = 1e-2;

%%  Motor model
U_alim = 24; %V

%%  Kalman Estimation

A = [0, 0, 1/(M_robot+2*J_roue/R_roue^2)*1/R_roue*3/2*Kt*N1, 1/(M_robot+2*J_roue/R_roue^2)*1/R_roue*3/2*Kt*N1;
    0, 0, +1/(J_robot+L_roue^2/(2*R_roue^2)*J_roue)*L_roue/(2*R_roue)*3/2*Kt*N1, -1/(J_robot+L_roue^2/(2*R_roue^2)*J_roue)*L_roue/(2*R_roue)*3/2*Kt*N1;
    -Ke*N1/R_roue/L, -Ke*L_roue/2*N1/R_roue/L, -R/L, 0;
    -Ke*N1/R_roue/L, + Ke*L_roue/2*N1/R_roue/L, 0, -R/L];
B = [0,0;
    0,0;
    1/L,0;
    0,1/L];
C = [N1/R_roue, N1/R_roue*L_roue/2, 0, 0;
    N1/R_roue, -N1/R_roue*L_roue/2, 0, 0];

D = 0;

Qkal = [1, 0;
        0, 1];
Gkal = [1/(M_robot+2*J_roue/R_roue^2),0;
        0, 1/(J_robot+L_roue^2/(2*R_roue^2)*J_roue);
        0, 0;
        0, 0];

Rkal = [1^2,0;
       0,1^2];
   
%Discretisation de la ss   
PokiBot = ss(A,B,C,0);
PokiBot_d = c2d(PokiBot,Tech);

%Discretisation de la matrice de covariance de bruit de modele

Qd = Tech*Gkal*Qkal*Gkal';

%%  LQ Controler

