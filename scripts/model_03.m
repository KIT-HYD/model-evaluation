% 2020/07/08 Uwe Ehret
% A simple Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a linear reservoir approximation
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input.
% based on model_02, but dt changed
% dt = 1 min
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the input data
load ../data/p_ebni_min_val

% get parameters
len = 43802*60; % length of the data set

% hydrological model setup
K = 64*60;              % retention constant = mean transit time [min]
qsim = zeros(len,1);    % reservoir discharge [mm/min]
S = 0;                  % initialize the reservoir fill level [mm]

% loop over time
for t = 2 : len
    S = S + p_ebni_min_val(t);  % storage change due to rainfall input
    qsim(t) = S / K;            % discharge as f(storage volume)
    S = S - qsim(t);            % storage change due to discharge
end

% convert qsim from 1-min to 1-h resolution: sum up 60 1-m values to a 1-h value
dummy = filter(ones(60, 1), 1, qsim);
qsim = dummy(60:60:end);

% convert the discharge from [mm/h] into [m³/s]
output_03 = qsim * 31.8888888;

% save the output
save ../data/model_03_out output_03