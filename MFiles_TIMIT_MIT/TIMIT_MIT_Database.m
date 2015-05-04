classdef TIMIT_MIT_Database < handle
%TESTDATABASE Summary of this class goes here
%Detailed explanation goes here
    
    
    properties (SetAccess = private)
        
        Database
        Directory   % directory to search for the TIMIT MIT database
        GUI
        Mode    % available modes: 'gui' or 'console' or 'dual'    
        Results
        
    end
    
    properties (Constant)
        DefaultDirectory = '../TIMIT MIT/';
        DefaultMode = 'gui';
    end
    
    methods
        function obj = TIMIT_MIT_Database(mode, directory)
            if nargin == 0
                obj.Directory = obj.DefaultDirectory;
                obj.Mode = obj.DefaultMode;
            elseif nargin == 1
                obj.Mode = mode;
                obj.Directory = obj.DefaultDirectory;
            elseif nargin == 2
                obj.Mode = mode;
                obj.Directory = directory;
            end
                obj.loadDatabase
                obj.GUI = DatabaseGUI(obj);
        end
        
        
        function openGUI(obj)
            if strcmpi(obj.Mode, 'gui')||strcmpi(obj.Mode, 'dual')
                if isempty(obj.GUI) || ~isvalid(obj.GUI.Handles.hFigure)
                    obj.GUI = DatabaseGUI(obj);
                else
                    figure(obj.GUI);
                end
            else
                error('The mode is set to ''console''. Therefore you can''t open the GUI. Use method setMode() with parameters ''gui'' or ''dual'' to change the mode.')
            end
        end
        
        
        function loadDatabase(obj,directory)
            if nargin == 2
                obj.Directory = directory;
            end
            try
                inReadDatabase = obj.readDatabase;
                
                %Uses variable Functions to create a 160x5 cell array
                writeFileDirection = saveFileDirection(inReadDatabase);
                writeGender = saveGender(inReadDatabase);
                writePerson = savePerson(inReadDatabase);
                writeSentenceID = saveSentenceID(inReadDatabase);
                writeWords = saveWords(inReadDatabase);
                writePhonems = savePhonem(inReadDatabase);
                
                %Writes the variable Datas in one cell array
                obj.Database = [writeFileDirection,writeGender,writePerson,writeSentenceID,writeWords,writePhonems];
                switch obj.Mode
                    case 'gui'
                        obj.GUI.Handles.hDirInfo.String = 'Database successfully loaded';
                        obj.GUI.Handles.hSearch.Enable = 'on';
                        obj.GUI.Handles.hResults.String = '';
                    case 'console'
                        disp('Database successfully loaded');
                    case 'dual'
                        disp('Database successfully loaded');
                        obj.openGUI
                        obj.GUI.hDirInfo.String = 'Database successfully loaded';
                end
            catch
                obj.Database = {};
                switch obj.Mode
                    case 'gui'
                        obj.GUI.Handles.hDirInfo.String = 'Files not found';
                        obj.GUI.Handles.hSearch.Enable = 'off';
                        obj.GUI.Handles.hResults.String = 'no results';
                        obj.GUI.Handles.hResults.Enable = 'inactive';
                        obj.GUI.Handles.hPlay.Enable = 'off';
                        obj.GUI.Handles.hStop.Enable = 'off';
                        obj.GUI.Handles.hFFT.Enable = 'off';
                        obj.GUI.Handles.hConsole.Enable = 'off';
                    case 'console'
                        error('Invalid file identifier. The files (allfilelist.txt, allphonelist.txt, allsenlist.txt) were not found in this directory. The input has to be the directory of the "TIMIT MIT" folder.');
                    case 'dual'
                        obj.GUI.hDirInfo.String = 'Files not found';
                        error('Invalid file identifier. The files (allfilelist.txt, allphonelist.txt, allsenlist.txt) were not found in this directory. The input has to be the directory of the "TIMIT MIT" folder.');
                end
            end
        end
        
        
        function searchDatabase(obj, Gender, Person, SentenceID, Words, Phonems)
        %SEARCHDATABASE This Function searches after the given searchparameter. It
        %is possible to search in a combination of parameters.
            loadedDatabase = obj.Database;
            resultingAudioFiles = {};
            for i=1:length(loadedDatabase)
                if findGender(loadedDatabase{i,2}{1,1},Gender) && findPerson(loadedDatabase{i,3}{1,1},Person) && findSentenceID(loadedDatabase{i,4}{1,1},SentenceID) && findWords(loadedDatabase{i,5}{1,1},Words) && findPhonems(loadedDatabase{i,6}{1,1},Phonems)
                resultingAudioFiles = [resultingAudioFiles; loadedDatabase{i,1}{1,1}];
                end
            end
            obj.Results = resultingAudioFiles;
            switch obj.Mode
                case 'gui'
                    obj.GUI.Handles.hResults.Value = 1;
                    obj.GUI.Handles.hResults.String = obj.Results;
                case 'console'
                    disp(obj.Results);
                case 'dual'
                    disp(obj.Results);
                    obj.GUI.Handles.hResults.Value = 1;
                    obj.GUI.Handles.hResults.String = obj.Results;
            end
            if isempty(obj.Results)
                obj.GUI.Handles.hResults.Value = 1;
                obj.GUI.Handles.hResults.String = 'no results';
                obj.GUI.Handles.hResults.Enable = 'inactive';
                obj.GUI.Handles.hPlay.Enable = 'off';
                obj.GUI.Handles.hStop.Enable = 'off';
                obj.GUI.Handles.hFFT.Enable = 'off';
                obj.GUI.Handles.hConsole.Enable = 'off';
            else
                obj.GUI.Handles.hResults.Enable = 'on';
                obj.GUI.Handles.hPlay.Enable = 'on';
                obj.GUI.Handles.hStop.Enable = 'on';
                obj.GUI.Handles.hFFT.Enable = 'on';
                obj.GUI.Handles.hConsole.Enable = 'on';
            end
        end

        
        function setMode(obj,mode)
            if nargin == 1
                obj.Mode = 'gui';
            elseif nargin == 2
                obj.Mode = mode;
            end
            switch obj.Mode
                case 'console'
                    searchDatabase();
                case 'gui'
                    obj.openGUI;
                case 'dual'
                    obj.openGUI;
                otherwise
                   disp('Select a Mode (gui, console or dual)') 
            end
        end
        
        
        function closeGUI(obj)
            close(obj.GUI);
        end
             
    end
    
    
    methods (Access = private)
        
        function inReadDatabase = readDatabase(obj)
        %READDATABASE This Function opens all .txt Files and reads in the
        %important files.

            %opens the allphonelist.txt and save the Data in a variable.
            allPhoneListID = fopen([obj.Directory, 'allphonelist.txt']);
            directionAndPhonems = fscanf(allPhoneListID, '%c');
            fclose(allPhoneListID);

            %opens the allsenlist.txt and save the Data in a variable.
            allSenListID = fopen([obj.Directory, 'allsenlist.txt']);
            sentenceID = fscanf(allSenListID, '%c');
            fclose(allSenListID);

            %opens the allfilelist.txt and save the Data in a variable.
            allFileListID = fopen([obj.Directory, 'allfilelist.txt']);
            personAndSentence = fscanf(allFileListID, '%c');
            fclose(allFileListID);

            %defines the expressions for the regexp function
            splitDirectionAndPhonems = '[a-z\-\/\d]+(?=\t)|(?<=#\ )[a-z\-\ ]+(?=\ h#)';
            splitSentenceID = '(?<=\t)[a-z''\ ]+';
            splitPersonAndSentence = '(?<=\-)[mf]|[a-z]{3}\d(?=\/)|(?<=\/)[a-z]{2}\d+';

            %uses the regexp function to split the .txt Data in Strings
            getDirectionAndPhone = regexp(directionAndPhonems,splitDirectionAndPhonems,'match');
            getSentence = regexp(sentenceID,splitSentenceID,'match');
            getPersonAndSentence = regexp(personAndSentence,splitPersonAndSentence,'match');
            inReadDatabase = [getPersonAndSentence,getDirectionAndPhone,getSentence];
        end
        
    end
    
end

