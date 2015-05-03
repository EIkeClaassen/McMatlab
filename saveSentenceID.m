function getSentenceName = saveSentenceID (inReadDatabase)
%SAVESENTENCENAME This Function splits and saves the Name of evere sentence
%in a 160x1 cell.

x = 3;
getSentenceName = {1};

%For loop to split Sentence Name-Data
    for i=x:3:480;
      getSentenceName{i/3,1} = inReadDatabase(i);
    end
end