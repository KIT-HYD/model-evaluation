% 2020/07/08 Uwe Ehret
% A more advanced Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a rainfall-intensity threshold and two
% linear reservoir approximations
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input.
% based on model_02, but rainfall-intensity threshold and second reservoir added
% Paramter values were found by minimizing NSE in the calibration period
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the input data
load ../data/p_ebni_val

% get parameters
len = 43802; % length of the data set

% hydrological model setup
P_threshold = 3.5;      % rainfall intensity threshold [mm/h]. Any rainfall above the threshold will enter the fast linear reservoir
K_fast = 10;            % retention constant of the fast linear reservoir [h]                        
K = 80;                 % retention constant = mean transit time [h]
qsim = zeros(len,1);    % reservoir discharge [mm/h]
S_fast = 0;             % initialize the fast reservoir fill level [mm]
S = 0;                  % initialize the reservoir fill level [mm]

% loop over time
for t = 2 : len
    
    % split rainfall
    if p_ebni_val(t) > P_threshold
        p_fast = p_ebni_val(t) - P_threshold;
        p_rest = P_threshold;
    else
        p_fast = 0;
        p_rest = p_ebni_val(t);
    end
    
    % compute dynamics of the fast linear reservoir
    S_fast = S_fast + p_fast;                   % storage change due to rainfall input
    q_reservoir_fast = S_fast / K_fast;         % discharge as f(storage volume)
    S_fast = S_fast - q_reservoir_fast;         % storage change due to discharge
    
    % compute dynamics of the slow linear reservoir
    S = S + p_rest;             % storage change due to rainfall input
    q_reservoir = S / K;        % discharge as f(storage volume)
    S = S - q_reservoir;        % storage change due to discharge
    
    % add direct runoff and reservoir runoff
    qsim(t) = q_reservoir_fast + q_reservoir;
end

% convert the discharge from [mm/h] into [m³/s]
output_05 = qsim * 31.8888888;

% save the output
save ../data/model_05_out output_05