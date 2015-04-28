function getSentence = saveSentence (inReadDatabase)
%SAVESENTENCE This Function splits and saves the Sentences in a 160x1 cell.

x = 801;
getSentence = {1};

%For loop to split Sentence-Data
    for i=x:960;
      getSentence{i-800,1} = inReadDatabase(i);
    end
end