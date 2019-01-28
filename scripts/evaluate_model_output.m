% 2017/11/30 Uwe Ehret
% Script to evaluate the output of various models against the observation

%% preparations

% load observed data
load q_host

% get length of data series
len_data = length(q_host);

% define binning for q

    % choose outermost bin centers and binwidth
    center_left = 0; % center of leftmost bin
    center_right = 150; % center of rightmost bin
    binwidth = 1; % binwidth

    % compute bin edges
    mini = center_left-0.5*binwidth;   % leftmost bin edge
    maxi = center_right+0.5*binwidth;   % rightmost bin edge
    numbins = 1+(center_right-center_left)/binwidth;   % number of bins
    edges_q = linspace(mini,maxi,numbins+1);
    
    % compute the pdf
    [pdf,edges_q] = histcounts(q_host,edges_q,'Normalization', 'probability');

    % check probabilities sum to 1
    if abs(sum(pdf) - 1) > .00001
        error('Probablities dont sum to 1.')
    end
    
    % plot the pdf
    figure;
    bar(edges_q(1:end-1),pdf,0.9,'histc');
    
% compute H(q_obs)
H_obs = f_entropy(pdf);

% general settings
num_rep = 1;  
sample_sizes = len_data;
samplingstrategy = 'continuous';
num_sasi = length(sample_sizes); 

% model 00
load model_00_out
output = output_00;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_00, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_01_out
output = output_01;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_01, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_02_out
output = output_02;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_02, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_03_out
output = output_03;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_03, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_04_out
output = output_04;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_04, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_05_out
output = output_05;
output(output>150) = 150; % to get rid of output that exceeds the edge limits
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_05, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

load model_06_out
output = output_06;
data = [q_host output];
edges = cell(1,2);
edges{1} = edges_q;
edges{2} = edges_q;
[data_binned, data_histcounts] = f_histcounts_anyd(data, edges);
[~, ~, ~, H_xgy_06, ~, ~] = f_infomeasures_from_samples(data, edges, data_binned, data_histcounts, sample_sizes, num_rep, samplingstrategy);

% compute 'bits' to knowledge (# of binary questions away from knowledge)
btk_00 = H_xgy_00 * len_data;
btk_01 = H_xgy_01 * len_data;
btk_02 = H_xgy_02 * len_data;
btk_03 = H_xgy_03 * len_data;
btk_04 = H_xgy_04 * len_data;
btk_05 = H_xgy_05 * len_data;
btk_06 = H_xgy_06 * len_data;




