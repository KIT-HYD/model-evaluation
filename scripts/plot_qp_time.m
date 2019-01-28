% 2018/04/24 Uwe Ehret
% plot QP_vs_time: time series of Q and P

load q_host
load p_ebni
load DatumZeit

figure('units','normalized','outerposition',[0 0 1 0.8])
h1 = axes;
hold on
yyaxis left
plot(DatumZeit, q_host);
xlabel('Time (h)');
ylabel('Discharge (m³/s)');
ylim ([0 150]);
yyaxis right
plot(DatumZeit, p_ebni)
ylabel('Precipitation (mm/h)');
ylim([0 50]);
set(h1, 'Ydir', 'reverse')

set(gca, 'FontName', 'Liberation Sans','FontSize',32,'FontWeight','bold');
set(gca,'LooseInset',get(gca,'TightInset')); % erase unnnecesary outside whitespace
hold off

curr_path = pwd;
out_path = [curr_path(1:find(pwd == '/', 1, 'last')) 'output/'];
print ([out_path 'fig_qp_time'], '-dpng', '-r600');