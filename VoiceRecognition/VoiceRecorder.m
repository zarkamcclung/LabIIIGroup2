function [Phrase1,Phrase2,Phrase3,PhraseFolder] = VoiceRecorder(fs1,nBits,nChannels,RecordingTime,TopFolder,FF)

    recObj = audiorecorder(fs1,nBits,nChannels);       % initiates audio recording 
    
    cd(TopFolder) %selects the main Directory  
    
    cd(FF)
    [Phrase1,Phrase2,Phrase3,PhraseFolder] = UserPhrases(TopFolder);
    cd(TopFolder)
    cd(PhraseFolder)

    for j = 1:3                                     % loops 3 times to get recordings for all three phrases

        if j == 1                                   % if Phrase one
            cd(Phrase1)                             % select phrase one's folder
            temp_Phrase = Phrase1;                  % for naming the files
        elseif j == 2                               % if Phrase two
            cd(Phrase2)                             % select phrase two's folder
            temp_Phrase = Phrase2;                  % for naming the files
        elseif j == 3                               % if Phrase three
            cd(Phrase3)                             % select phrase three's folder
            temp_Phrase = Phrase3;                  % for naming the files
        end

        startRec = ['Now recording for: ',temp_Phrase];             	% Begin recording prompt
        disp(startRec);

        for i = 1:4                                                     % saves four recordings for each phrase
            disp("Press ENTER to start recording:");
            pause                                                       % user input to begin recording
                                                                        % when the user is ready to record
            recordblocking(recObj, RecordingTime);                                            % records sound from mic

            disp("Recording Stopped")                                               % recording has finished
            AudioRecording = getaudiodata(recObj);                                  % gets the audio data from the recording
            audioString = [temp_Phrase,'-',num2str(i)];                             % String used to name the recording when saving the .wav file
            writewav(AudioRecording,fs1,audioString,'16',[],[]);                    % creates a .wav file from the recording 
        end

        doneRec = [temp_Phrase,' has finished with recording'];         % when a phrase has been recorded enough times
        disp(doneRec);              
        cd(PhraseFolder)                                                % move back into the Phrases folder

    end    
    cd (TopFolder)
end
 