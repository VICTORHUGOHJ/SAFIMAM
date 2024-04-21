	function [L, C, K] = LP_2_BS_LADDER(L, C, K, WIsquared)	%	%	Converts a doubly resistively lowpass T ladder into	%	bandstop LC ladder. If the lowpass filter has the passband 	% 	edge Omegac then the bandstop filter will have the width 	%	of the stopband equal to Omegac.	%	%	K is a vector used by LADDER_2_H that defines the type	%	of elements in the ladder. The � ladder sholud be modified by	%	using Norton transformations in order to remove the high 	%	impedance node between the two parallel resonance circuits.	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		% 	Author: 			Lars Wanhammar, 2008-12-14	% 	Modified by: 	 	LW 2009-08-27	%	Copyright:			Divison of Electronics Systems	%	 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version:			1	% 	Known bugs:			None	% 	Report bugs to:		larsw@isy.liu.se	%		j = 1; n = 1;	Wi = sqrt(WIsquared);	while n <= length(K)		% Series inductor in series arm -> Parallel resonance circuit in the series arm		if K(n) == 2				TempK(j) = 5; 			TempL(j) = L(n);			TempC(j) = 1/L(n)/WIsquared;		end			% Shunt capacitor -> Series resonance circuit in the shunt arm		if K(n) == 9				TempK(j) = 10;			TempC(j) = C(n);			TempL(j) = 1/C(n)/WIsquared;		end		% Parallel resonance circuit in series arm -> 		% Two parallel resonance circuits in series in the series arm		if K(n) == 5				Omega = 1/sqrt(L(n)*C(n));			x = Wi/(2*Omega);			b = sqrt(x^2 + 1);			W01 = b + x;			W02 = b - x;			TempK(j) = 5;			TempK(j) = 5;			TempL(j) = L(n)/(1 + W01^2);			TempL(j+1) = L(n)/(1 + W02^2);			TempC(j) = (1 + W02^2)/L(n)/WIsquared;			TempC(j+1) = (1 + W01^2)/L(n)/WIsquared;			j = j+1;		end		% Series resonance circuit in the shunt arm->  		% Two parallel, series resonance circuits in the shunt arm		if K(n) == 10			Omega = 1/sqrt(L(n)*C(n));			x = Wi/(2*Omega);			b = sqrt(x^2 + 1);			W01 = b + x;			W02 = b - x;			TempK(j) = 10;			TempK(j+1) = 10;			TempL(j) = (1 + W02^2)/C(n)/WIsquared;			TempL(j+1) = (1 + W01^2)/C(n)/WIsquared;			TempC(j) = C(n)/(1 + W01^2);			TempC(j+1) = C(n)/(1 + W02^2);			j = j+2;		end		j = j+1; n=n+1;	end	K = TempK;	L = TempL;	C = TempC;