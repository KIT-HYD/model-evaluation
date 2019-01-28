% 2018/04/24 Uwe Ehret
% plot pdf of Q

load q_host

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
    
% plot the pdf
figure('units','normalized','outerposition',[0 0 0.8 1])
bar(edges_q(1:end-1),pdf,0.9,'histc'); 
xlim([0 150]);
ylim([0 0.3]);
xlabel('Discharge (m³/s)');
ylabel('Probability (-)');
set(gca, 'FontName', 'Liberation Sans','FontSize',32,'FontWeight','bold');
set(gca,'LooseInset',get(gca,'TightInset')); % erase unnnecesary outside whitespace
hold off

curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'output/'];
print ([out_path 'fig_pdf'], '-dpng', '-r600');