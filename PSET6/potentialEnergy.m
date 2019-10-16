%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENERGY SYSTEM
% 
% L(t) = sqrt(1 + x(t)^2)
% E(t) = 0.5*k(L(t) - L0)^2
% E(t) = 0.5*k(sqrt(1 + x(t)^2) - L0)^2
%

function [ energy ] = potentialEnergy(x)
k = 1;
h_0 = 1;
L0 = sqrt(2);

energy = @(x) (0.5.*k(sqrt(h_0.^2 + x.^2) - L0).^2);

end