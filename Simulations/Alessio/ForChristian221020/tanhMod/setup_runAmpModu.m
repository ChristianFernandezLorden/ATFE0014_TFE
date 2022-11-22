% Actuator neurons
gfm1 = -2.0+0.01; gsp1 = 7.0-0.01; gsm1 = -4.0+0.01; gup1 = 5.0-0.01;
dfm1 = 0.0; dsp1 = 0.5; dsm1 = -0.5; dup1 = -0.5;
Iapp1=-1.05;

gfm2 = -2.0-0.01; gsp2 = 7.0+0.01; gsm2 = -4.0-0.01; gup2 = 5.0+0.01;
dfm2 = 0.0; dsp2 = 0.5; dsm2 = -0.5; dup2 = -0.5;
Iapp2=-0.95;

rflx_g = 0.1; max_torque = 10.0;

% HCO between actuator neurons
gsyn12=-0.2; gsyn21=-0.2;

% Sensory neurons
gfm1s = -2.0+0.01; gsp1s = 4.0-0.01; gsm1s = -1.0+0.01; gup1s = 1.0-0.01;
dfm1s = 0.0; dsp1s = 0.5; dsm1s = -0.5; dup1s = -0.5;
Iapp1s=-0.05;

% Desired amplitude, initial slow conductance and its grow rate
bar_amp = 0.4;
gsm0 = -3.0;
delta_gsm = -0.025;

% Noise intensity
noise_pwr = 0.0;

% Mechanical system parameters
bar_length = 0.3;

out_test=sim("tanhModAmpModu.slx");

close all

figure(1)
plot(out_test.tout,out_test.voltages_angle.signals.values(:,1))
hold on
plot(out_test.tout,out_test.voltages_angle.signals.values(:,2))
plot(out_test.tout,out_test.voltages_angle.signals.values(:,3),'linewidth',3)

figure(2)
plot(out_test.tout,out_test.voltages_angle.signals.values(:,4))

figure(3)
plot(out_test.tout,out_test.voltages_angle.signals.values(:,5))