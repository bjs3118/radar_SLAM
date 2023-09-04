function [dataCube] = build_data_cube_4(data, nFast, nRx, nTx, nSlow, k)
%BUILD_DATA_CUBE_3 Summary of this function goes here
%   Detailed explanation goes here

nSlow = (nSlow / 2);
nCh = nRx * nTx;

data1 = cmplx_from_array(data, k);


% Reshape data into a 3D array with dimensions nchirp, nrb, and nch
% dataCube = reshape(data1, [nTx, nRx, nFast, nSlow]);
dataCube = reshape(data1, [nRx, nFast, nTx, nSlow]);

% [slow, fast, nRx, nTx]
% dataCube = permute(dataCube, [4, 3, 2, 1]);
dataCube = permute(dataCube, [4, 2, 1, 3]);
dataCube = squeeze(dataCube(:, :, :, 1));
dataCube = permute(dataCube, [2, 3, 1]);


end
