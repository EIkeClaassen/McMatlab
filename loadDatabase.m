function loadedDatabase = loadDatabase (direction)
% LOADDATABASE This function loads the TIMIT MIT - Database if the right
% Direction is typed in as a paramter. The return value is a cell array with
% 160x6 cells.

%global variable to use the loadedDatabase in the Searchfunction
global database

%Try and catch Block to handle some Exceptions
    try  
        if nargin == 0
            direction ='';
        end
        
        inReadDatabase = readDatabase(direction);
        
        %Uses variable Functions to create a 160x5 cell array
        writeFileDirection = saveFileDirection(inReadDatabase);
        writeGender = saveGender(inReadDatabase);
        writePerson = saveSpeaker(inReadDatabase);
        writeSentenceName = saveSentenceName(inReadDatabase);
        writeSentence = saveSentence(inReadDatabase);
        writePhonems = savePhonem(inReadDatabase);
        
        %Writes the variable Datas in one cell array
        loadedDatabase = [writeFileDirection,writeGender,writePerson,writeSentenceName,writeSentence,writePhonems];
      
        database = loadedDatabase;
        
    catch ME
        
         switch ME.identifier
            case 'MATLAB:FileIO:InvalidFid'
                error('Invalid file identifier. The files (allfilelist.txt, allphonelist.txt, allsenlist.txt) were not found in this directory. The input has to be the directory of the "TIMIT MIT" folder.');
            otherwise
                rethrow(ME)
         end
    end
end
    
