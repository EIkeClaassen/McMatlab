function foundGender = findGender(loadedGender,searchedGender)
%FINDGENDER Summary of this function goes here

    
    if ~ischar(searchedGender) || strcmp(searchedGender, '') || isempty(searchedGender)
        foundGender = true;
    else
        foundGender = strcmp(loadedGender, searchedGender);
    end
end

