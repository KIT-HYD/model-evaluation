% 2019/11/26 Uwe Ehret
% A simple 3d-order Autoregressive model for runoff prediction:
% Using the past 3 observations, it predicts one step ahead
% The AR-coefficients were found via solving the Yule-Walker equations
% (see model_07_calibration.m). From the various-order model tested, the
% AR-3 model was the best tradeoff between goodness-of-fit (MSE) and number
% of coefficients required.
% dt = 1h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the input data
load q_host

% get parameters
len = length(q_host);   % length of the data set

% model setup
% coefficients were found with the Matlab Econometric Modeler Toolbox
% as AR-3 model with constant. The model is stored in 'ar_model.mat'
% AR-models of various orders were tested: Until order 3 errors still
% decreased, then leveled off --> order 3 was chosen
c = 0.0549;         % constant
ar_1 = 1.9266;      % AR-coefficient for lag-1
ar_2 = -1.2071;     % AR-coefficient for lag-2
ar_3 = 0.2685;      % AR-coefficient for lag-3

% initialize variables
output_07 = zeros(len,1);    % reservoir discharge [m³/s]

% loop over time
for t = 4 : len
    output_07(t) = c + ar_1*q_host(t-1) + ar_2*q_host(t-2) + ar_3*q_host(t-3);
end

% save the output
curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'data/'];
out_path = [out_path 'model_07_out.mat'];
save (out_path, 'output_07');




