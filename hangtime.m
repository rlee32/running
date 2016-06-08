clear; close all; clc;

% Compute improved hangtime with force
% Parameters
M = 77.1107; % kg
Href = 0.01; % reference jump height.
T = (0:1:150) * 4.44; % N

% Derived inputs
tref = sqrt(2*Href/9.8); % jump time to crest.
v0 = 9.8*tref;

gnew = (M*9.8 - T) / M;
t = v0 ./ gnew;

r = t ./ tref;

plot(T / M / 9.8, r);
title('Hang Time Improvement');
xlabel('Thrust / Weight');
ylabel('New Hang Time / No-Thrust Hang Time');




