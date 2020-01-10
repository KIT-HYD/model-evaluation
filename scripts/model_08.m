% 2019/11/26 Uwe Ehret
% A simple two-layer feed-forward neural network
% using rainfall as predictor
% The model was identified with 'model_08_calibration.m'
% dt = 1h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the input data
load p_ebni

% load the model
load ann_model

% run the model
output_08 = net(p_ebni');
output_08 = output_08';

% save the output
curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'data/'];
out_path = [out_path 'model_08_out.mat'];
save (out_path, 'output_08');
