%BEGGINING
clear clc;
%frequency, revolutions per second
rpm = 3000;
f = rpm/60;
%angular velocity
w = 2*pi*f;
%input
fprintf("Enter radius: ");
r = input('');
fprintf("\n");
fprintf("Enter length: ");
l = input('');
fprintf("\n");
lambda = r/l;
%step
d = 5;
alpha_min = 0-2*d;
alpha_max = 360+2*d;
n = (alpha_max-alpha_min)/d;
alpha_min = deg2rad(alpha_min);
alpha_max = deg2rad(alpha_max);
d = deg2rad(d);
%time, velocity, acceleration, distance ang angle matrices
t = zeros(n+1, 1);
v = zeros(n+1, 1);
v2 = zeros(n+1, 1);
a = zeros(n+1, 1);
y = zeros(n+1, 1);
alpha = zeros(n+1, 1);
%time and angle
for i = 1:n+1
alpha(i) = alpha_min+(i-1)*d;
t(i) = alpha(i)/w;
end
for i = 1:n+1
y(i) = r*(cos(w*t(i))+sqrt(1-(lambda^2)*sin(w*t(i))^2)/(lambda));
end
%numerical derrivatives
for i = 2:n
v(i) = (y(i+1)-y(i-1))/((t(i+1)-t(i-1)));
end
for i = 3:n-1
a(i) = (v(i+1)-v(i-1))/((t(i+1)-t(i-1)));
end
for i = 1:n+1
alpha(i) = rad2deg(alpha(i));
end
vmax = max(abs(v));
fprintf('The maximum velocity = %0.8f [m/s]\n', vmax);
amax = max(abs(a));
fprintf('The maximum acceleration = %0.012f [m/s^2]\n', amax);
yyaxis left;
plot(alpha, a, 'blue');
title('Plot_1');
ylabel('acceleration, m/s^2');
yyaxis right;
plot(alpha, v, 'red');
ylabel('velocity, m/s');
xlabel('alpha, degrees');
xticks(0:30:360);
xlim([0 360]);
grid off
%END