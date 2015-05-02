function foundWords = findWords (loadedWords,searchedWords)
%FINDWORDS A function to split the Words and search for them separately
%in the Database

    if ~ischar(searchedWords) || strcmp(searchedWords, '') || isempty(searchedWords)
        foundWords = true;
    else
        NumberOfMatches = 0;
        splitWords = regexpi(searchedWords,',','split');
        for i = 1:length(splitWords);
            expression = strcat('(?<![a-z])',splitWords{i},'(?![a-z])');
            if ~isempty(regexpi(loadedWords, expression, 'once'));
                NumberOfMatches = NumberOfMatches + 1 ;
            end
        end
        if NumberOfMatches == length(splitWords)
            foundWords = true;
        else
            foundWords = false;
        end
    end
end

