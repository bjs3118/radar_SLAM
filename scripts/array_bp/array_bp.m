function [arrMap] = array_bp(nCh, dataMat, sweepSlope, fs, fc, rRes, rMax, thetaRes, thetaMax)
%SAR_002 Summary of this function goes here
%   Detailed explanation goes here
c = physconst('LightSpeed');


% Range compression 
[rangeResp, rnggrid]= range_compress(dataMat, sweepSlope, fs);

[arrMap, phsCntrR, phsCntrTheta] = calc_arr_map(rRes, rMax, thetaRes, thetaMax);

chArray = calc_channel_spacing(nCh, fc);
% disp(chArray(5));

for ch=1:nCh
    chCoord = chArray(:, ch);

    chR = calc_channel_R(chCoord, phsCntrR, phsCntrTheta);

    R = abs(chR - phsCntrR);

    % imagesc(R);

    h = exp(1i*2*pi*fc*(2*R)/c);
    
    phases = interp1(rnggrid, rangeResp(:, ch), chR, 'linear');
    
    phase_compensated = phases .* h;

    arrMap = arrMap + phase_compensated;
end

