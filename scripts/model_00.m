% 2020/07/08 Uwe Ehret
% The 'almost ignorant' model: We only know mean Q for q_host from the calibration period (4.8646 m³/s) and use this as
% prediction for each time step
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% assign the mean flow
q_host_mean = 4.8646;

% make the prediction for each time step
output_00 = zeros(43802,1) + q_host_mean;

% save the output
save ../data/model_00_out output_00
