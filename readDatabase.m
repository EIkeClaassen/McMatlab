function inReadDatabase = readDatabase(varargin)
%READDATABASE This Function opens all .txt Files and reads in the
%important files.

    %opens the allphonelist.txt and save the Data in a variable.
    allPhoneListID = fopen([varargin{1}, 'allphonelist.txt']);
    directionAndPhonems = fscanf(allPhoneListID, '%c');
    fclose(allPhoneListID);

    %opens the allsenlist.txt and save the Data in a variable.
    allSenListID = fopen([varargin{1}, 'allsenlist.txt']);
    sentenceID = fscanf(allSenListID, '%c');
    fclose(allSenListID);

    %opens the allfilelist.txt and save the Data in a variable.
    allFileListID = fopen([varargin{1}, 'allfilelist.txt']);
    personAndSentence = fscanf(allFileListID, '%c');
    fclose(allFileListID);

    %defines the expressions for the regexp function
    splitDirectionAndPhonems = '[a-z\-\/\d]+(?=\t)|(?<=#\ )[a-z\-\ ]+(?=\ h#)';
    splitSentenceID = '(?<=\t)[a-z''\ ]+';
    splitPersonAndSentence = '(?<=\-)[mf]|[a-z]{3}\d(?=\/)|(?<=\/)[a-z]{2}\d+';

    %uses the regexp function to split the .txt Data in Strings
    getDirectionAndPhone = regexp(directionAndPhonems,splitDirectionAndPhonems,'match');
    getSentence = regexp(sentenceID,splitSentenceID,'match');
    getPersonAndSentence = regexp(personAndSentence,splitPersonAndSentence,'match');
    inReadDatabase = [getPersonAndSentence,getDirectionAndPhone,getSentence];
end

