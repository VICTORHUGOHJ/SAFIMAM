	function [Xnum, Xden] = S_2_Z(G, Szeros, Spoles)		% 	Computes the impedance in rational form corresponding to a 	%	reflectance in terms of the poles and zeros of S.	%			% 	Author: 		Lars Wanhammar 2007-06-25	% 	Modified by: 		% 	Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Link�ping University, Sweden	% 	Version: 		1.0 	% 	Known bugs:		None	% 	Report bugs to:	larsw@isy.liu.se	%	To improve:		Check that S is a true reflection function			N = length(Spoles);		SnumPoly = G*ROOTS_2_POLY(Szeros);	SdenPoly = ROOTS_2_POLY(Spoles);	Xnum = POLYADD(SnumPoly, SdenPoly)	Xden = POLYSUB(SdenPoly, SnumPoly)%	if abs(Xden(1)) < 100*eps%		Xden(1) = [];%	end%	Xnum = Xnum/Xden(1);%	Xden = Xden/Xden(1);	%	if length(Xnum) > length(Xden)%		Xden = [0, Xden];	%	end%	if length(Xnum) < length(Xden)%		Xnum = [0, Xnum];	%	end	