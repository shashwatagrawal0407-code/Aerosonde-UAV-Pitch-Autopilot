%% Closed-Loop Performance Analysis
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

%% Create PID Controller

controller = pid(Kp, Ki, Kd);

%% Closed-Loop System

sys_cl = feedback(-controller * sys_long, 1);

%% Step Response Analysis

figure;
step(sys_cl);

title('Closed-Loop Pitch Response');
grid on;

%% Performance Metrics

info = stepinfo(sys_cl);

disp('Closed-Loop Performance Metrics:')
disp(info)

%% Steady-State Value

[y,t] = step(sys_cl);

steady_state_value = y(end);

disp('Steady-State Pitch Angle:')
disp(steady_state_value)