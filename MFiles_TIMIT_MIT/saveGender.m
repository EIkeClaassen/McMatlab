function getGender = saveGender(inReadDatabase)
% SAVEGENDER This Function splits and saves the Genders in a 160x1 cell.

x = 1;
getGender = {1};

%For loop to split the Gender-Data
    for i= x:3:478
        getGender{(i+2)/3,1} = inReadDatabase(i);
    end
end

