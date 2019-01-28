% 2018/04/21 Uwe Ehret
% The 'almost ignorant' model: We only know mean Q for q_host (4.5998 m³/s) and use this as
% prediction for each time step
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% assign the mean flow
q_host_mean = 4.5998;

% make the prediction for each time step
output_00 = ones(87650,1) + q_host_mean;

% save the output
save model_00_out output_00


