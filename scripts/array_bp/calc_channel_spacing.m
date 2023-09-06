function [chArray] = calc_channel_spacing(nCh, fc)
%CALC_CHANNEL_SPACING Summary of this function goes here
%   Detailed explanation goes here

c = physconst('LightSpeed');
lambda = freq2wavelen(fc);

% Calculate the spacing between points
spacing = lambda / 2;

% Calculate the coordinates of each point along the line
x_coordinates = linspace(-spacing * (nCh-1)/2, spacing * (nCh-1)/2, nCh);
y_coordinates = zeros(1, nCh); % Assuming a 1D line

% Define the phase center coordinates
phase_center_x = 0;
phase_center_y = 0; % Assuming the phase center is at the middle of the line

% Initialize arrays to store polar coordinates
r = zeros(1, nCh);
theta = zeros(1, nCh);

% Calculate polar coordinates relative to the phase center
for i = 1:nCh
    delta_x = x_coordinates(i) - phase_center_x;
    delta_y = y_coordinates(i) - phase_center_y;
    
    % Calculate the radius (distance from phase center)
    r(i) = sqrt(delta_x^2 + delta_y^2);
    
    % Calculate the angle (polar angle) relative to the x-axis
    theta(i) = atan2(delta_y, delta_x);
end

chArray = [r; theta];


end

