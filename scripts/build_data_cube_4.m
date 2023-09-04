function [dataCube] = build_data_cube_4(data, nFast, nRx, nTx, nSlow, k)
%BUILD_DATA_CUBE_3 Summary of this function goes here
%   Detailed explanation goes here

nSlow = (nSlow / 2);
% nCh = nRx * nTx;

data1 = cmplx_from_array(data, k);


% Reshape data into a 3D array with dimensions nchirp, nrb, and nch
dataCube = reshape(data1, [nRx, nTx, nFast, nSlow]);

% [slow, fast, nRx, nTx]
dataCube = permute(dataCube, [4, 3, 1, 2]);


end
