	function F = FACTORIAL(n)	%	% 	Computes the factorial, n! = Gamma(n+1) of an integer, 	% 	where Gamma is the well-known gamma function	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		% 	Author: 		Lars Wanhammar, 2004-07-15	% 	Modified by: 		 	% 	Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version: 		1	% 	Known bugs:		 	% 	Report bugs to:	larsw@isy.liu.se		if n == 0		F = 1;	else		F = n*FACTORIAL(n-1);	end	