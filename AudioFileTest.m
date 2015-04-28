%% AudioFile should create a new file
delete test.wav
f = AudioFile('test.wav', 44100);
assert( exist('test.wav', 'file') == 2, 'File was not created')
assert( f.Fs == 44100, 'Wrong Sample Rate')
assert( f.Channels == 1, 'Wrong number of channels')

%% write should write data
f = AudioFile('test.wav', 44100);
data = [0.5 0.5; 0.25 0.25];
f.write(data);
assert( all(all(f.read() == data)), 'Read data is different from written data')