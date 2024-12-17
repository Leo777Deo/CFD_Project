clc
clear
close

% flow characteristics 
gamma = 1.4;
rho = 1.225;
R = 287.05;

% inlet characteristics


inlet = importdata("InletP.csv");
In_Mach = 1.2;
n = length(inlet.data(:,1));
In_P = sum(inlet.data(:,1))/n;
In_T = 288.15;
P_tot_in = In_P*(1 + (gamma-1)/2*In_Mach^2)^(gamma/(gamma - 1));

% pressure recovery 1 (P_tot_engine/P_tot_inlet)
data = importdata("PressureMachPCoeff.csv");
n = length(data.data(:,1));
Av_Mach = sum(data.data(:,1))/n;
Av_stat_P = (sum(data.data(:,2))/n);
P_tot_e = Av_stat_P*(1 + (gamma-1)/2*Av_Mach^2)^(gamma/(gamma - 1));

P_rec1 = P_tot_e/P_tot_in;




