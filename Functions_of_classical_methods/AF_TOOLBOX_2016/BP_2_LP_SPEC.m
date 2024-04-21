	function [wc, ws, wi2] = BP_2_LP_SPEC(ws1, wc1, wc2, ws2)		%	%	Computes the band edges used in the geometric symmetric	%	LP-to-BP transformation	%	% 	Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		% 	Author: 			Oscar Gustafsson and Per L�wenborg, 2004-09-09	% 	Modified by: 	 		%	Copyright:			Divison of Electronics Systems	%	 					Dept. Electrical Engineering, Linkoping University, Sweden	% 	Version:			1 	% 	Known bugs:			None	% 	Report bugs to:		larsw@isy.liu.se	%		if(ws1>wc1 | wc1>wc2 | wc2>ws2)		error('Improper order of the frequencies. Must be Ws1<Wc1<Wc2<Ws2.')	else		wi2 = wc1*wc2;		if(wi2 ~= ws1*ws2)			if(wi2 > ws1*ws2)				ws1 = wi2/ws2;			else				ws2 = wi2/ws1;			end		end		wc = wc2-wc1;		ws = ws2-ws1;	end