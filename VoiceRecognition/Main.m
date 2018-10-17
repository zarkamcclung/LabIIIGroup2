
fs1=22050;          % pick sampling rate supported by sound card, 
                    % typically 8 kHz, 11.025 kHz, 22.05 kHz, 44.1 kHz, 48 kHz, 96 kHz
nBits=16;           % bits per sample for quantization
nChannels=2;        % choose 1 for mono, 2 for stereo

recObj = audiorecorder(fs1,nBits,nChannels);       % initiates audio recording 
RecordingTime = 3;                        % sampling Frequency (seconds)

cd('/Volumes/Macintosh HD/Documents/TTU/Year 4/Fall semester/Project Lab III/Main project/Matlab') %selects the main Directory 
TopFolder = cd('../Matlab');    % variable used to return to the main directory 

cd ('Voice recorder')
FF = cd();


[Phrase1,Phrase2,Phrase3,PhraseFolder] = VoiceRecorder(fs1,nBits,nChannels,RecordingTime,TopFolder,FF);
cd(FF)
[NoiseData] = NoiseRecorder(fs1,nBits,nChannels,RecordingTime,TopFolder);
% cd(FF)


for i = 1:1
    
    
    if i == 1
        Phrase = Phrase1;
    elseif i == 2
        Phrase = Phrase2;
    elseif i == 3
        Phrase = Phrase3;
    end
    
    cd(FF)
    [time_PhraseData1,time_PhraseData2,time_PhraseData3,time_PhraseData4] = VoiceReader(Phrase,TopFolder,FF,PhraseFolder);
    
    cd(FF)
    [freq_PhraseData1,ts1] = FreqTransform(time_PhraseData1,fs1);
    cd(FF)
    [freq_PhraseData2,ts2] = FreqTransform(time_PhraseData2,fs1);
    cd(FF)
    [freq_PhraseData3,ts3] = FreqTransform(time_PhraseData3,fs1);
    cd(FF)
    [freq_PhraseData4,ts4] = FreqTransform(time_PhraseData4,fs1);
%     
%     cd(FF)
%     [CleanSig1] = RemoveNoise(freq_PhraseData1,TopFolder,NoiseData,fs1);
%     cd(FF)
%     [CleanSig2] = RemoveNoise(freq_PhraseData2,TopFolder,NoiseData,fs1);
%     cd(FF)
%     [CleanSig3] = RemoveNoise(freq_PhraseData3,TopFolder,NoiseData,fs1);
%     cd(FF)
%     [CleanSig4] = RemoveNoise(freq_PhraseData4,TopFolder,NoiseData,fs1);
%     
%     cd(FF)
%     [Avg_Sig] = highPoints(freq_PhraseData1,freq_PhraseData2,freq_PhraseData3,freq_PhraseData4);
%     
%     if i == 1
%         CleanedPhraseTemp1 = Avg_Sig;
%     elseif i == 2
%         CleanedPhraseTemp2 = Avg_Sig;
%     elseif i == 3
%         CleanedPhraseTemp3 = Avg_Sig;
%     end
end
    
    


    
 
    
    
    
    
