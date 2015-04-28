classdef AudioFile
%AUDIOFILE is a class which reads audioinformations of a given direction
%and has the function to play or give out the information of the .wav Data. 

    properties (SetAccess = private)
        Filename
        Fs
        Channels
        NBits
        Player
    end
    
    methods
        function obj = AudioFile(filename, fs)
            if exist(filename, 'file') == 2
                info = audioinfo(filename);
                obj.Fs = info.SampleRate;
                obj.Filename = filename;
                obj.NBits = info.BitsPerSample;
            else
                audiowrite(filename, (0), fs);
                obj.Fs = fs;
                obj.Filename = filename;
            end
        end
        
        function data = read(obj, range)
            if nargin == 1
                data = audioread(obj.Filename);
            else
                data = audioread(obj.Filename, range);
            end
        end
        
        function write(obj, data)
            audiowrite(obj.Filename, data, obj.Fs);
        end
        
        function append(obj, data)
            old_data = obj.read();
            obj.write([old_data; data(:)]);
        end
        
        function metadata = info(obj)
            metadata = audioinfo(obj.Filename);
        end
        
        function ch = get.Channels(obj)
            ch = obj.info().NumChannels;
        end
        
        function play(obj)
            sound(obj.read(), obj.Fs, obj.NBits)
        end
        
        function Player = createPlayer(obj)
            Player = audioplayer(obj.read(),obj.Fs,obj.NBits);
        end
    end
end