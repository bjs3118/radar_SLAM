function [dataCube] = build_data_cube(data, nFast, nRx, nTx, nSlow, k)
%BUILD_DATA_CUBE_3 Summary of this function goes here
%   Detailed explanation goes here

nSlow = (nSlow / 2);
nCh = nRx * nTx;

data1 = cmplx_from_array(data, k);


% Reshape data into a 3D array with dimensions nchirp, nrb, and nch
% dataCube = reshape(data1, [nTx, nRx, nFast, nSlow]);
dataQuad = reshape(data1, [nRx, nFast, nTx, nSlow]);

% [slow, fast, nRx, nTx]
% dataCube = permute(dataCube, [4, 3, 2, 1]);
dataQuad = permute(dataQuad, [4, 2, 1, 3]);
dc1 = squeeze(dataQuad(:, :, :, 1));
dc2 = squeeze(dataQuad(:, :, :, 2));

dataCube = cat(3, dc1, dc2);
dataCube = permute(dataCube, [2, 3, 1]);

end
