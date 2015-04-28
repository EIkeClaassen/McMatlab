function getPhonem = savePhonem (inReadDatabase)
%SAVEPHONEMS This Function splits and saves the Phonems in a 160x1 cell.

x = 482;
getPhonem = {1};

%For loop to split the Phonems-Data
    for i=x:2:800;
      getPhonem{(i-480)/2,1} = inReadDatabase(i);
    end
end
