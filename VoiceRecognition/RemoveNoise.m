function [CleanSig] = RemoveNoise(PhraseData,TopFolder,NoiseData,fs1)

%     cd('/Volumes/Macintosh HD/Documents/TTU/Year 4/Fall semester/Project Lab III/Main project/Matlab')%selects the main Directory
%     
%     cd ('noise')
%     
%     [NoiseData]=readwav('noise.wav','p');
    cd(TopFolder)

    
    noisySig = PhraseData;
    noise = NoiseData;
        % Define Adaptive Filter Parameters
    filterLength = 32;
    weights   = zeros(1,filterLength);
    step_size = 1/fs1;
        % Initialize Filter's Operational inputs
    output = zeros(1,length(noisySig));
    error  = zeros(1,length(noisySig));
    input  = zeros(1,filterLength);
        % For Loop to run through the data and filter out noise
    for n = 1: length(noisySig)
            %Get input vector to filter
          for k= 1:filterLength
              if ((n-k)>0)
                  input(k) = noise(n-k+1);
              end
          end
          output(n) = weights * input';                     %Output of Adaptive Filter
          error(n)  = noisySig(n) - output(n);              %Error Computation
          weights = weights + step_size * error(n) * input;   %Weights Updating 
    end
    
    CleanSig = error;
    
    cd(TopFolder)
    
    
end