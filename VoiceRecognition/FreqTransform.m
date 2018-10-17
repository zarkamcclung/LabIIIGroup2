function [y,tc] = FreqTransform(x,fs)
    
%      y=rfft(x);
    [y,tc]=melcepst(x,fs);

end