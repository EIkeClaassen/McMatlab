%% loadFile should create a 160x5 cell
testLoad = loadFile();
isCorrectSize = [160,5] == size(testLoad);
%assert(exist('../TIMIT MIT/', 'dir') == 2, 'Direction was not found')
assert(isa(testLoad,'cell'), 'The Class is not type of cell')
assert(isCorrectSize(1) && isCorrectSize(2), 'Wrong Size')

%% loadFile of dir '../TIMIT MIT/'
testLoad = loadFile('../TIMIT MIT/');
isCorrectSize = [160,5] == size(testLoad);
%assert(exist('../TIMIT MIT/', 'dir') == 2, 'Direction was not found')
assert(isa(testLoad,'cell'), 'The Class is not type of cell')
assert(isCorrectSize(1) && isCorrectSize(2), 'Wrong Size')

%% loadFile with two Directions
testLoad = loadFile('../TIMIT MIT/','../Test/');
isCorrectSize = [0,0] == size(testLoad);
%assert(exist('../TIMIT MIT/', 'dir') == 2, 'Direction was not found')
assert(isa(testLoad,'cell'), 'The Class is not type of cell')
assert(isCorrectSize(1) && isCorrectSize(2), 'Wrong Size')

%% loadFile with a number argument
testLoad = loadFile(1);
isCorrectSize = [160,5] == size(testLoad);
%assert(exist('../TIMIT MIT/', 'dir') == 2, 'Direction was not found')
assert(isa(testLoad,'cell'), 'The Class is not type of cell')
assert(isCorrectSize(1) && isCorrectSize(2), 'Wrong Size')