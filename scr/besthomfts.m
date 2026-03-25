function varargout = besthomfts(varargin)
% BESTHOMFTS MATLAB code for besthomfts.fig
%      BESTHOMFTS, by itself, creates a new BESTHOMFTS or raises the existing
%      singleton*.
%
%      H = BESTHOMFTS returns the handle to a new BESTHOMFTS or the handle to
%      the existing singleton*.
%
%      BESTHOMFTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BESTHOMFTS.M with the given input arguments.
%
%      BESTHOMFTS('Property','Value',...) creates a new BESTHOMFTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before besthomfts_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to besthomfts_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help besthomfts

% Last Modified by GUIDE v2.5 20-Apr-2023 13:43:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @besthomfts_OpeningFcn, ...
                   'gui_OutputFcn',  @besthomfts_OutputFcn, ...
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


% --- Executes just before besthomfts is made visible.
function besthomfts_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to besthomfts (see VARARGIN)
global nbtp
nbtp=varargin{1};
% Choose default command line output for besthomfts
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes besthomfts wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = besthomfts_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global nbtp numbt denbt sysbess numbt_1 denbt_1 sysbess_1 numbt_2 denbt_2 sysbess_2 yn_norm valbot
valbot=0;
%Bessel Thomson con retardo de grupo en el origen de 1 seg
syms s w
numbt_1=(factorial(2*nbtp))/((2^nbtp)*(factorial(0))*(factorial(nbtp)));
yn=0;
for k=0:1:nbtp
yn=yn+((factorial(2*nbtp-k))*(s^k))/((2^(nbtp-k))*(factorial(k))*(factorial(nbtp-k)));
end
denbt_1=sym2poly(yn);
sysbess_1=tf(numbt_1,denbt_1);
%Bessel-Thomson con wc=1 rad/seg
s=j*w;
yn_jw=eval(yn);
yn_jw=sym2poly(yn_jw);
u=(poly2sym(real(yn_jw)))^2;
v=(poly2sym(imag(yn_jw)))^2;
e=u+v-(numbt_1/0.7077)^2;
syms s x
x=s;
e=eval(e);
p=sym2poly(e);
wc=roots(p);
wc_pos=wc(wc>0);
wc_pos=sort(wc_pos);
wc=wc_pos(1,1);
syms s
s=s*wc;
yn_norm=eval(yn);
numbt_2=numbt_1;
denbt_2=sym2poly(yn_norm);
sysbess_2=tf(numbt_2,denbt_2);


% --- Executes on button press in funtran1.
function funtran1_Callback(hObject, eventdata, handles)
% hObject    handle to funtran1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt numbt_1 denbt_1 sysbess_1 valbot
valbot=2;
%%%%%%%%%%%%%%%%%%%guardar valor de boton

numbt=numbt_1; 
denbt=denbt_1;
sysbess=sysbess_1;
set(gcf,'visible','off');
ftelip(nbtp,sysbess,numbt,denbt,valbot)

% --- Executes on button press in funtran2.
function funtran2_Callback(hObject, eventdata, handles)
% hObject    handle to funtran2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt numbt_2 denbt_2 sysbess_2 valbot
valbot=get(handles.funtran2,'Value');
numbt=numbt_2; 
denbt=denbt_2;
sysbess=sysbess_2;
set(gcf,'visible','off');
ftelip(nbtp,sysbess,numbt,denbt,valbot)



% --- Executes on button press in funtran3.
function funtran3_Callback(hObject, eventdata, handles)
% hObject    handle to funtran3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt numbt_2 fcbt yn_norm valbot
fcbt=handles.fcbt;
valbot=get(handles.funtran3,'Value');
if fcbt<=0 || ~isnumeric(fcbt) || ~isreal(fcbt) || isnan(fcbt)
warndlg('Enter an actual numerical frequency value greater than zero','Warning');
else
%Bessel-Thomson con frecuencia de corte deseada
syms s
wc_f=2*pi*fcbt;
s=s/wc_f;
yn_frec=eval(yn_norm);
numbt=numbt_2; 
denbt=sym2poly(yn_frec);
sysbess=tf(numbt,denbt);
set(gcf,'visible','off');
ftelip(nbtp,sysbess,numbt,denbt,valbot)
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   set(gcf,'visible','off');
   bethomson

% --- Executes on button press in fina.
function fina_Callback(hObject, eventdata, handles)
% hObject    handle to fina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all



function fcbt_Callback(hObject, eventdata, handles)
% hObject    handle to fcbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fcbt as text
%        str2double(get(hObject,'String')) returns contents of fcbt as a double
fcbt=get(hObject,'String'); 
fcbt=str2double(fcbt);
handles.fcbt=fcbt;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function fcbt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fcbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in funtran4.
function funtran4_Callback(hObject, eventdata, handles)
% hObject    handle to funtran4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt tgcero valbot
valbot=get(handles.funtran4,'Value');
tgcero=handles.tgcero;
if tgcero==1
    valbot=2;
else
    valbot;    
end

if tgcero<=0 || ~isnumeric(tgcero) || ~isreal(tgcero) || isnan(tgcero)
warndlg('Enter an actual numerical frequency value greater than zero','Warning');
else
[kbt, zbt, pbt] = BESSEL_POLES(tgcero, nbtp);
numbt=poly(zbt)*abs(kbt);
denbt=poly(pbt);
sysbess=tf(numbt,denbt);
set(gcf,'visible','off');
ftelip(nbtp,sysbess,numbt,denbt,valbot)
end


function tgcero_Callback(hObject, eventdata, handles)
% hObject    handle to tgcero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tgcero as text
%        str2double(get(hObject,'String')) returns contents of tgcero as a double
tgcero=get(hObject,'String'); 
tgcero=str2double(tgcero);
handles.tgcero=tgcero;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function tgcero_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tgcero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
