%% Aerosonde UAV Parameters
% Longitudinal Flight Dynamics Project
% Author: Your Name
% Description:
% Centralized aircraft and flight condition parameters
% for longitudinal stability analysis

clc;

%% Physical Constants

g = 9.81;                 % Gravity [m/s^2]
rho = 1.225;              % Air density at sea level [kg/m^3]

%% Aircraft Geometry

mass = 13.5;              % Aircraft mass [kg]
S_ref = 0.55;             % Wing reference area [m^2]
c_bar = 0.19;             % Mean aerodynamic chord [m]

%% Trim Flight Condition

U0 = 20;                  % Trim airspeed [m/s]

%% Aerodynamic Stability Derivatives

CL_alpha = 3.5;
CD_alpha = 0.03;
Cm_alpha = -0.38;

CL_q = 2.8;
Cm_q = -3.6;

CL_delta_e = 0.36;
Cm_delta_e = -0.5;

%% Engineering Assumptions

% Assumptions:
% 1. Small perturbation theory
% 2. Symmetric flight
% 3. Constant trim velocity
% 4. Linearized longitudinal dynamics
% 5. Rigid-body aircraft model

disp('Aircraft parameters loaded successfully.');