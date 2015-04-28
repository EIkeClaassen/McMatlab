function varargout = AudioSearch(varargin)
% AUDIOSEARCH MATLAB code for AudioSearch.fig
%      AUDIOSEARCH, by itself, creates a new AUDIOSEARCH or raises the existing
%      singleton*.
%
%      H = AUDIOSEARCH returns the handle to a new AUDIOSEARCH or the handle to
%      the existing singleton*.
%
%      AUDIOSEARCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIOSEARCH.M with the given input arguments.
%
%      AUDIOSEARCH('Property','Value',...) creates a new AUDIOSEARCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AudioSearch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AudioSearch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AudioSearch

% Last Modified by GUIDE v2.5 26-Apr-2015 18:53:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AudioSearch_OpeningFcn, ...
                   'gui_OutputFcn',  @AudioSearch_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AudioSearch is made visible.
function AudioSearch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AudioSearch (see VARARGIN)

% Choose default command line output for AudioSearch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AudioSearch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AudioSearch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupMenuGender.
function popupMenuGender_Callback(hObject, eventdata, handles)
% hObject    handle to popupMenuGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupMenuGender contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupMenuGender


% --- Executes during object creation, after setting all properties.
function popupMenuGender_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupMenuGender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupMenuName.
function popupMenuName_Callback(hObject, eventdata, handles)
% hObject    handle to popupMenuName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupMenuName contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupMenuName


% --- Executes during object creation, after setting all properties.
function popupMenuName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupMenuName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editDirection_Callback(hObject, eventdata, handles)
% hObject    handle to editDirection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDirection as text
%        str2double(get(hObject,'String')) returns contents of editDirection as a double


% --- Executes during object creation, after setting all properties.
function editDirection_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDirection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushButtonLoadData.
function pushButtonLoadData_Callback(hObject, eventdata, handles)
% hObject    handle to pushButtonLoadData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
direction = get(handles.editDirection,'String');
if strcmp(direction,'')
    direction = '';
end
loadDatabase(direction);



function editPhonems_Callback(hObject, eventdata, handles)
% hObject    handle to editPhonems (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editPhonems as text
%        str2double(get(hObject,'String')) returns contents of editPhonems as a double


% --- Executes during object creation, after setting all properties.
function editPhonems_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editPhonems (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editWord_Callback(hObject, eventdata, handles)
% hObject    handle to editWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWord as text
%        str2double(get(hObject,'String')) returns contents of editWord as a double


% --- Executes during object creation, after setting all properties.
function editWord_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSentenceID_Callback(hObject, eventdata, handles)
% hObject    handle to editSentenceID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSentenceID as text
%        str2double(get(hObject,'String')) returns contents of editSentenceID as a double


% --- Executes during object creation, after setting all properties.
function editSentenceID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSentenceID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushButtonSearchData.
function pushButtonSearchData_Callback(~, ~, handles)
% hObject    handle to pushButtonSearchData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on selection change in listboxResults.
function listboxResults_Callback(hObject, eventdata, handles)
% hObject    handle to listboxResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxResults contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxResults


% --- Executes during object creation, after setting all properties.
function listboxResults_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxResults (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushButtonPlay.
function pushButtonPlay_Callback(hObject, eventdata, handles)
% hObject    handle to pushButtonPlay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushButtonStopp.
function pushButtonStopp_Callback(hObject, eventdata, handles)
% hObject    handle to pushButtonStopp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
