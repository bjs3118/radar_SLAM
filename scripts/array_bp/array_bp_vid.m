function [] = array_bp_vid(radarData, vidName, nCh, sweepSlope, fs, fc, rRes, rMax, thetaRes, thetaMax)
%SAR_002_VID Summary of this function goes here
%   Detailed explanation goes here
vid = VideoWriter(vidName, 'MPEG-4');
vid.FrameRate = 23;  % Adjust frame rate as needed
vid.Quality = 90;    % Adjust quality as needed
open(vid);


for i=1:length(radarData)
    disp(i);
    dataMat = radarData{i}.dataCube(:, :, 1);
    
    mimoMap = array_bp(nCh, dataMat, sweepSlope, fs, fc, rRes, rMax, thetaRes, thetaMax);

    writeVideo(vid, (uint8(log((abs(mimoMap'))))));

end 
close(vid);
end

