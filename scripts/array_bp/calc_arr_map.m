function [arrMap, phsCntrR, phsCntrTheta] = calc_arr_map(rRes, rMax, thetaRes, thetaMax)
%CALC_ARR_MAP Summary of this function goes here
%   Detailed explanation goes here


r = 0:rRes:rMax;
theta = -thetaMax:thetaRes:thetaMax;

[phsCntrR, phsCntrTheta] = meshgrid(r, theta);

arrMap = zeros(size(phsCntrR));

end

