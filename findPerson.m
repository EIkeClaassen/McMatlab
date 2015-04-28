function foundPerson = findPerson(loadedPerson, searchedPerson )
%FINDPERSON Summary of this function goes here

    
    if ~ischar(searchedPerson) || strcmp(searchedPerson, '')
        foundPerson = true;
    else
        foundPerson = strcmp(loadedPerson, searchedPerson);
    end
end

