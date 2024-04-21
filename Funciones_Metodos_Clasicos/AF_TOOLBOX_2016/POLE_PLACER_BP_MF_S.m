	function[G, Z, P, dopt] = POLE_PLACER_BP_MF_S(Amax,Wc1,Wc2,amin_low,amin_high,wstep_low,wstep_high,wi_low,wi_high,NZ,NIN)	%	%	Returns the zeros,poles and scaling constant for a maximally flat passband, bandpass filter.	%	Dopt is the final distance to the specification in dB. If negative the specification is not met.	%	The routine uses the tranformed variable Z to achieve higher numerical accuracy.	%	Amax = passband attenuation	%	Wc1 = lower passband cutoff angular frequency	%	Wc2 = higher passband cutoff angular frequency	%	amin_low = contains piecewise constant stopband attenuation demands in the lower stopband	%	amin_high = contains piecewise constant stopband attenuation demands in the upper stopband	%	wstep_low = step frequencies in the lower stopband	%	wstep_high = step frequencies in the upper stopband	%	wi_low = initial frequencies of the zeros on the imaginary axis in the lower stopband	%	wi_high = initial frequencies of the zeros on the imaginary axis in the upper stopband	%	NZ = number of zeros at w = 0	%	NIN = number of zeros at infinity	%	For a bandpass filter NZ = NIN	%	wstep_low and wi_low may NOT contain any common values.	%	wstep_high and wi_high may NOT contain any common values.	%	% Toolbox for ANALOG FILTERS USING MATLAB, Springer, 2009		%	Author: 		Per Loevenborg 1999-03-22	%	Modified by: 	LW, 2007-12-14, 2011-01-23	%	Copyright:		Divison of Electronics Systems	% 					Dept. Electrical Engineering, Linkoping University, Sweden	%	Version 		1 	%	Known bugs: 	May not always converge, try another initial placement		zatt_low = bp_w2z(wi_low,Wc1,Wc2);	zatt_high = bp_w2z(wi_high,Wc1,Wc2);	zstep_low = bp_w2z(wstep_low,Wc1,Wc2);	zstep_high = bp_w2z(wstep_high,Wc1,Wc2);	if or((min(wi_high) < min(wstep_high)),(max(wi_low) > max(wstep_low)))		disp('Error: Initial attenuation poles not in stop band.')		return;	end	zstep_low = sort(zstep_low);	zstep_high = sort(zstep_high);	Nsteps = 1	while Nsteps < 1000		zatt_low = sort(zatt_low);		zatt_high = sort(zatt_high);		[zarcmin_low, zarcmin_high] = bp_find_arcmin_mf(zatt_low, zatt_high, NIN, NZ, Wc2/Wc1);		[dmin_low,dmin_high,zout_low,zout_high] = bp_find_dmin3(...		zstep_low,zstep_high,zatt_low,zatt_high,zarcmin_low,...		zarcmin_high,amin_low,amin_high,Amax,NIN,NZ,Wc2/Wc1);				% Remove "dublett"		if dmin_high(length(dmin_high)) < dmin_low(1) 			dmin_low = dmin_low(2:length(dmin_low));			zout_low = zout_low(2:length(zout_low));		else			dmin_high = dmin_high(1:length(dmin_high)-1);			zout_high = zout_high(1:length(zout_high)-1); 		end		[deltaz, dopt] = bp_find_new_poles([zatt_low zatt_high], ...		NIN,NZ,Wc2/Wc1,Amax,[zout_low zout_high],[dmin_low dmin_high]);		if isempty(deltaz)			break;		end		NLOW = length(zatt_low);		zatt_low = zatt_low+deltaz(1:NLOW);		zatt_high = zatt_high+deltaz(NLOW+1:length(deltaz));				% Requires sorted zstep		for k = 1:NLOW			if zatt_low(k) <= Wc2/Wc1;				zatt_low(k) = Wc2/Wc1 + (rand(1)/100);			elseif zatt_low(k) > zstep_low(length(zstep_low))				zatt_low(k) = zstep_low(length(zstep_low)) - (rand(1)/100);    			end		end		for k = 1:length(zatt_high)			if zatt_high(k) <= zstep_high(1)				zatt_high(k) = zstep_high(1) + (rand(1)/100);			elseif zatt_high(k) > 1				zatt_high(k) = 1 - (rand(1)/100);    			end		end		if max(abs(deltaz)) < 1e-11			dopt			break;		else			disp(max(abs(deltaz)))		end		Nsteps = Nsteps+1	end	ee = bpmf_get_ee([zatt_low zatt_high],NIN,NZ,Amax,Wc2/Wc1); 	[P, Q] = bairstow(ee);	wi = bp_z2w([zatt_low zatt_high],Wc1,Wc2);	[P, G] = bp_get_poles(P,Q,Wc1,Wc2,Amax,wi,NZ);	Z = zeros(1,NZ);	Z = [Z j*wi -j*wi]';	P = P';	G = real(G);	%	disp('Poles:')	%	disp(P')	%	disp('Zeros:')	%	disp(Z')		