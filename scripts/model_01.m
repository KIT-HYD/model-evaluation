% 2017/11/30 Uwe Ehret
% The 'perfect' model: Reads the observed output as input,
% and just copies the input to the output
% Q_host is the discharge [m�/s] observed at gauge Hoher Steg. This is the target
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
curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'data/'];
out_path = [out_path 'model_01_out.mat'];
save (out_path, 'output_01');