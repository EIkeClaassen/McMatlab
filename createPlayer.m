function Player = createPlayer(obj)
%CREATEPLAYER blabla

    Player = audioplayer(obj.read(),obj.Fs,obj.NBits);

end

