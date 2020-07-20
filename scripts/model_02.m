% 2020/07/08 Uwe Ehret
% A simple Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a linear reservoir approximation
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input.
% The value of the retention constant was found by minimizing NSE in the calibration period
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
K = 64;                 % retention constant = mean transit time [h]
qsim = zeros(len,1);    % reservoir discharge [mm/h]
S = 0;                  % initialize the reservoir fill level [mm]

% loop over time
for t = 2 : len
    S = S + p_ebni_val(t);      % storage change due to rainfall input
    qsim(t) = S / K;            % discharge as f(storage volume)
    S = S - qsim(t);            % storage change due to discharge
end

% convert the discharge from [mm/h] into [m³/s]
output_02 = qsim * 31.8888888;

% save the output
save ../data/model_02_out output_02