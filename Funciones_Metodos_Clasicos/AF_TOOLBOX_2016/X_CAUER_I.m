 	function [L, C, K] = X_CAUER_I(Xnum, Xden)		% 	Computes the element values in a Cauer I realization of a reactance X(s) using	%	a Continued Fraction Expansion. Odd-order reactances are terminated 	%	with a short-circuit.	%	%							1	%	X(s) = L1s + --------------------------	% 			     C2s +            1	%                      _______________________	%				      	L3s +     1	%				     		 ----------------	%						       C4s +......		% 	Toolbox for DIGITAL FILTERS USING MATLAB 		% 	Author: 		Lars Wanhammar 2007-06-15	% 	Modified by: 		% 	Copyright:		by authors - not released for commercial use	% 	Version: 		1	% 	Known bugs:			% 	Report bugs to:	larsw@isy.liu.se	%	To improve:		Check that X is a true reactance function				% 	Example: Xden = [1 0 10 0  9];  Xnum = [2 0 40 0 128 0]; 	% 	L = 2.0000	0   		4.44444		0			7.777777	%	C = 0 		0.05000000	0   		0.064285  	Norder = max(length(Xnum), length(Xden))-1;	K = 2*ones(1,Norder); 		for n = 1:Norder			[Ratio, Remaind] = LONG_DIV(Xnum, Xden);		Xnum = Xden;		Xden = Remaind;		if mod(n,2) == 0			K(n) = 9;			C(1,n) = Ratio(1,1);		else			K(n) = 2;			L(1,n) = Ratio(1,1);		end	end		if mod(Norder,2)		disp(['Short-circuited termination'])	else		disp(['Open-circuited termination'])	end 