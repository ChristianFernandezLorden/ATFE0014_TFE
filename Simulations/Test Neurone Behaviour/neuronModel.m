function du = neuronModel(t, u, p, Iapp)
    du = zeros(4, 1);

    Ifm = p(1)*(tanh(u(2) - p(5)) - tanh(p(9) - p(5)));
    Isp = p(2)*(tanh(u(3) - p(6)) - tanh(p(9) - p(6)));
    Ism = p(3)*(tanh(u(3) - p(7)) - tanh(p(9) - p(7)));
    Iup = p(4)*(tanh(u(4) - p(8)) - tanh(p(9) - p(8)));

    du(1) = (Iapp(t) + p(9) - Ifm - Isp - Ism - Iup - u(1))*p(10); 
    du(2) = (u(1) - u(2))*p(11);
    du(3) = (u(1) - u(3))*p(12);
    du(4) = (u(1) - u(4))*p(13);
end