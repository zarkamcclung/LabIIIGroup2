function [NoiseData]=NoiseRecorder(fs1,nBits,nChannels,RecordingTime,TopFolder,FF)

    recObj = audiorecorder(fs1,nBits,nChannels);        % initiates audio recording
    
    audioNoiseString = 'noise';        % String used to name the recording when saving the .wav file
    
    cd(TopFolder)
    mkdir(audioNoiseString)
    cd(audioNoiseString)
    
    disp("About to record Noise Reference");
    pause(2);
        
    disp("Recording Noise: Press ENTER when Ready...");
    pause
    disp("Recording Noise: NO SPEAKING!");
    recordblocking(recObj, RecordingTime);
    pause(RecordingTime)
    disp("Recording Stopped")                                               % recording has finished
    AudioRecording = getaudiodata(recObj);                                  % gets the audio data from the recording
    writewav(AudioRecording,8000,audioNoiseString,'16',[],[]);              % creates a noise.wav file from the recording
  
    NoiseData=AudioRecording;

    cd(TopFolder)
        
    
    
end