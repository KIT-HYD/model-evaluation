% 2020/07/08 Uwe Ehret
% A simple Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a linear reservoir approximation
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input.
% based on model_02, but precision changed
% dt = 1 h
% precision (input, output, state variables): integer

clear all;
close all;
clc;

% load the input data
load ../data/p_ebni_int_val

% get parameters
len = 43802; % length of the data set

% hydrological model setup
K = uint8(64);                         % retention constant = mean transit time [h]
qsim = uint8(zeros(len,1));      % reservoir discharge [mm/h]
S = uint8(0);                    % initialize the reservoir fill level [mm]              

% loop over time
for t = 2 : len
    S = S + p_ebni_int_val(t);  % storage change due to rainfall input
    qsim(t) = S / K;            % discharge as f(storage volume)
    S = S - qsim(t);            % storage change due to discharge
end

% convert the discharge from [mm/h] into [m³/s]
output_04 = qsim * 31.8888888;

% save the output
save ../data/model_04_out output_04