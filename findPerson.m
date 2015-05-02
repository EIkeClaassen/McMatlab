function foundPerson = findPerson(loadedPerson, searchedPerson )
%FINDPERSON A function to search for the Persons in the
%Database

    if ~ischar(searchedPerson) || strcmp(searchedPerson, '') || isempty(searchedPerson)
        foundPerson = true;
    else
        foundPerson = strcmp(loadedPerson, searchedPerson);
    end
end

