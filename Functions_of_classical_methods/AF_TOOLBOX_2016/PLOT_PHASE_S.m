	function PLOT_PHASE_S(w_axis, Phase)	%	% Plots the phase response for an analog filter	%	% Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		% Author: 			Lars Wanhammar 2005-05-07	% Modified by: 	 	LW 2011-01-23	% Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Linkoping University, Sweden	% Version:			1 	% Known bugs:		None	% Report bugs to:	larsw@isy.liu.se	%========================================================		% Standard settings	fs = 16; 		% Font size	lw = 2; 		% Linewidth	fn = 'times'; 	% Font	% PowerPoint settings	%	fs = 16; 		% Font size	%	lw = 2; 		% Linewidth	%	fn = 'times'; 	% Font	%========================================================		hold on;	plot(w_axis, Phase,'b','linewidth', lw);	N = length(Phase);	Diff = Phase(1:N-1) - Phase(2:N);	Index = find(abs(Diff) > 6.25);	% Remove plot of vertial lines from -pi to pi which are artifacts	for i = 1:length(Index)				plot([w_axis(Index(i)) w_axis(Index(i))],[Phase(Index(i)), Phase(Index(i)+1)], 'w', 'linewidth', lw+1);	end	% Correct plot for the phase discontinuities at single zeros on the unit circle	Diff = Phase(1:N-1) - Phase(2:N);	Index = find((Phase(1:N-1) > Phase(2:N) + 3.13));	for i = 1:length(Index)				plot([w_axis(Index(i)) w_axis(Index(i))],[Phase(Index(i)), Phase(Index(i)+1)], 'w', 'linewidth', lw+1);		plot([w_axis(Index(i)) w_axis(Index(i))],[Phase(Index(i)), pi], 'k', 'linewidth', lw);		plot([w_axis(Index(i)) w_axis(Index(i))],[-pi, Phase(Index(i)+1)], 'k', 'linewidth', lw);	end	axis([0 max(w_axis) -pi pi]);	ylabel('{\it\Phi}({\it\omega}) [rad]','FontName', fn,'FontSize',fs);	xlabel('{\it\omega}  [rad/s]','FontName', fn,'FontSize', fs);	set(gca,'FontName', fn,'FontSize', fs);		ay = [-pi -0.75*pi -0.5*pi -0.25*pi 0 0.25*pi 0.5*pi 0.75*pi pi];	laby = {'-\pi';'-0.75\pi';'-0.5\pi';' ';' ';' ';'0.5\pi';'0.75\pi';'\pi'};	ytick(ay,laby);	grid on;	box on;