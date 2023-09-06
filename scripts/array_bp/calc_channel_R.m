function [chR] = calc_channel_R(chCoord, phsCntrR, phsCntrTheta)
%CALC_CHANNEL_R Summary of this function goes here
%   Detailed explanation goes here

r = chCoord(1);
theta = chCoord(2);

% √(r₁² + r₂² - 2 * r₁ * r₂ * cos(θ₂ - θ₁))
inner1 = r^2 + phsCntrR.^2;
inner2 = 2 .* r .* phsCntrR .* cos(phsCntrTheta - theta);

inner = inner1 - inner2;

chR = sqrt(inner);
end

