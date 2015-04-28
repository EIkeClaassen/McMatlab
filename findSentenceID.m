function foundSentenceID = findSentenceID(loadedSentenceID,searchedSentenceID)
%FINDSENTENCEID of this function goes here

    
    if ~ischar(searchedSentenceID) || strcmp(searchedSentenceID, '')
        foundSentenceID = true;
    else
        foundSentenceID = strcmp(loadedSentenceID, searchedSentenceID);
    end
end

