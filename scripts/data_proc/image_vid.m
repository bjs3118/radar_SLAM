function [] = image_vid(bag,vidName)
%IMAGE_VID Summary of this function goes here
%   Detailed explanation goes here

images = select(bag, "MessageType", "sensor_msgs/Image", "Topic", "/camera/color/image_raw");
image1 = readMessages(images, "DataFormat","struct");

vid = VideoWriter(vidName, 'MPEG-4');
vid.FrameRate = 30;  % Adjust frame rate as needed
vid.Quality = 90;    % Adjust quality as needed
open(vid);

for i=1:length(image1)
    disp(i);
    writeVideo(vid, rosReadImage(image1{i, 1}));
end 
close(vid);

end

