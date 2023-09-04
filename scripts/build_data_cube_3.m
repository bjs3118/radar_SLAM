function [dataCube] = build_data_cube_3(data, nFast, nRx, nTx, nSlow)
%BUILD_DATA_CUBE_3 Summary of this function goes here
%   Detailed explanation goes here

nSlow = (nSlow / 2);
nCh = nRx * nTx;
% Reshape data into a 2D array with two columns
data1 = reshape(data, [2, length(data)/2]);

% Perform complex multiplication with [1, 1j]
data2 = complex(data1(1, :), data1(2, :));

% Reshape data into a 3D array with dimensions nchirp, nrb, and nch
dataCube = reshape(data2, [nRx, nTx, nFast, nSlow]);

% [slow, fast, nRx, nTx]
dataCube = permute(dataCube, [4, 3, 2, 1]);
% data3 = py.numpy.asarray(int(data2) );
% dataCube = data3.reshape([nSlow, nFast, nCh]);
% % dataCube = reshape(data2, );
end

