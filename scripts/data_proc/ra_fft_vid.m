function [] = ra_fft_vid(radarData, vidName)
%RA_FFT_VID Summary of this function goes here
%   Detailed explanation goes here

vid = VideoWriter(vidName, 'MPEG-4');
vid.FrameRate = 23;  % Adjust frame rate as needed
vid.Quality = 90;    % Adjust quality as needed
open(vid);


for i=1:length(radarData)
    disp(i);
    dataCube = radarData{i}.dataCube;

    nfft_r = 2^nextpow2(size(dataCube, 1));
    rangeProc = fft(dataCube, nfft_r, 1);

    raProc = fftshift(fft(rangeProc, 512, 2), 2);

    writeVideo(vid, (uint8(log((abs(squeeze(raProc(:, :, 1))))))));

end 
close(vid);
end

