function [ KLD ] =f_kld_anyd(pdf,pdf_star)
% returns Kullback-Leibler divergence between two discrete distributions of any dimensionality. 
% Note 
% - it is non-symmetrical!
% - based on http://www.mathworks.com/matlabcentral/fileexchange/13089-kldiv/content/kldiv.m, version 18.10.2013
% Input
% - pdf: x-dimensional discrete (binned) pdf normalized to sum=1 representing the reference distribution (the 'truth')
% - pdf_star: x-dimensional discrete (binned) pdf normalized to sum=1  representing the other distribution (the 'estimate')
%   Note
%   - pdf and pdf_star must have the same dimensionsionalty (number of dimensions and number of bins along each dimension)
%   - The elements of pdf and pdf_star must each sum to 1 +/- .00001.
%   - In pdf, zero values are allowed (divergence in this case will be 0)
%   - In pdf_star 
%     - zero values are allowed where pdf is also zero (divergence in this case will be 0)
%     - zero values where pdf is NOT zero throw an error (divergence in this case would be infinite)
% Output
% - KLD: [1,1] Kullback-Leibler-divergence in [bit]
% Version
% - 2018/07/23 Uwe Ehret: 
%   - handle any-dimensional pdfs (before only 1-d)
%   - changed function name from f_kld to f_kld_anyd
% - 2017/10/24 Uwe Ehret: handle the case of NaN's in the input
% - 2016/06/24 Uwe Ehret: intial version

% check input
    % check if there are NaNs in 'pdf'
    if ~isempty(find(isnan(pdf)))
        KLD = NaN;
        return;
    end

    % check if there are NaNs in 'pdf_star'
    if ~isempty(find(isnan(pdf_star)))
        KLD = NaN;
        return;
    end

    % check for equal input dimensions
    if ~isequal(size(pdf),size(pdf_star))
        error('All inputs must have same dimension.')
    end

    % check probabilities in 'pdf' sum to 1
    if abs(sum(pdf(:)) - 1) > .00001
        error('Probablities in pdf dont sum to 1.')
    end

    % check probabilities in 'pdf_star' sum to 1
    if abs(sum(pdf_star(:)) - 1) > .00001
        error('Probablities in pdf_star dont sum to 1.')
    end

    % check for zero values in pdf_star where pdf is non-zero
    if ~isempty(intersect(find(pdf_star == 0), find(pdf ~= 0)))
        % UE 30.7.2018
        KLD = Inf; 
        return;
        % UE 30.7.2018
        error('there are zero probabilities in pdf_star where pdf is non-zero');
    end

% initialize the output variable
KLD = 0;

% loop over all bins
% - Note 'numel' returns the overall number of elements across all dimensions,
%   and by using a single index we use linear indexing to access all bins
for i = 1 : numel(pdf)
    if pdf(i) == 0 
        KLD = KLD;
    else
        KLD = KLD + ((log2(pdf(i)) - log2(pdf_star(i)))*pdf(i));
    end 
end

end
