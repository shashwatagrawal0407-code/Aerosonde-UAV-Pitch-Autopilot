%% Longitudinal State-Space Model
% Aerosonde UAV
% Longitudinal Flight Dynamics
% Author: Shashwat

clc;
clear;
close all;

%% Load Aircraft Parameters

run('aircraft_parameters.m');

%% Longitudinal Stability Derivatives
% Simplified linearized aerodynamic derivatives

Xu = -0.02;
Xw = 0.10;

Zu = -0.30;
Zw = -2.50;
Zq = -5.00;

Mu = 0.001;
Mw = -0.05;
Mq = -1.20;

%% Elevator Control Derivatives

Xde = 0;
Zde = -0.80;
Mde = -1.50;

%% State Definitions
%
% x = [u w q theta]'
%
% u      -> Forward velocity perturbation [m/s]
% w      -> Vertical velocity perturbation [m/s]
% q      -> Pitch rate [rad/s]
% theta  -> Pitch angle [rad]
%
% Control Input:
%
% delta_e -> Elevator deflection [rad]

%% State-Space Matrices

A = [
    Xu     Xw      0       -g;
    Zu     Zw      U0      0;
    Mu     Mw      Mq      0;
    0      0       1       0
];

B = [
    Xde;
    Zde;
    Mde;
    0
];

%% Output Matrix
% Selecting pitch angle (theta) as system output

C = [0 0 0 1];

D = 0;

%% Create State-Space System

sys_long = ss(A, B, C, D);

disp('Longitudinal state-space model created successfully.');

%% Display System Matrices

disp('A Matrix:')
disp(A)

disp('B Matrix:')
disp(B)

disp('C Matrix:')
disp(C)

disp('D Matrix:')
disp(D)

%% Open-Loop Pole Information

disp('Open-Loop Eigenvalues:')
disp(eig(A))