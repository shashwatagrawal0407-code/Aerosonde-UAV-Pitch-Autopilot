%% Frequency Domain Analysis
% Aerosonde UAV Pitch Autopilot

clc;
clear;
close all;

%% Load Aircraft Model

run('longitudinal_model.m');

%% PID Controller Parameters

Kp = 1.5;
Ki = 0.2;
Kd = 0.8;

PID = pid(Kp,Ki,Kd);

%% Open-Loop Transfer Function

open_loop_sys = -PID * sys_long;

%% Root Locus

figure;

rlocus(open_loop_sys);

title('Root Locus of Pitch Autopilot');
grid on;

%% Bode Plot

figure;

margin(open_loop_sys);

title('Bode Plot with Stability Margins');
grid on;

%% Gain Margin and Phase Margin

[Gm, Pm, Wcg, Wcp] = margin(open_loop_sys);

disp('Frequency Domain Stability Metrics:')

disp('Gain Margin:')
disp(Gm)

disp('Phase Margin (deg):')
disp(Pm)

disp('Gain Crossover Frequency:')
disp(Wcg)

disp('Phase Crossover Frequency:')
disp(Wcp)