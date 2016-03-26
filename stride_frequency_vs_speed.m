clear; close all; clc;

% These data are from:
% http://www.arl.army.mil/arlreports/2002/ARL-TR-2764.pdf
speeds1 = [ 1.1, 2.4 ];
freq1 = [ 52, 82 ];
speeds2 = [ 1.7, 3.3 ];
freq2 = [ 80, 89 ];
speeds3 = [ 3, 6, 9 ];
freq3 = [ 81, 96, 128 ];

% This data is from my 8x slowdown estimate of the following video:
% https://www.youtube.com/watch?v=TV_KM8zYFsk
speeds4 = 11.176;
freq4 = 158;

% This data is from (Usain Bolt sprint):
% http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3661886/
speeds5 = [ 11.76, 12.19, 12.19, 12.19, 12.05 ];
freq5 = 60/2 * [ 4.51, 4.63, 4.63, 4.39, 4.22 ];

figure;
plot(speeds1,freq1,'x-');
hold on;
plot(speeds2,freq2,'x-');
plot(speeds3,freq3,'x-');
plot(speeds4,freq4,'x-');
plot(speeds5,freq5,'o');
legend('Walking, Minetti 1994','Running, Minetti 1994', ...
    'Running, Fukunaga 1980', 'Robert Gill (Video)', ...
    'Usain Bolt, Krzysztof 2013');
xlabel('Speed, m / s');
ylabel('Gait cycle frequency, strides / min');