function getSpeaker = savePerson (inReadDatabase)
%SAVESPEAKER This Function splits and saves the Speakers in a 160x1 cell.

x = 2;
getSpeaker = {1};

%For loop to split the Speaker-Data
    for i=x:3:479;
        getSpeaker{(i+1)/3,1} = inReadDatabase(i);
    end
end