clc;
clear all;
m = 4.8;
c = 20;
k = 600;
hold on;
[t,y] = ode45(@vdp1,[0 1],[0; 2.093]);
plot(t,y(:,1));
%euler method
n = 1000;
t = linspace(0,1,n);
x(1) = 0;
dx_0 = 2.093;
dt = t(2)-t(1);
x(2) = x(1) + dx_0*dt;

for i = 1:n-2
    x(i+2) = (x(i+1)*(2*m/dt^2+c/dt-k)-x(i)*(m/dt^2))/(m/dt^2+c/dt);
end 
plot(t,x);

