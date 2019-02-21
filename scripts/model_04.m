% 2017/11/30 Uwe Ehret
% A simple Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a linear reservoir approximation
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input
% based on model_02, but precision changed
% dt = 1 h
% precision (input, output, state variables): integer

clear all;
close all;
clc;

% load the input data
load p_ebni_int

% get parameters
len = length(p_ebni_int); % length of the data set

% hydrological model setup
K = 55;                         % retention constant = mean transit time [h]
qsim = int8(zeros(len,1));      % reservoir discharge [mm/h]
S = int8(0);                    % initialize the reservoir fill level [mm]              

% loop over time
for t = 2 : len
    S = S + p_ebni_int(t);          % storage change due to rainfall input
    qsim(t) = S / K;   % discharge as f(storage volume)
    S = S - qsim(t);            % storage change due to discharge
end

% convert the discharge from [mm/h] into [m�/s]
output_04 = qsim * 31.8888888;

% save the output
curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'data/'];
out_path = [out_path 'model_04_out.mat'];
save (out_path, 'output_04');