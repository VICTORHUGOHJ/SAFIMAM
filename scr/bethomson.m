function varargout = bethomson(varargin)
% BETHOMSON MATLAB code for bethomson.fig
%      BETHOMSON, by itself, creates a new BETHOMSON or raises the existing
%      singleton*.
%
%      H = BETHOMSON returns the handle to a new BETHOMSON or the handle to
%      the existing singleton*.
%
%      BETHOMSON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BETHOMSON.M with the given input arguments.
%
%      BETHOMSON('Property','Value',...) creates a new BETHOMSON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bethomson_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bethomson_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bethomson

% Last Modified by GUIDE v2.5 18-Apr-2023 18:27:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bethomson_OpeningFcn, ...
                   'gui_OutputFcn',  @bethomson_OutputFcn, ...
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


% --- Executes just before bethomson is made visible.
function bethomson_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bethomson (see VARARGIN)

% Choose default command line output for bethomson
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bethomson wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bethomson_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1 vose voce nbtp_1 nbtp_2
vose=0;
voce=0;
nbtp_1=0;
nbtp_2=0;
p1=0;

findEdtTxt=findall(gcf,'Style','Edit');
set(findEdtTxt,'String','')
set(handles.nbt,'String','')


function retardo_Callback(hObject, eventdata, handles)
% hObject    handle to retardo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of retardo as text
%        str2double(get(hObject,'String')) returns contents of retardo as a double
retardo=get(hObject,'String'); 
retardo=str2double(retardo); 
handles.retardo=retardo;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function retardo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to retardo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double
f=get(hObject,'String'); 
f=str2double(f); 
handles.f=f;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Desatt_Callback(hObject, eventdata, handles)
% hObject    handle to Desatt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Desatt as text
%        str2double(get(hObject,'String')) returns contents of Desatt as a double
Desatt=get(hObject,'String'); 
Desatt=str2double(Desatt);
handles.Desatt=Desatt;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function Desatt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Desatt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global retardo Desatt f nbtp p1 vose voce nbtp_1 nbtp_2
retardo=handles.retardo;
Desatt=handles.Desatt;
f=handles.f;
if voce==1

loge=0.43429448190;
p1=get(handles.pushbutton1,'Value');
if retardo<=0 || ~isnumeric(retardo) || ~isreal(retardo) || isnan(retardo) || Desatt<=0 || ~isnumeric(Desatt) || ~isreal(Desatt) || isnan(Desatt) || f<=0 || ~isnumeric(f) || ~isreal(f) || isnan(f)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
p1=0; 
else

nbtp_1=round((5*(((2*pi*f)*retardo)^2)*loge/Desatt)+1/2);
nbtp_2=0;

 if nbtp_1>=22 || nbtp_1<=1 || ~isnumeric(nbtp_1) || ~isreal(nbtp_1)
   warndlg('The resulting Filter Order is greater than 22 therefore Network synthesis is Not Available, it is recommended to choose other specifications or enter a filter order in the range of 2 to 21','Warning');
nbtp_1=0;
 else
set(handles.nbt,'string',num2str(nbtp_1));
 end

end

else
nbtp_1=0;
nbtp_2=0;
Desatt=0;
f=0;
retardo=0;
retardo=handles.retardo;
Desatt=handles.Desatt;
f=handles.f;
p1=0;
set(handles.nbt,'string',num2str(0));
warndlg('You are executing an unselected function, choose the other option to determine the order','Warning');
end

% --- Executes on button press in r1.
function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(gcf,'visible','off');
 orden

% --- Executes on button press in ftbt_lp.
function ftbt_lp_Callback(hObject, eventdata, handles)
% hObject    handle to ftbt_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global retardo Desatt f nbtp p1 vose voce nbtp_1 nbtp_2

if voce==1
nbtp=nbtp_1;
retardo=handles.retardo;
Desatt=handles.Desatt;
f=handles.f;
    if retardo<=0 || ~isnumeric(retardo) || ~isreal(retardo) || isnan(retardo) || Desatt<=0 || ~isnumeric(Desatt) || ~isreal(Desatt) || isnan(Desatt) || f<=0 || ~isnumeric(f) || ~isreal(f) || isnan(f)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
    else
   if p1==0
       warndlg('Generate Filter Order','Warning');
   else
     if nbtp>=22 || nbtp<=1 || ~isnumeric(nbtp) || ~isreal(nbtp)
  warndlg('Network Synthesis Not Available','Warning');
     else
    set(gcf,'visible','off');
    besthomfts(nbtp)
     end
    end
    end
elseif vose==1
    nbtp=nbtp_2;
    if nbtp>=22 || nbtp<=1 || ~isnumeric(nbtp) || ~isreal(nbtp)
   warndlg('Network Synthesis Not Available','Warning');
     else
    set(gcf,'visible','off');
    besthomfts(nbtp)
    %p
    end
else
  warndlg('Generate Filter Order','Warning');
end
% --- Executes on button press in fin3.
function fin3_Callback(hObject, eventdata, handles)
% hObject    handle to fin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all


function ordsne_Callback(hObject, eventdata, handles)
% hObject    handle to ordsne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ordsne as text
%        str2double(get(hObject,'String')) returns contents of ordsne as a double

val=get(hObject,'String'); 
valo=str2double(val);
handles.ordsne=valo;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ordsne_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ordsne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt1.
function bt1_Callback(hObject, eventdata, handles)
% hObject    handle to bt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bt1
global voce vose Desatt f retardo nbtp_2 nbtp_1 nbtp
voce=get(handles.bt1,'Value');
vose=0;

findEdtTxt=findall(gcf,'Style','Edit');
set(findEdtTxt,'String','')

set(handles.nbt,'String','')

handles.retardo=0;
guidata(hObject,handles)
handles.f=0;
guidata(hObject,handles)
handles.Desatt=0;
guidata(hObject,handles)
handles.ordsne=0;
guidata(hObject,handles)

nbtp_1=0;
nbtp_2=0;
nbtp=0;

% --- Executes on button press in bt2.
function bt2_Callback(hObject, eventdata, handles)
% hObject    handle to bt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bt2
global vose voce nbtp_2 Desatt f retardo nbtp_1 nbtp
vose=get(handles.bt2,'Value');
voce=0;
nbtp_1=0;
nbtp_2=0;
nbtp=0;
Desatt=0;
f=0;
retardo=0;

findEdtTxt=findall(gcf,'Style','Edit');
set(findEdtTxt,'String','')
set(handles.nbt,'String','')

handles.retardo=0;
guidata(hObject,handles)
handles.f=0;
guidata(hObject,handles)
handles.Desatt=0;
guidata(hObject,handles)
handles.ordsne=0;
guidata(hObject,handles)

% --- Executes on button press in or2.
function or2_Callback(hObject, eventdata, handles)
% hObject    handle to or2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp_2 nbtp_1 voce vose
if vose==1
nbtp_1=0;
nbtp_2=handles.ordsne;
if nbtp_2>=22 || nbtp_2<=1 || ~isnumeric(nbtp_2) || ~isreal(nbtp_2)
nbtp_2=0;
warndlg('Enter a positive real value greater than 1 and less than 22','Warning');
else
    nbtp_2=nbtp_2;
end
else
nbtp_1=0;
nbtp_2=0;
warndlg('You are executing an unselected function, choose the other option to determine the order','Warning');
end
