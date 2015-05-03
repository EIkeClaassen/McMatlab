classdef AudioPlayer
%AUDIOPLAYER

    properties (SetAccess = private)
        Player
        Filename
        Fs
        NBits
        Data
    end
    
    methods
        function obj = AudioPlayer(filename)
             info = audioinfo(filename);
             obj.Fs = info.SampleRate;
             obj.Filename = filename;
             obj.NBits = info.BitsPerSample;
             obj.Data = audioread(obj.Filename);
             obj.Player = audioplayer(obj.Data,obj.Fs,obj.NBits);
        end
    end
end