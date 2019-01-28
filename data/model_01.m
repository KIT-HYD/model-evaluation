% 2017/11/30 Uwe Ehret
% The 'perfect' model: Reads the observed output as input,
% and just copies the input to the output
% Q_host is the discharge [m³/s] observed at gauge Hoher Steg. This is the target
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the observed Q data
load q_host

% copy the input ('q_host') to the output ('output')
output_01 = q_host;

% save the output
save model_01_out output_01


