Xinf(V,A,B) = 1/(1+exp((V+A)/B))

tauX(V,A,B,D,E) = A - B/(1+exp((V+D)/E))

## Sodium currents ##

mNainf(V) = Xinf(V,25.,-5.); tau_mNa(V) = tauX(V,0.75,0.5,100.,-20.)
hNainf(V) = Xinf(V,40.,5.); tau_hNa(V) = tauX(V,4.0,3.5,50.,-20.)#tauX(V,4.0,3.5,50.,-20.)

## Potassium currents #

mKDRinf(V) = Xinf(V,15.,-5.); tau_mKDR(V) = tauX(V,5.0,4.5,30.,-20.)
#mKDRsinf(V) = Xinf(V,35.,-5.); tau_mKDRs(V) = 10*tauX(V,5.0,4.5,30.,-20.) ERG?

mAfastinf(V) = Xinf(V,80,-5.); tau_mAfast(V) = tauX(V,0.75,0.5,100.,-20.)
hAfastinf(V) = Xinf(V,60,5.); tau_hAfast(V) = 10*tauX(V,0.75,0.5,100.,-20.)

mAslowinf(V) = Xinf(V,60,-5.); tau_mAslow(V) = 10*tauX(V,0.75,0.5,100.,-20.)
hAslowinf(V) = Xinf(V,40,5.); tau_hAslow(V) = 100*tauX(V,0.75,0.5,100.,-20.)

mKCainf(Ca) = Xinf(Ca,-30.0,-10.); tau_mKCa = 500.



## Calcium currents ##

mCaLinf(V) = Xinf(V,35.,-5.); tau_mCaL(V) = tauX(V,6.0,5.5,30.,-20.)

mCaTinf(V) = Xinf(V,60,-5.); tau_mCaT(V) = tauX(V,6.0,5.5,30.,-20.)
hCaTinf(V) = Xinf(V,80,5.); tau_hCaT(V) = 30*tauX(V,6.0,5.5,30.,-20.) #100 dans le livre

tau_Ca = 500.

## Cation current ##

mHinf(V) = Xinf(V,85,10.); tau_mH(V) = 50*tauX(V,6.0,5.5,30.,-20.);



# Done
# Na, KDR, CaL, KDRslow (to replace with KCa?), Afast (K_Tst),
# KCa
# Ca
# Test modulation of bursting shape

# Alessio (Type II, Type I, Type II*)
# Aslow => KSlow_S

# Guillaume (rebound spiking, bursting, HIB)
# CaT
# Hf, Hs

# To do
# Afast => K_Tst
# Aslow => KSlow_S
# CaT, Hs, Hus, KCa,
# KIR, CaUS/CAN, NaR
# dCa/dV = (k*(alphaCa*ICaL+betaCa*ICaT) - Ca)/TauCa

# Firing patterns
# Fast spiking, slow spiking, bursting (with modulation of type), rebound spiking, rebound bursting, HIB, wind-up?,
