function [dataCube] = build_data_cube_2(dataChunk, nFast, nRx, nTx, nSlow)
%BUILD_DATA_CUBE_2 Summary of this function goes here
%   Detailed explanation goes here

nSlow = nSlow/2;
expected_num_samples = 2*(nRx * nTx * nFast * nSlow);
disp(['Number of expected ADC samples: ',num2str(expected_num_samples)]);
disp(['Number of ADC samples read:     ',num2str(length(dataChunk))]);

% i = 2(s + Ns(c + Nc(r + tNr)))
% where
%      t = Tx_num  (0-2)
%      r = Rx_num  (0-3)
%      c = chirp_num  (0-127)
%      s = ADC sample (0-127)
      
ADC_data_real_value  = ones(nTx, nRx, nSlow, nFast) .* NaN;
ADC_data_imag_value  = ones(nTx, nRx, nSlow, nFast) .* NaN;

for index_Tx = 1:nTx
   % get 0-ref index
   t = index_Tx - 1;
   
   for index_Rx = 1:nRx
      % get 0-ref index
      r = index_Rx - 1;
      
      for index_chirp = 1:nSlow
         % get 0-ref index
         c = index_chirp - 1;
         
         for index_ADC = 1:nFast
            % get 0-ref index
            s = index_ADC - 1;
            
            index_real = 2*(s + nFast*(c + nSlow*(r + t*nRx))) + 1;
            index_range_rate = index_real + 1;
            
            % save the recorded value
            ADC_data_real_value(index_Tx, index_Rx, index_chirp, index_ADC) = dataChunk(index_real);
            ADC_data_imag_value(index_Tx, index_Rx, index_chirp, index_ADC) = dataChunk(index_range_rate);
                              
         end % end for index_Tx
      end % end for index_Rx
   end % end for index_chirp
end % end for index_ADC

dataQuad = ADC_data_real_value + ADC_data_imag_value*1i;
dataCube = squeeze(dataQuad(1, :, :, :));

end

