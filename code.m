clc;
clear all;
[t,y] = ode45(@vdp1,[0 1],[2; 0]);
plot(t,y);