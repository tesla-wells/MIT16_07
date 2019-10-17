clear all;
close all;
clc;

%Constants
k = 1;
h_0 = 1;
L0 = sqrt(2);
m = 1;

%Potential Energy in the spring
energy = @(x) (k.*(sqrt(h_0.^2 + x.^2) - L0).^2 ./2);

%Part a
figure('Name', 'Energy vs x of cart')
hold on
fplot(energy, [-2 2])
xlabel('X location')
ylabel('Energy stored in spring')
title ('Energy vs x of cart')
hold off


%Part b
horizForce = @(x) (-x.*(k.*(sqrt(h_0.^2 + x.^2) - L0)./(sqrt(h_0.^2 + x.^2))));

figure('Name', 'Effective Force')
hold on
fplot(horizForce, [-2 2])
xlabel('X location')
ylabel('Horizontal Force')
title ('Effective Force')
hold off

%Initial Values for for loop
potential_x_0 = [-2 -1.7 -1.3 -.5 -.2 -.001 0.001 0.2 0.5 1.3 1.7 2];
v_0 = 0;


%Setting up the figures so I don't have to do it multiple times in the for
%loop

figure(3)
hold on
xlabel('Time')
ylabel('Distance')
title ('Position of mass with different starting conditions')
hold off

figure(4)
hold on
xlabel('Distance')
ylabel('Velocity')
title('Phase diagrams')
hold off

figure(5)
hold on
xlabel('Time')
ylabel('Total Energy')
title('Time vs Energy')

for n=1 : length(potential_x_0)
    x_0 = [potential_x_0(n);v_0];

    [t, x_vec] = ode45(@(t, x_v) springSystem(t, x_v, m, k, h_0, L0, 0), [0 50], x_0);

    %part d
    figure(3)
    hold on
    plot(t, x_vec(:,1))
    hold off

    %part e
    figure(4)
    hold on
    plot(x_vec(:,1), x_vec(:,2))
    hold off
    
    %part f
    
    kinetic_energy = x_vec(:,2).^2*0.5*m;
    potential_energy = (k.*(sqrt(h_0.^2 + x_vec(:,1).^2) - L0).^2 ./2);
    
    figure(5)
    hold on    
    plot(t, kinetic_energy + potential_energy)
    hold off
    
end

%part g

xd_01 = [1.62, 0];
xd_02 = [1.63, 0];

[td1, xd1_vec] = ode45(@(t, x_v) springSystem(t, x_v, m, k, h_0, L0, .01), [0 50], xd_01);
[td2, xd2_vec] = ode45(@(t, x_v) springSystem(t, x_v, m, k, h_0, L0, .01), [0 50], xd_02);

plot




