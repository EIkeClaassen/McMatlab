function foundGender = findGender(loadedGender,searchedGender)
%FINDGENDER A function to search for the Gender of the Speakers in the
%Database

    if ~ischar(searchedGender) || strcmp(searchedGender, '') || isempty(searchedGender)
        foundGender = true;
    else
        foundGender = strcmp(loadedGender, searchedGender);
    end
end

