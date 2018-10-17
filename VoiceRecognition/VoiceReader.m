function [PhraseData1,PhraseData2,PhraseData3,PhraseData4]= VoiceReader(Phrase,TopFolder,FF,PhraseFolder)
% 
    cd(TopFolder )%selects the main Directory
    cd(PhraseFolder)                       % selects the Phrases folder     
    
% 
%     PhraseFoldersChar = ls;             % lists all files within the phrase folder as a char array
% 
%     PhraseFoldersStr  = string(PhraseFoldersChar);          % converts char array into string array
%     PhraseFoldersStr  = erase(PhraseFoldersStr,"Icon?");    % erases random Icon file from the string
%     PhraseFoldersStr  = split(PhraseFoldersStr);            % turns into verticle array based on spacing
%     
%     fs = 3 ; % seconds
%    
     
    
     for i = 1:1              

        cd(Phrase)                                       % selecting the current phrase's directory
        SavedPhrasesChar = ls;                           % lists all files within directory with extentions

        SavedPhrasesStr = string(SavedPhrasesChar);      % converts char array into string array
        SavedPhrasesStr = erase(SavedPhrasesStr,"Icon?");% erases random Icon file from the string
        SavedPhrasesStr = split(SavedPhrasesStr);        % turns into verticle array based on spacing   

        SavedPhrase1 = char(SavedPhrasesStr(2));         % converts String data in char array so that the files can be called upon based on their specific file name
        SavedPhrase2 = char(SavedPhrasesStr(3));
        SavedPhrase3 = char(SavedPhrasesStr(4));
        SavedPhrase4 = char(SavedPhrasesStr(5));

        [Temp_PhraseData1,FS1,WMODE1,FIDX1]=readwav(SavedPhrase1,'p'); % Reads in the .wav files
        [Temp_PhraseData2,FS2,WMODE2,FIDX2]=readwav(SavedPhrase2,'p'); 
        [Temp_PhraseData3,FS3,WMODE3,FIDX3]=readwav(SavedPhrase3,'p'); 
        [Temp_PhraseData4,FS4,WMODE4,FIDX4]=readwav(SavedPhrase4,'p');
        
        cd(FF)
        
        [PhraseData1] = VectorSimp(Temp_PhraseData1);
        [PhraseData2] = VectorSimp(Temp_PhraseData2);
        [PhraseData3] = VectorSimp(Temp_PhraseData3);
        [PhraseData4] = VectorSimp(Temp_PhraseData4);
        
     end

     cd(PhraseFolder)
   

    cd (TopFolder)
    
  
    
end  
    
