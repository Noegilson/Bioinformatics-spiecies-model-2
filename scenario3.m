clear
clc
close all

%For scenario 3 the thing was to take the model with aproximatevely the
%same values as in the book and then change then we adjust the parameters
%to obtain 2 peaks in the period of 200 months for that we had to reduces
%b2 wich lead to a faster death of lynxes and then to a faster groxth of
%them cause there are a lot of hares so the population change faster.
a1 = 5;
b1 = 3;
a2 = 0.1;
b2 = 2;
d1 =0.4;
d2 = 0.01;


X0 = 0.8;   
Y0 = 0.2;  
Z0 = 8;   

y0 = [X0 Y0 Z0];
y1 = [X0 Y0+0.01 Z0]

tspan = [0 700];    %increasing the timespan


[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);
[t1,y2] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y1);

X = y(:,1);
Y = y(:,2);
Z = y(:,3);

%  plot
figure("Name",'plant-hare-lynx')
plot(t,y)
hold on
plot(t1,y2)
title('plant-hare-lynx Populations Over Time (scenario 3)')
xlabel('Time [months]')
ylabel('Population')
legend('plant','hare', 'lynx','plant2','hare2', 'lynx2','Location','best')
%plant2 , lynx2 and hare2 are the names for the populatation after a small
%change of 0,01 of the hare population we can see an important change in
%population after this change.

% 3D plot
figure
plot3(X,Y,Z,'LineWidth',1.5)
grid on

xlabel('Plants (X)')
ylabel('Herbivores / Hares (Y)')
zlabel('Carnivores / Lynx (Z)')

title('Not Periodic (scenario 3)')
view(45,25)

