function [dxdt] = springSystem(t, x_vec, m, k, h_0, L0, d)
    % Pull out the x_vec values %
    x = x_vec(1);
    xdot = x_vec(2);

    
    xddot = ((-x.*(k.*(sqrt(h_0.^2 + x.^2) - L0)./(sqrt(h_0.^2 + x.^2)))) + d*xdot)/m;
    
    %recombine them%
    dxdt = zeros(2, 1);
    
    dxdt(1) = xdot;
    dxdt(2) = xddot;

end