%% Ferguson Curve in 3D

clear all; close all; clc
%% by matrices (using Loop) [discrete]
theta_0=pi/4;theta_1=pi/4; theta_2=pi/4; alpha=5;
r0=[0 0 0];
r1=[2 0 0];
t0=[alpha*cos(theta_0) alpha*sin(theta_0) 0];
t1=[alpha*cos(theta_1) alpha*cos(theta_1) 1];
Sum_Ud=[];

for ud=0:0.01:1;
    Ud = [1 ud ud^2 ud^3];
    Sum_Ud=cat(1,Sum_Ud,Ud);
end

C=[1 0 0 0; 0 0 1 0;-3 3 -2 -1;2 -2 1 1];
S=[r0; r1; t0; t1];

R = Sum_Ud*C*S;
%Plot
figure(1)
plot3(R(:,1),R(:,2),R(:,3),'o')
hold on
grid on

%% by matrices (using syms) [analytic]
syms u
theta_0=pi/4;theta_1=pi/4; alpha=5;
r0=[0 0 0];
r1=[2 0 0];
t0=[alpha*cos(theta_0) alpha*sin(theta_0) 0];
t1=[alpha*cos(theta_1) alpha*cos(theta_1) 1];
U = [1 u u^2 u^3];

C=[1 0 0 0; 0 0 1 0;-3 3 -2 -1;2 -2 1 1];
S=[r0; r1; t0; t1];

R = U*C*S;
%Plot
figure(1)
ezplot3(R(1),R(2),R(3),[0 1])
hold on
grid on