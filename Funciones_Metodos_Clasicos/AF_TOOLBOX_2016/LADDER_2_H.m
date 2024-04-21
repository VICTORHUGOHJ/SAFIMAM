	function H = LADDER_2_H(N, Z0, L, C, Rs, RL, K, W, T) 	%	%	Computes the frequency response for a ladder sructure.	%	N number of two-ports.	%	Z0 contains the port resistances of the unit elements or resistors.	%	L and C vectors contain inductors and capacitors in each two-port.	%	Rs = source resistor and RL = load resistor.	%	K is a vector defining the two-port.	%	W vector with angular frequencies.	%	T propagation time forth and back through a unit element.	%	For a series impedance	%	K = 1 for a series resistor, 2 for an inductor and 3 for a capacitor	%	K = 4 for a series and 5 for a parallel resonance circuit	%	K = 6	for a unit element with Z0 stored in the vector Z0	%	For a shunt impedance	%	K = 7 for a shunt resistor, 8 for an inductor and 9 for a capacitor	%	K = 10 for a series and 11 for a parallel resonance circuit	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009			% 	Author: 		Lars Wanhammar 2007-06-25	% 	Modified by: 	LW 2009-01-18	% 	Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version: 		1	% 	Known bugs:		None	% 	Report bugs to:	larsw@isy.liu.se	%			for OmegaIndx = 1:length(W) 		ww = W(OmegaIndx);		CM = [1 0; 0 1];			for indx = 1:N			switch K(indx)					case 1 % Series resistor				CM = CM*[1 Z0(indx);0 1];			case 2 % Series inductor				CM = CM*[1 i*ww*L(indx);0 1];			case 3  % Series capacitor				CM = CM*[1 1/(i*ww*C(indx));0 1];				case 4	 % Series, series resonance circuit				CM = CM*[1 i*ww*L(indx)+1/(i*ww*C(indx));0 1];			case 5	% Series, parallel resonance circuit				CM = CM*[1 i*ww*L(indx)/(1 - ww^2*L(indx)*C(indx));0 1];			case 6	% Unit element				CM = CM*[1 i*ww*Z0(indx); i*ww/Z0(indx) 1]/sqrt(1 + ww^2);			case 7	% Shunt resistor				CM = CM*[1 0;1/Z0(indx) 1];			case 8	% Shunt inductor				CM = CM*[1 0;1/(i*ww*L(indx)) 1];			case 9	% Shunt	capacitor				CM = CM*[1 0;i*ww*C(indx) 1];			case 10	% Shunt, seires resonance circuit				CM = CM*[1 0;-i*ww*C(indx)/(L(indx)*C(indx)*ww^2-1) 1];			case 11	% Shunt, parallel resonance circuit				CM = CM*[1 0;(1 - ww^2*L(indx)*C(indx))/(i*ww*L(indx)) 1];			end		end		if Rs ~= 0 & Rs ~= inf & RL ~= 0 & RL ~= inf			H(OmegaIndx) = RL/((CM(1,1) + CM(2,1)*Rs)*RL + CM(2,2)*Rs + CM(1,2));		end		if Rs ~= 0 & Rs ~= inf & RL == inf			H(OmegaIndx) = 1/(CM(1,1) + CM(2,1)*Rs);		end		if Rs ~= 0 & Rs ~= inf & RL == 0 			H(OmegaIndx) = -1/(CM(1,2) + CM(2,2)*Rs);		end		if Rs == inf & RL ~= 0 & RL ~= inf			H(OmegaIndx) = RL/(CM(2,2) + CM(2,1)*RL);		end		if Rs == 0 & Rs ~= inf & RL ~= 0			H(OmegaIndx) = RL/(CM(1,2) + CM(1,1)*RL);		end	end						