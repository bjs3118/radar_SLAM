function [radarData] = rda_proc_001(radarData)
%RDA_PROC_001 First test of range-Doppler-angle processing
%   Detailed explanation goes here

for i=1:length(radarData)
    dataCube = radarData{i}.dataCube;

    nfft_r = 2^nextpow2(size(dataCube, 1));
    rangeProc = fft(dataCube, nfft_r, 1);
    % figure;
    % imagesc(abs(squeeze(rangeProc(:, 1, :))));

    nfft_d = 2^nextpow2(size(dataCube, 3));
    rdProc = fftshift(fft(rangeProc, nfft_d, 3), 3);
    % figure;
    % imagesc((abs(squeeze(rdProc(:, 1, :)))));

    raProc = fftshift(fft(rdProc, 64, 2), 2);
    % figure;
    % imagesc((abs(squeeze(raProc(:, :, 1)))));

    radarData{i}.rdProc = rdProc;
    radarData{i}.raProc= raProc;
end 

end

