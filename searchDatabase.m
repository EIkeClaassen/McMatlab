function resultingAudioFiles = searchDatabase(Gender, Person, SentenceID, Words, Phonems)
%SEARCHDATABASE This Function searches after the given searchparameter. It
%is possible to search in a combination of parameters.

    if ~(ischar(Gender)&&ischar(Person)&&ischar(SentenceID)&&ischar(Words)&&ischar(Phonems))
        warning('All inputs have to be Strings. Wrong Inputs are treated as empty.');
    end

%Uses the global database variable which contains the loaded Database from
%given Direction
global database

    loadedDatabase = database;
    %audioFileDirectory = {};
    resultingAudioFiles = {};
    
    for i=1:length(loadedDatabase)
        if findGender(loadedDatabase{i,2}{1,1},Gender) && findPerson(loadedDatabase{i,3}{1,1},Person) && findSentenceID(loadedDatabase{i,4}{1,1},SentenceID) && findWords(loadedDatabase{i,5}{1,1},Words) && findPhonems(loadedDatabase{i,6}{1,1},Phonems)
            %audioFileDirectory = [audioFileDirectory;loadedDatabase{i,1}];
            
            resultingAudioFiles = [resultingAudioFiles; AudioFile(loadedDatabase{i,1}{1,1})];
        end
    end  
end
