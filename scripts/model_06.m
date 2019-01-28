% 2017/11/30 Uwe Ehret
% A simple Rainfall-Runoff model: Reads the observed rainfall as input,
% and transforms it to output with a linear reservoir approximation
% p_ebni is rainfall observed at Ebnit [mm/h]. This is the input
% The value of the retention constant was found by manual/visual optimization
% based on model_02, but instead of a simple forward-in-time scheme here we
% use an interative scheme
% dt = 1 h
% precision (input, output, state variables): double

clear all;
close all;
clc;

% load the input data
load p_ebni

% get parameters
len = length(p_ebni);   % length of the data set
epsilon = 0.001;        % iteration cutoff criterion

% hydrological model setup
K = 55;                 % retention constant = mean transit time [h]
qsim = zeros(len,1);    % reservoir discharge [mm/h]
S = 0;                  % initialize the reservoir fill level [mm]

% loop over time
for t = 2 : len
    
    % storage change due to rainfall input  
    S = S + p_ebni(t);           
    
    % First guess for discharge (use S at the beginning of the period dt)
    qsim_old = S / K; 
    
    % settings for the iteration loop
    done_flag = false;
    
    % iteration loop
    while done_flag == false
    
        % storage change if we assume the 1. guess to be valid for the entire period dt
        S_old = S - qsim_old;            

        % Second guess for discharge (use S at the end of the PERIOD dt)
        qsim_new = S_old / K;    

        % compare qsim_old and qsim_new
        if abs((qsim_old - qsim_new) / qsim_old ) < epsilon
            done_flag = true;
        else
            qsim_old = (qsim_old + qsim_new)/2;
        end
        
    end
    
    % After iteration, save the final discharge for the timestep
    qsim(t) = qsim_new;
    S = S - qsim_new;

end

% convert the discharge from [mm/h] into [m³/s]
output_06 = qsim * 31.8888888;

% save the output
save model_06_out output_06
