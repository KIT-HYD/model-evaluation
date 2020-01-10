% 2018/04/24 Uwe Ehret
% plot bit invested vs. information missing

% order:
% - model-00: mean
% - model-01: perfect
% - model-02: lin res   1h      double
% - model-03: lin res   1min    double
% - model-04: lin res   1h      integer
% - model-05: 2 linres  1h      double
% - model-06: lin res iterative     1h  double

% byte invested, from results of strace available at "strace/logs/avg_read.log"
% unit: byte
avreID = fopen('avg_read.log','r');
texs = textscan(avreID, '%s %s %s %s %.0f %s');
fclose(avreID);
byte_invested = transpose(texs{1, 5});
% convert to bit
bit_invested = byte_invested * 8;
% convert to bit per timestep
num_ts = 87650; % length of the observed and simulated time series
bit_invested_per_ts = bit_invested / num_ts;

% Conditional Entropy of target given the model output (=missing info to the
% truth), from evaluate_model_output.m in bit saved at "data/cond_ent.mat"
load cond_ent.mat;

labels = {'M-00' 'M-01' 'M-02' 'M-03' 'M-04' 'M-05' 'M-06'}; 

figure('units','normalized','outerposition',[0 0 0.8 1])
% axes('Position',[0.07 0.09 0.52 0.8]); % [left bottom width height]
hold on
scatter(h_cond(1),bit_invested_per_ts(1),80, 'v', 'filled', 'MarkerFaceColor',[cp{3,:}]);
scatter(h_cond(2),bit_invested_per_ts(2),80, '>', 'filled', 'MarkerFaceColor',[cp{11,:}]);
scatter(h_cond(3),bit_invested_per_ts(3),80, 'v', 'filled', 'MarkerFaceColor',[cp{4,:}]);
scatter(h_cond(4),bit_invested_per_ts(4),80, '>', 'filled', 'MarkerFaceColor',[cp{5,:}]);
scatter(h_cond(5),bit_invested_per_ts(5),80, '^', 'filled', 'MarkerFaceColor',[cp{9,:}]);
scatter(h_cond(6),bit_invested_per_ts(6),80, '<', 'filled', 'MarkerFaceColor',[cp{2,:}]);
scatter(h_cond(7),bit_invested_per_ts(7),80, '^', 'filled', 'MarkerFaceColor',[cp{12,:}]);

labelpoints(h_cond(1),bit_invested_per_ts(1),labels(1), 'SE', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{3,:}]);
labelpoints(h_cond(2),bit_invested_per_ts(2),labels(2), 'E', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{11,:}]);
labelpoints(h_cond(3),bit_invested_per_ts(3),labels(3), 'S', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{4,:}]);
labelpoints(h_cond(4),bit_invested_per_ts(4),labels(4), 'E', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{5,:}]);
labelpoints(h_cond(5),bit_invested_per_ts(5),labels(5), 'NE', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{9,:}]);
labelpoints(h_cond(6),bit_invested_per_ts(6),labels(6), 'W', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{2,:}]);
labelpoints(h_cond(7),bit_invested_per_ts(7),labels(7), 'N', 0.2, 'FontSize',32,'FontWeight','bold', 'Color', [cp{12,:}]);

X = [log2(151), log2(151)];
Y = [0, 4000];
plot(X,Y, 'LineWidth',2, 'Color', rgb('black'));
labelpoints(7.4,2000, 'Max information lost', 'NE', 'FontSize',32,'FontWeight','bold', 'Color', rgb('black'), 'rotation',90);

xlim([0 8]);
ylim([0 4000]);
xlabel('H(target|model) = Information lost per timestep (bit)');
ylabel('Data invested per timestep (bit)');
set(gca, 'FontName', 'Liberation Sans','FontSize',32,'FontWeight','bold');
set(gca,'LooseInset',get(gca,'TightInset')); % erase unnnecesary outside whitespace

rectangle('Position', [2.1 450 2.1 650], 'EdgeColor','k', 'LineWidth', 1);

hold off

curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'output/'];
print ([out_path 'fig_bit_by_bit_'], '-dsvg', '-r600');

% create zoom-in plot
figure('units','normalized','outerposition',[0 0 0.6 0.8])
% axes('Position',[.68 .3 .3 .4]); % [left bottom width height]
box on;
hold on;
scatter(h_cond(1),bit_invested_per_ts(1),80, 'v', 'filled', 'MarkerFaceColor',[cp{3,:}]);
scatter(h_cond(3),bit_invested_per_ts(3),80, 'v', 'filled', 'MarkerFaceColor',[cp{4,:}]);
%scatter(h_cond(4),bit_invested_per_ts(4),80, '>', 'filled', 'MarkerFaceColor',[cp{5,:}]);
scatter(h_cond(5),bit_invested_per_ts(5),80, '^', 'filled', 'MarkerFaceColor',[cp{9,:}]);
scatter(h_cond(6),bit_invested_per_ts(6),80, '<', 'filled', 'MarkerFaceColor',[cp{2,:}]);
scatter(h_cond(7),bit_invested_per_ts(7),80, '^', 'filled', 'MarkerFaceColor',[cp{12,:}]);

labelpoints(h_cond(1),bit_invested_per_ts(1),labels(1), 'SE', 0.01, 'FontSize',32,'FontWeight','bold', 'Color', [cp{3,:}]);
labelpoints(h_cond(3),bit_invested_per_ts(3),labels(3), 'S', 0.01, 'FontSize',32,'FontWeight','bold', 'Color', [cp{4,:}]);
%labelpoints(h_cond(4),bit_invested_per_ts(4),labels(4), 'E', 0.01, 'FontSize',32,'FontWeight','bold', 'Color', [cp{5,:}]);
labelpoints(h_cond(5),bit_invested_per_ts(5),labels(5), 'NE', 0.01, 'FontSize',32,'FontWeight','bold', 'Color', [cp{9,:}]);
labelpoints(h_cond(6),bit_invested_per_ts(6),labels(6), 'W', 0.3, 'FontSize',32,'FontWeight','bold', 'Color', [cp{2,:}]);
labelpoints(h_cond(7),bit_invested_per_ts(7),labels(7), 'N', 0.01, 'FontSize',32,'FontWeight','bold', 'Color', [cp{12,:}]);

xlim([2.5 4]);
ylim([700 780]);
% yticks(1.5:0.1:2.5);
xlabel('Information lost (bit)');
ylabel('Data invested (bit)');
set(gca, 'FontName', 'Liberation Sans','FontSize',32,'FontWeight','bold');
set(gca,'LooseInset',get(gca,'TightInset')); % erase unnnecesary outside whitespace

print ([out_path 'fig_bit_by_bit_sub_'], '-dsvg', '-r600');
