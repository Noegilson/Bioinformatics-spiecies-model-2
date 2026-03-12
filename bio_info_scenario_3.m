%For scenario 3, the model will be taken keeping approximately the
%same values as in the book. Then parameters will be adjusted 
%to obtain 2 peaks in the period of 200 months. To do so we had to reduce
%b2 which led to an decrease of the lynx predation (increase of lynxes deaths) and later to a larger increase
%since a lot of hares were present.

%This code uses the function plants_hare_lynx.m. To be able to run the
%code, make sure that function file lies in the same folder as this one.

%For this assignment, the book "Modeling Life" by Alan Garfinkel, Jane
%Shevtsov and Yina Guo of 2010 (ISBN 978-3-319-59730-0) was taken as
%reference.

clear
clc
close all

a1 = 5;		%the maximum plant consumption rate by hares is the same as in the textbook
b1 = 3;		%here the value stays the same as in the textbook 
a2 = 0.1;	%the value stays the same as in the textbook 
b2 = 2;		%the value stays the same as in the textbook
d1 =0.4;	%the value stays the same as in the textbook
d2 = 0.01;	%%the value stays the same as in the textbook


X0 = 0.8;	%the initial populations for the 3 species are the same as in the textbook (figure 5.1)
Y0 = 0.2;  
Z0 = 8;   

y0 = [X0 Y0 Z0];
y1 = [X0 Y0+0.01 Z0];

tspan= [0 200];

[t,y] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y0);
[t1,y2] = ode45(@(t,y) plants_hare_lynx(t,y,a1,a2,b1,b2,d1,d2), tspan, y1);

X = y(:,1);
Y = y(:,2);
Z = y(:,3);

%  2D plot to check unpredictanbility or sensitivity to initial values
figure("Name",'unpredictibility proof')
plot(t,y)
hold on
plot(t1,y2)
title('Proof of Sensibility To Initial Values (scenario 3)')
xlabel('Time [months]')
ylabel('Population')
legend('plant','hare', 'lynx','plant2','hare2', 'lynx2','Location','best')

%plant2, lynx2 and hare2 are the names for the population. To show unpredictability, we add a small value of 0.01 to the hare population. 
%After a long timespan, an important deviation can be observed in the population sizes. 
%This proves that a small change in the initial conditions has a large impact. This is a key characteristic of chaotic behavior.

% 3D plot to check periodicity (change timespan to 700)
figure("Name",'Not periodic proof')
plot3(X,Y,Z,'LineWidth',1.5)
grid on

xlabel('Plants (X)')
ylabel('Herbivores / Hares (Y)')
zlabel('Carnivores / Lynx (Z)')

title('Not Periodic ')
view(45,25)

%The plot shows a trajectory which is not closed or periodic. This indicates chaos. We can notice that with a long timespan, 
%the trajectory goes through different regions without returning to the exact same points. It does not follow a single orbit


% Deterministic
y_next = y(2:end,:);
y_now  = y(1:end-1,:);

figure("Name",'deterministic proof')
subplot(1,3,1)
plot(y_now(:,1),y_next(:,1),'.')
title('plant')
xlabel('Xn')
ylabel('Xn+1')

subplot(1,3,2)
plot(y_now(:,2),y_next(:,2),'.')
title('hare')
xlabel('Xn')
ylabel('Xn+1')

subplot(1,3,3)
plot(y_now(:,3),y_next(:,3),'.')
title('lynx')
xlabel('Xn')

ylabel('Xn+1')

%The data follows a smooth line rather than scattered points, indicating that the system 
%evolves according to fixed equations rather than random processes. So we can conclude 
%that it is deterministic.




