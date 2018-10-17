function[Phrase1,Phrase2,Phrase3,PhraseFolder] = UserPhrases(TopFolder)
    
    cd(TopFolder)                   % variable used to return to the main directory 
    mkdir('Phrases')                % creates Phrases directory
    cd('Phrases')                   % selects the Phrases directroy
    PhraseFolder = cd();            % variable used to return to the Phrases directory

    prompt = 'Enter Phrase 1: ';    % User input prompt for first Phrase
    Phrase1 = input(prompt,'s');
    Phrase1 = char(Phrase1);
    prompt = 'Enter Phrase 2: ';    % User input prompt for second Phrase
    Phrase2 = input(prompt,'s');
    Phrase2 = char(Phrase2);
    prompt = 'Enter Phrase 3: ';    % User input prompt for third Phrase
    Phrase3 = input(prompt,'s');
    Phrase3 = char(Phrase3);
    mkdir(Phrase1)                  % creates folder for first Phrase
    mkdir(Phrase2)                  % creates folder for second Phrase
    mkdir(Phrase3)                  % creates folder for third Phrase

    cd(TopFolder)
end