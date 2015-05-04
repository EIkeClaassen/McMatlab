classdef TIMIT_MIT_Database < handle
    %TESTDATABASE Summary of this class goes here
    %   Detailed explanation goes here
    
    
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
                        %~isvalid(findobj('Tag','TIMIT_MIT_DatabaseGUI'))
                        obj.GUI = DatabaseGUI(obj);
                    else
                        %obj.GUI = findobj('Tag','TIMIT_MIT_DatabaseGUI');
                        figure(obj.GUI);
                        %figure(obj.GUI.hFigure);
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
                    obj.Database = loadDatabase(obj.Directory);
                    switch obj.Mode
                        case 'gui'
                            %obj.openGUI
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
                    
                catch e
                    switch obj.Mode
                        case 'gui'
                            obj.GUI.Handles.hDirInfo.String = 'Files not found';
                            obj.GUI.Handles.hSearch.Enable = 'off';
                            obj.GUI.Handles.hResults.String = 'no results';
                            obj.GUI.Handles.hResults.Enable = 'inactive';
                            obj.GUI.Handles.hPlay.Enable = 'off';
                            obj.GUI.Handles.hStop.Enable = 'off';
                            obj.GUI.Handles.hFFT.Enable = 'off';
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

                %if ~(ischar(Gender)&&ischar(Person)&&ischar(SentenceID)&&ischar(Words)&&ischar(Phonems))
                    %warning('All inputs have to be Strings. Wrong Inputs are treated as empty.');
                %end

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
                        obj.GUI.Handles.hResults.String = obj.Results;
                    case 'console'
                        disp(obj.Results);
                    case 'dual'
                        disp(obj.Results);
                        obj.GUI.Handles.hResults.String = obj.Results;
                end
            
                if isempty(obj.Results)
                    obj.GUI.Handles.hResults.String = 'no results';
                    obj.GUI.Handles.hResults.Enable = 'inactive';
                    obj.GUI.Handles.hPlay.Enable = 'off';
                    obj.GUI.Handles.hStop.Enable = 'off';
                    obj.GUI.Handles.hFFT.Enable = 'off';
                else
                    obj.GUI.Handles.hResults.Enable = 'on';
                    obj.GUI.Handles.hPlay.Enable = 'on';
                    obj.GUI.Handles.hStop.Enable = 'on';
                    obj.GUI.Handles.hFFT.Enable = 'on';
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
        
            function execute(obj)
            
            end
        
        end 
end

