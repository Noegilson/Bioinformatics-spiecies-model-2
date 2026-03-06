%For scenario 2, the goal is to extinguish the population of lynxes around
%12 months. The surviving populations then needs to get stable within 120 months 

%This code uses the function plants_hare_lynx.m. To be able to run the
%code, make sure that function file lies in the same folder as this one.

clear
clc
close all


% the parameters in the differential equations
a1 = 3;     %the maximum plant consumption rate by hares is lower than in scenario 1
b1 = 3.5;   %the saturation parameter for plant consumption is slightly larger than in scenario 1
a2 = 0.002; %the maximum hare consumtion rate by lynxes is much smaller than in scenario 1
b2 = 4.5;   %The saturation parameter for predation is much larger than in scenario 1
d1 = 0.4;   %the death rate of hares per capita stays the same
d2 = 0.36;  %The death rate of the lynxes per capita is a lot higher

X0 = 0.8;  %the concentration of plants and hares stay the same 
Y0 = 0.3;    
Z0 = 1;    %the concentration of lynxes is halved by 8 in order to facilitate its extinction

y0 = [X0 Y0 Z0];


tspan = [0 200];   %the observation is done for the first 200 months


[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);


X = y(:,1);
Y = y(:,2);
Z = y(:,3);

% 3D plot of the 3 populations without time
figure
plot3(X,Y,Z,'LineWidth',1.5)
grid on

xlabel('Plants (X)')
ylabel('Herbivores / Hares (Y)')
zlabel('Carnivores / Lynx (Z)')

title('Three-Species Food Chain Dynamics (scenario 2)')
view(45,25)
 
% 2D representation of the 3 populations over time
figure("Name",'plant-hare-lynx')
plot(t,y)
title('plant-hare-lynx Populations Over Time (scenario 2)')
xlabel('Time [months]')
ylabel('Population')
legend('plant','hare', 'lynx','Location','North')


