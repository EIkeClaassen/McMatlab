function foundSentenceID = findSentenceID(loadedSentenceID,searchedSentenceID)
%FINDSENTENCEID A function to search for the SentenceID in the
%Database

    if ~ischar(searchedSentenceID) || strcmp(searchedSentenceID, '') || isempty(searchedSentenceID)
        foundSentenceID = true;
    else
        foundSentenceID = strcmp(loadedSentenceID, searchedSentenceID);
    end
end

