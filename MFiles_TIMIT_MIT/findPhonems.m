function foundPhonems = findPhonems(loadedPhonems, searchedPhonems)
%FINDPHONEMS A function to split the Phonems and search for them separately 
%in the Database

    if ~ischar(searchedPhonems) || strcmp(searchedPhonems, '') || isempty(searchedPhonems)
        foundPhonems = true;
    else
        NumberOfMatches = 0;
        splitPhonems = regexpi(searchedPhonems,',','split');
        for i = 1:length(splitPhonems)
            expression = strcat('(?<![a-z])',splitPhonems{i},'(?![a-z])');
            if ~isempty(regexpi(loadedPhonems, expression, 'once'));
               NumberOfMatches = NumberOfMatches + 1; 
            end
        end
        if NumberOfMatches == length(splitPhonems)
            foundPhonems = true;
        else
            foundPhonems = false;
        end
    end
end

