function ground_reaction_forces(csvfile, tag)

disp(['Processing ' tag]);

% Read csv data
% M = csvread('collegiate_soccer_player_8mps.csv',1);
M = csvread(csvfile,1);
x = M(:,1); % time
h = M(:,2); % horizontal GRF (HGRF)
v = M(:,3); % vertical GRF

% Compute phyiscal quantities
% momentum
ih = cumtrapz(x,h);
iv = cumtrapz(x,v);
% time-averaged force
ah = ih ./ x;
av = iv ./ x;
% filtered positive-negative HGRF
fplus = h >= -2e-1;
xplus = x(fplus);
hplus = h(fplus);
ihplus = cumtrapz(xplus,hplus);
ahplus = ihplus ./ xplus;
fminus = h <= 2e-1;
xminus = x(fminus);
hminus = h(fminus);
ihminus = cumtrapz(xminus,hminus);
ahminus = ihminus ./ xminus;
% figure;
% plot(x, h, 'x');
% hold on;
% plot(xplus, hplus, '-');
% plot(xminus, hminus, '-');

% plot
figure;
plot( x,h, 'DisplayName','Extracted Horizontal GRF' );
hold on;
plot( x,v, 'DisplayName','Extracted Vertical GRF' );

% % plot momentum
% plot( x,ih, x,iv );
% title('Momentum (Integrated Forces)');
% ylabel('Momentum (kg*m/s)');
% xlabel('Time (s)');

plot( x,ah, 'DisplayName','Time-Averaged Horizontal GRF' );
plot( x,av, 'DisplayName','Time-Averaged Vertical GRF' );

plot( xplus,ahplus, 'DisplayName','Time-Averaged Horizontal GRF, Propulsive' );
plot( xminus,ahminus, 'DisplayName','Time-Averaged Horizontal GRF, Braking' );



title(['Ground Reaction Force (GRF) Analyis (' tag ')']);
ylabel('Force (lb_f)');
xlabel('Time (s)');

legend('show');

display(['Overall Time-Averaged VGRF: ' num2str(av(end)) ' lbf']);
display(['Overall Time-Averaged HGRF: ' num2str(ah(end)) ' lbf']);
display(['Overall Time-Averaged HGRF, Propulsive: ' num2str(ahplus(end)) ' lbf']);
display(['Overall Time-Averaged HGRF, Braking: ' num2str(ahminus(end)) ' lbf']);
display(['Propulsive Ratio: ' num2str(ahplus(end) / av(end))]);


