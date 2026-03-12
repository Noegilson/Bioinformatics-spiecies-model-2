%For scenario 1, the goal is to obtain a system that exhibits stable
%oscillations with a periodicity of approximately 70 months. 

%This code uses the function plants_hare_lynx.m. To be able to run the
%code, make sure that function file lies in the same folder as this one.

%For this assignment, the book "Modeling Life" by Alan Garfinkel, Jane
%Shevtsov and Yina Guo of 2010 (ISBN 978-3-319-59730-0) was taken as
%reference.

clear
clc
close all

%values from the book were taken as starting point. 
a1 = 5;     %the maximum plant consumption rate by hares is the same as in the textbook
b1 = 3;     %the saturation parameter for plant consumption stays the same as in the textbook
a2 = 0.1;   %the maximum lynx predation rate on hares stays the same as in the textbook
b2 = 1.3;   %the saturation parameter for predation is smaller than in the reference
d1 =0.4;    %the death rate of hares per capita stays the same
d2 = 0.01;  %the death rate of the lynxes per capita stays the same

%values for the populations starting point were taken from figure 5.1 in the book 
X0 = 0.8;   
Y0 = 0.3;  
Z0 = 8;   

y0 = [X0 Y0 Z0];


tspan = [0 200];


[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);


X = y(:,1);
Y = y(:,2);
Z = y(:,3);

% 3D plot
figure
plot3(X,Y,Z,'LineWidth',1.5)
grid on

xlabel('Plants (X)')
ylabel('Herbivores / Hares (Y)')
zlabel('Carnivores / Lynx (Z)')

title('Three-Species Food Chain Dynamics (scenario 1)')
view(45,25)

% 2D plot representing the populations dynamics over time
figure("Name",'plant-hare-lynx')
plot(t,y)
title('plant-hare-lynx Populations Over Time (scenario 1)')
xlabel('Time [months]')
ylabel('Population')

legend('plant','hare', 'lynx','Location','North')
