% 2019/11/26 Uwe Ehret
% calibration of model_08 (ANN)
% two-layer feed-forward neural network

clear all;
close all;
clc;

% load the input data
load p_ebni

% load the output data
load q_host

% train a set of ANNs
x = p_ebni';
t = q_host';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.

%     performance = NaN(30,1);
%     
%     for num_h_l = 1:30
%         num_h_l
%         
%         % Create a Fitting Network
%         hiddenLayerSize = num_h_l;
%         net = fitnet(hiddenLayerSize,trainFcn);
% 
%         % Setup Division of Data for Training, Validation, Testing
%         net.divideParam.trainRatio = 70/100;
%         net.divideParam.valRatio = 15/100;
%         net.divideParam.testRatio = 15/100;
% 
%         % Train the Network
%         [net,tr] = train(net,x,t);
% 
%         % Test the Network
%         y = net(x);
%         e = gsubtract(t,y);
%         performance(num_h_l) = perform(net,t,y);
% 
%     end
% 
%     plot(performance)

% in the end, a standard 10-neuron model is as good as the others --> use that
% Create a Fitting Network
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize,trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

% Save the Network
curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'data/'];
out_path = [out_path 'ann_model.mat'];
save (out_path, 'net');

