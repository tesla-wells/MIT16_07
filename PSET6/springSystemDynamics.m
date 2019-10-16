clear all;
close all;
clc;

k = 1;
h_0 = 1;
L0 = sqrt(2);

energy = @(x) (k.*(sqrt(h_0.^2 + x.^2) - L0).^2 ./2);

hold on
fplot(energy, [-2 2])
xlabel('X location')
ylabel('Energy stored in spring')
title ('Energy vs x of cart')
hold off

horizForce = @(x) (k.*(sqrt(h_0.^2 + x.^2) - L0));

fplot(horizForce, [-2 2])