	function [G, Z, R_ZEROS, P, Wsnew] = CA_B_POLES(G, Z, P, Wc, Ws, Amax, Amin)	%	% 	Transforms the poles of an even order analog lowpass Cauer filter of	% 	type A with cutoff frequency Wc to have two transmission zeros at s = �. 	% 	That is into a Cauer filter type B.	% 	The cutoff edge is invariant, only the stopband edge, Wsnew, is increased.	%	%	For even order filters of type B we must select	%	% 	RL = Rs*(2*10^(0.1*Amax) - 1 + sqrt(4*(10^(0.2*Amax) - 10^(0.1*Amax))));	%	%	Example r = 25% => Amax = 0.28028 => RL/Rs = 0.6 or RL/Rs = 1/0.6 = 1.66666 	%	% 	The load resistor if computed in the function T_LADDER_2_PI for a � ladder	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009	% 	Author: 		Lars Wanhammar, 2008-07-15	% 	Modified by: 	LW 2009-02-25	% 	Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version: 		1	% 	Known bugs:		 	% 	Report bugs to:	larsw@isy.liu.se	%	 	% Determine the true stopband edge for the type A filter � can be done nicer!	delta = (Ws-Wc)/20; Wsa = Wc;	for n = 1:50		W = Wsa + delta;		A = PZ_2_ATT_S(G, Z, P, W);		if A < Amin			Wsa = W;		else			delta = delta/5;		end	end	Z = sort(Z);	% Higest transmission zero is	szmax = max(abs(Z));		% The new stopband edge is	Wsnew = sqrt(szmax^2-Wc^2)*Wsa/sqrt(szmax^2-Wsa^2)		% The original reflection zeros are		X = (Wsa/Wc)./Z;		% The new reflection zeros are	for n = 1:length(Z)		R_ZEROS(n, 1) = sqrt(szmax^2-Wc^2)*X(n)/sqrt(szmax^2+X(n)^2);	end	% Remove higest transmission zero pair		Z(length(Z)) = [];	Z(length(Z)) = [];		% Transform the remaining zeros	for n = 1:length(Z)		Z(n) = sqrt(szmax^2-Wc^2)*Z(n)/sqrt(szmax^2+Z(n)^2);	end	% Transform the poles	for n = 1:length(P)		P(n) = sqrt(szmax^2-Wc^2)*P(n)/sqrt(szmax^2+P(n)^2);	end	Apn = Amax*log(10)/20;	Asn = Amin*log(10)/20;	epsilon2 = 2*exp(Apn)*sinh(Apn);	G = real(prod(P)/prod(Z));	% Gain constant	G = G/sqrt(1 + epsilon2);	% N is even, hence correct the gain		