classdef TIMIT_MIT_Database < handle
    %TIMIT_MIT_DATABASE Summary of this class goes here
    %   Detailed explanation goes here
    
    
    properties (SetAccess = private)
        Database
        Directory   % directory to search for the TIMIT MIT database
        GUI
        Mode        % available modes: 'gui' or 'console' or 'dual'    
        Results
    end
    
    
    properties (Constant, Access = private)
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
            
            obj.openGUI
            obj.loadDatabase
        end
        
        
        function openGUI(obj)
            if strcmpi(obj.Mode, 'gui')||strcmpi(obj.Mode, 'dual')
                if isempty(findobj('Tag','TIMIT_MIT_DatabaseGUI'))
                    obj.GUI = DatabaseGUI(obj);
                else
                    figure(obj.GUI.hFigure);
                end
            else
                error('The mode is set to ''console''. Therefore you can''t open the GUI. Use setMode() to ')
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
                        obj.GUI.hDirInfo.String = 'Database successfully loaded';
                    case 'console'
                        disp('Database successfully loaded');
                    case 'dual'
                        dicp('Database successfully loaded');
                        obj.GUI.hDirInfo.String = 'Database successfully loaded';
                end
            catch e
                switch obj.Mode
                    case 'gui'
                        obj.GUI.hDirInfo.String = 'Files not found';
                    case 'console'
                        error('Invalid file identifier. The files (allfilelist.txt, allphonelist.txt, allsenlist.txt) were not found in this directory. The input has to be the directory of the "TIMIT MIT" folder.');
                    case 'dual'
                        obj.GUI.hDirInfo.String = 'Files not found';
                        error('Invalid file identifier. The files (allfilelist.txt, allphonelist.txt, allsenlist.txt) were not found in this directory. The input has to be the directory of the "TIMIT MIT" folder.');
                end
            end
        end
        
        
        function search(obj,varargin)
            
        end
        
        
        function setMode(obj,mode)
            if nargin == 1
                obj.Mode = 'gui';
            elseif nargin == 2
                obj.Mode = mode;
            end
            switch obj.Mode
                case 'console'
                    
                case 'gui'
                    obj.openGUI;
                otherwise
                        
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

