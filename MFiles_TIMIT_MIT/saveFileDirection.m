function getFileDirection = saveFileDirection(inReadDatabase)
%SAVEFILEDIRECTION This Function splits and saves the FileDirections in a
%160x1 cell.

x = 481;
getFileDirection = {1};

%For loop to split the Filedirection-Data
    for i= x:2:799
        getFileDirection{(i-479)/2,1} = strcat('../TIMIT MIT/',inReadDatabase(i),'.wav');
    end
end