function [rangeResp, rngGrid] = range_compress(dataMat,sweepSlope, fs)
%RANGE_COMPRESS Summary of this function goes here
%   Detailed explanation goes here
nfft_r = 304; %2^nextpow2(size(dataMat, 1));

% sweepSlope = 100000000000000.0;
c = physconst('LightSpeed');
% fs = 9499000.0;

rangeresp = phased.RangeResponse('PropagationSpeed',c,...
    'SampleRate',fs,...
    'RangeMethod','FFT',...
    'RangeWindow','Hann',...
    'SweepSlope',sweepSlope,...
    'RangeFFTLengthSource','Property','RangeFFTLength',nfft_r, ReferenceRangeCentered=0);

[rangeResp, rngGrid] = rangeresp(dataMat);

% imagesc(abs(rangeResp));
end

