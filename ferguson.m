%% Ferguson Curve

clear all; close all; clc
%% by eqtns [discrete]
ud=[0:0.01:1];
% Value
theta_0=pi/4;theta_1=pi/4; alpha=5;
x_0=0; y_0=0; x_1=2 ;y_1=0; 
u_0=alpha*cos(theta_0);u_1=alpha*cos(theta_1);v_0=alpha*sin(theta_0); v_1=alpha*sin(theta_1);
% Equation
x=x_0+u_0*ud+(3*(x_1-x_0)-2*u_0-u_1)*ud.^2+(2*(x_0-x_1)+u_0+u_1)*ud.^3;
y=y_0+v_0*ud+(3*(y_1-y_0)-2*v_0-v_1)*ud.^2+(2*(y_0-y_1)+v_0+v_1)*ud.^3;
% Plot
figure(1)
plot(x,y,'*')
hold on
grid on

%% by matrices (using Loop) [discrete]
theta_0=pi/4;theta_1=pi/4; alpha=5;
r0=[0 0];
r1=[2 0];
t0=[alpha*cos(theta_0) alpha*sin(theta_0)];
t1=[alpha*cos(theta_1) alpha*cos(theta_1)];
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
plot(R(:,1),R(:,2),'o')
hold on
grid on

%% by matrices (using syms) [analytic]
syms u
theta_0=pi/4;theta_1=pi/4; alpha=5;
r0=[0 0];
r1=[2 0];
t0=[alpha*cos(theta_0) alpha*sin(theta_0)];
t1=[alpha*cos(theta_1) alpha*cos(theta_1)];
U = [1 u u^2 u^3];

C=[1 0 0 0; 0 0 1 0;-3 3 -2 -1;2 -2 1 1];
S=[r0; r1; t0; t1];

R = U*C*S;
%Plot
figure(1)
ezplot(R(1),R(2),[0 1])
hold on
grid on