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
%linear acceleration
% Parameters
c = 20;    % viscosity
k = 600;     % restoring constant
m = 4.8;      % mass

% Initial conditions
position_0 = 0;
velocity_0 = 2.093;

% Time parameters
dt = 0.001;   % time step
total_time = 1;   % total simulation time
num_steps = total_time / dt;

% Initialize arrays to store results
position = zeros(1, num_steps);
velocity = zeros(1, num_steps);
time = zeros(1, num_steps);

% Set initial conditions
position(1) = position_0;
velocity(1) = velocity_0;
time(1) = 0;

% Numerical integration using Euler method
for i = 2:num_steps
    % Calculate acceleration (F = -cv - kx)
    acceleration = (-c * velocity(i-1) - k * position(i-1)) / m;
    
    % Update velocity and position using Euler method
    velocity(i) = velocity(i-1) + acceleration * dt;
    position(i) = position(i-1) + velocity(i-1) * dt;
    
    % Update time
    time(i) = time(i-1) + dt;
end
plot(time,position);


