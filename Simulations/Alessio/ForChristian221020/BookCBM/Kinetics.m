Vvec = -120:0.01:40;
Cavec = 0:0.01:500;
mNa_vec = mNainf(Vvec);
tau_mNa_vec = tau_mNa(Vvec);
hNa_vec = hNainf(Vvec);
tau_hNa_vec = tau_hNa(Vvec);
mKd_vec = mKdinf(Vvec);
tau_mKd_vec = tau_mKd(Vvec);
mAf_vec = mAfinf(Vvec);
tau_mAf_vec = tau_mAf(Vvec);
hAf_vec = hAfinf(Vvec);
tau_hAf_vec = tau_hAf(Vvec);
mAs_vec = mAsinf(Vvec);
tau_mAs_vec = tau_mAs(Vvec);
hAs_vec = hAsinf(Vvec);
tau_hAs_vec = tau_hAs(Vvec);
mKCa_vec = mKCainf(Cavec);
tau_mKCa_vec = tau_mKCa();
mCaL_vec = mCaLinf(Vvec);
tau_mCaL_vec = tau_mCaL(Vvec);
mCaT_vec = mCaTinf(Vvec);
tau_mCaT_vec = tau_mCaT(Vvec);
hCaT_vec = hCaTinf(Vvec);
tau_hCaT_vec = tau_hCaT(Vvec);
mH_vec = mHinf(Vvec);
tau_mH_vec = tau_mH(Vvec);
tau_Ca_vec = tau_Ca();

figure
plot(Vvec,mNa_vec,Vvec,hNa_vec,...
    Vvec,mKd_vec,Vvec,mAf_vec,Vvec,hAf_vec,Vvec,mAs_vec,Vvec,hAs_vec,...
    Vvec,mCaL_vec,Vvec,mCaT_vec,Vvec,hCaT_vec,Vvec,mH_vec)

figure
plot(Cavec,mKCa_vec)


% Model gating functions
% All activation and inactivation curves are defined by the Boltzman function

function out = Xinf(V,A,B)
    out = 1.0 ./ (1+exp((V+A)/B));
end

% All timeconstant curves are defined by the shifted Boltzman function

function out = tauX(V,A,B,D,E)
    out = A-B./(1+exp((V+D)/E));
end

% Sodium current

function out = mNainf(V)
    out = Xinf(V,25.0,-5.0);
end

function out = tau_mNa(V)
    out = tauX(V,0.75,0.5,100.,-20.);
end

function out = hNainf(V)
    out = Xinf(V,40.,10.);
end

function out = tau_hNa(V)
    out = tauX(V,4.0,3.5,50.,-20.);
end

% Potassium currents

function out = mKdinf(V)
    out = Xinf(V,15.,-10.);
end

function out = tau_mKd(V)
    out = tauX(V,5.0,4.5,30.,-20.);
end

function out = mAfinf(V)
    out = Xinf(V,80,-10.);
end

function out = tau_mAf(V)
    out = tauX(V,0.75,0.5,100.,-20.);
end

function out = hAfinf(V)
    out = Xinf(V,60,5.);
end

function out = tau_hAf(V)
    out = 10*tauX(V,0.75,0.5,100.,-20.);
end

function out = mAsinf(V)
    out = Xinf(V,60,-10.);
end

function out = tau_mAs(V)
    out = 10*tauX(V,0.75,0.5,100.,-20.);
end

function out = hAsinf(V)
    out = Xinf(V,20,5.);
end

function out = tau_hAs(V)
    out = 100*tauX(V,0.75,0.5,100.,-20.);
end

function out = mKCainf(Ca)
    out = Xinf(Ca,-30.0,-10.);
end

function out = tau_mKCa()

    out = 500.0;
end

% # Calcium currents

function out = mCaLinf(V)
    out = Xinf(V,45.,-5.);
end

function out = tau_mCaL(V)
    out = tauX(V,6.0,5.5,30.,-20.);
end

function out = mCaTinf(V)
    out = Xinf(V,60,-5.);
end

function out = tau_mCaT(V)
    out = tauX(V,6.0,5.5,30.,-20.);
end

function out = hCaTinf(V)
    out = Xinf(V,85,10.);
end

function out = tau_hCaT(V)
    out = 100*tauX(V,6.0,5.5,30.,-20.);
end

% # Cation current (H-current)

function out = mHinf(V)
    out = Xinf(V,85,10.);
end

function out = tau_mH(V)
    out = 50*tauX(V,6.0,5.5,30.,-20.);
end

function out = tau_Ca()

    out = 500.0;
end