clear
%R�cup�ration des donn�es
load sim_data_set.mat;
%Trace les donn�es sur un graphique
%[X1,X2,X3,X4]=Recup_Matrice_Classe(R);
X = R(:,1:2);
T=R(:,3);
ToneofK=classes2oneofK(T);