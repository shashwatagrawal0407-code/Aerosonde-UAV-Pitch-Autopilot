%% Open-Loop Stability Analysis
% Aerosonde UAV Longitudinal Dynamics

clc;
clear;
close all;

%% Load Aircraft Model

run('longitudinal_model.m');

%% Eigenvalue Analysis

eig_values = eig(A);

disp('Open-Loop Eigenvalues:')
disp(eig_values)

%% Stability Check

if all(real(eig_values) < 0)
    disp('Aircraft is dynamically stable.');
else
    disp('Aircraft is dynamically unstable.');
end

%% Pole-Zero Map

figure;

pzmap(sys_long);

title('Open-Loop Pole-Zero Map');
grid on;

%% Step Response

figure;

step(sys_long);

title('Open-Loop Longitudinal Response');
grid on;

%% Initial Condition Response

x0 = [1 0 0 0];

figure;

initial(sys_long, x0);

title('Initial Condition Response');
grid on;