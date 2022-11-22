gfm1 = -2.0+0.01;
gsp1 = 6.0-0.01;
gsm1 = -4.0+0.01;
gup1 = 5.0-0.01;
dfm1 = 0.0;
dsp1 = 0.5;
dsm1 = -0.5;
dup1 = -0.5;

Iapp1=-1.0;

gfm2 = -2.0-0.01;
gsp2 = 6.0+0.01;
gsm2 = -4.0-0.01;
gup2 = 5.0+0.01;
dfm2 = 0.0;
dsp2 = 0.5;
dsm2 = -0.5;
dup2 = -0.5;

Iapp2=-1.0;

gsyn12=-0.2;
gsyn21=-0.2;

rflx_g = 0.0;
max_torque = 10.0;

out_test=sim("tanhMod");

plot(out_test.tout,out_test.voltages_angle.signals.values(:,1))
hold on
plot(out_test.tout,out_test.voltages_angle.signals.values(:,2))
plot(out_test.tout,out_test.voltages_angle.signals.values(:,3))
