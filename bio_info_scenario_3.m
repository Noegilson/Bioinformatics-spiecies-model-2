%For scenario 3, the model will be taken keeping approximately the
%same values as in the book. Then parameters will be adjusted 
%to obtain 2 peaks in the period of 200 months. To do so we had to reduce
%b2 which led to an increase of lynxes deaths and later to a larger increase
%since a lot of hares were present.


clear
clc
close all


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
y1 = [X0 Y0+0.01 Z0];

tspan= [0 200];

tspan1 =[1 201];

[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);
[tspan1,y3] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan1, y0);
[t1,y2] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y1);

X = y(:,1);
Y = y(:,2);
Z = y(:,3);

%  2D plot to check unpredictanbility
figure("Name",'unpredictibility proof')
plot(t,y)
hold on
plot(t1,y2)
title('Proof of unpredictibility (scenario 3)')
xlabel('Time [months]')
ylabel('Population')
legend('plant','hare', 'lynx','plant2','hare2', 'lynx2','Location','best')
%plant2 , lynx2 and hare2 are the names for the populatation after a small
%change of 0,01 of the hare population we can see an important change in
%population after this change.

% 3D plot to check periodicity (change timespan to 700)
figure("Name",'Not periodic proof')
plot3(X,Y,Z,'LineWidth',1.5)
grid on

xlabel('Plants (X)')
ylabel('Herbivores / Hares (Y)')
zlabel('Carnivores / Lynx (Z)')

title('Not Periodic ')
view(45,25)

% Deterministic
figure("Name",'deterministic proof')
subplot(1,3,1)
plot(y(:,1),y3(:,1))
title('plant')
xlabel('Xn')
ylabel('Xn+1')

subplot(1,3,2)
plot(y(:,2),y3(:,2))
title('hare')
xlabel('Xn')
ylabel('Xn+1')

subplot(1,3,3)
plot(y(:,3),y3(:,3))
title('lynx')
xlabel('Xn')

ylabel('Xn+1')


