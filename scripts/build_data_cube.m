function [dataCube] = build_data_cube(dataChunk, nFast, nRx, nTx, nSlow)
% Builds data cube from raw ADC input
%  

% Check if the dimensions match
if length(dataChunk) ~= nFast*nSlow*nRx*2
    error(['Number of ADC samples does not match config.\n', ...
           'Length of dataChunk: %d\nConfig: %s'], length(dataChunk), nFast*nSlow*nRx*2);
end

dataChunk = double(dataChunk) - (double(dataChunk) >= 2^15) * 2^16;

len = length(dataChunk) / 2;
adcOut(1:2:len) = dataChunk(1:4:end) + 1j*dataChunk(3:4:end);
adcOut(2:2:len) = dataChunk(2:4:end) + 1j*dataChunk(4:4:end);

adcOut = reshape(adcOut, [nFast, nRx*nTx, nSlow/2]);
dataCube = adcOut;

end

