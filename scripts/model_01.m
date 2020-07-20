% 2020/07/08 Uwe Ehret
% The 'perfect' model: Reads the observed output as input,
% and just copies the input to the output
% Q_host is the discharge [m³/s] observed at gauge Hoher Steg. This is the target
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the observed Q data
load ../data/q_host_val

% copy the input ('q_host') to the output ('output')
output_01 = q_host_val;

% save the output
save ../data/model_01_out output_01