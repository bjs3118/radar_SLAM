function [radarData] = extract_data(bagPath, frames, nFast, nRx, nTx, nSlow, k)
%EXTRACT_DATA Extracts data from ROS bag, builds MIMO data cubes(s).
%   Detailed explanation goes here

disp("Opening bag");
bag = rosbag(bagPath);

disp("Extracting radar messages");
radars = select(bag, "MessageType", "mmWave/data_frame", "Topic", "/radar_data");
radar1 = readMessages(radars, frames, "DataFormat","struct");

radarData = cell(size(frames));

disp("building dataCube(s)")

if length(radarData) ~= length(radar1)
    error("Length of radarData does not match length of radar messages extracted");
end 

for i=1:length(radar1)
    currentCell = radar1{i, 1};
    dataCube = build_data_cube(currentCell.Data, nFast, nRx, nTx, nSlow, k);
    radarData{i}.dataCube = dataCube;
end 

end

