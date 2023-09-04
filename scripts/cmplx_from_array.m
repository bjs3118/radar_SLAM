function [cmplxArray] = cmplx_from_array(array,k)
%CMPLX_FROM_ARRAY Summary of this function goes here
%   Detailed explanation goes here
if mod(length(array), k) ~= 0
    error("Length of array is not divisible by k")
end 
% 
% oItLen = length(array)/(2*k);
% cmplxArray = [];
% 
% for oIt=1:oItLen
% 
%     % disp(array(oIt*2*k));
%     indx = (oIt-1)*2*k;
% 
%     for iIt=1:k
%         real = array(indx + iIt);
%         imag = array(indx + iIt + k);
%         cmplxArray(end + 1) = complex(real, imag);
%     end 
% end 

oItLen = length(array) / (2 * k);
cmplxArray = complex(zeros(1, oItLen * k));

for oIt = 1:oItLen
    indx = (oIt - 1) * 2 * k;
    realValues = array(indx + 1 : indx + k);
    imagValues = array(indx + k + 1 : indx + 2 * k);
    cmplxArray((oIt - 1) * k + 1 : oIt * k) = complex(realValues, imagValues);
end

end

