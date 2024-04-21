 	function [L, C, K] = LP_2_HP_LADDER(L, C, K, WIsquared)	%	%	Computes the element values for a doubly resistively 	%	terminated highpass LC ladder from a lowpass ladder	%	%	K is a vector used by LADDER_2_H that defines the type	%	of elements in the ladder.	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		% 	Author: 			Lars Wanhammar, 2007-09-05	% 	Modified by: 	 		%	Copyright:			Divison of Electronics Systems	%	 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version:			1	% 	Known bugs:			None	% 	Report bugs to:		larsw@isy.liu.se	%		TempL = L;	TempC = C;	TempK = K;	for j = 1:length(TempC)		if TempC(j) ~= 0			L(j) = 1/(WIsquared*TempC(j));		else			L(j) = 0;		end		if (TempK(j) == 2|TempK(j) == 8)			K(j) = K(j)+1;		end	end	for j = 1:length(TempL)		if TempL(j) ~= 0			C(j) = 1/(WIsquared*TempL(j));		else			C(j) = 0;		end		if (TempK(j) == 3|TempK(j) == 9)			K(j) = K(j)-1;		end	end	