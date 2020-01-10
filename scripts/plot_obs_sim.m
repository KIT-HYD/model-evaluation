% 2018/04/24 Uwe Ehret
% plot observation and all simulations

load q_host
load DatumZeit
load model_00_out
load model_01_out
load model_02_out
load model_03_out
load model_04_out
load model_05_out
load model_06_out

figure('units','normalized','outerposition',[0 0 0.8 1])
hold on
plot(DatumZeit(29401:29617),q_host(29401:29617),'LineWidth',8,'color',[cp{1,:}]);
plot(DatumZeit(29401:29617),output_00(29401:29617),'LineWidth',4,'color',[cp{3,:}]);
plot(DatumZeit(29401:29617),output_01(29401:29617),'LineStyle','--','LineWidth',4,'color',[cp{11,:}]);
plot(DatumZeit(29401:29617),output_02(29401:29617),'LineWidth',8,'color',[cp{4,:}]);
plot(DatumZeit(29401:29617),output_03(29401:29617),'LineStyle','--','LineWidth',6,'color',[cp{5,:}]);
plot(DatumZeit(29401:29617),output_04(29401:29617),'LineWidth',4,'color',[cp{9,:}]);
plot(DatumZeit(29401:29617),output_05(29401:29617),'LineWidth',4,'color',[cp{2,:}]);
plot(DatumZeit(29401:29617),output_06(29401:29617),'LineStyle',':','LineWidth',4,'color',[cp{12,:}]);

h = legend('Observation', 'Model-00', 'Model-01', 'Model-02', 'Model-03', 'Model-04', 'Model-05', 'Model-06');
set(h,'Location','northeast');
legend boxoff
xlim([DatumZeit(29401) DatumZeit(29617)]);
ylim([0 130]);
xlabel('Time (10-19 May 1999)');
ylabel('Discharge (m³/s)');
datetick('x','dd','keepticks')
set(gca, 'FontName', 'Liberation Sans','FontSize',32,'FontWeight','bold')
set(gca,'LooseInset',get(gca,'TightInset')); % erase unnnecesary outside whitespace
hold off

curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'output/'];
print ([out_path 'fig_obs_sim'], '-dsvg', '-r600');
