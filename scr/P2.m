function varargout = P2(varargin)
% P2 MATLAB code for P2.fig
%      P2, by itself, creates a new P2 or raises the existing
%      singleton*.
%
%      H = P2 returns the handle to a new P2 or the handle to
%      the existing singleton*.
%
%      P2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P2.M with the given input arguments.
%
%      P2('Property','Value',...) creates a new P2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before P2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to P2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help P2

% Last Modified by GUIDE v2.5 17-Apr-2023 13:50:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @P2_OpeningFcn, ...
                   'gui_OutputFcn',  @P2_OutputFcn, ...
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


% --- Executes just before P2 is made visible.
function P2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to P2 (see VARARGIN)

% Choose default command line output for P2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes P2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = P2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in Bessel.
function Bessel_Callback(hObject, eventdata, handles)
% hObject    handle to Bessel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global retardo Desatt f nbtp
retardo=handles.retardo;
Desatt=handles.Desatt;
f=handles.f;
loge=0.43429448190;

if retardo==0 || Desatt<=0 || f<=0
    warndlg('Función de Transferencia Indeterminada, se recomienda ingresar otras especificaciones de diseño','Advertencia');
    else
nbtp=round((5*(((2*pi*f)*retardo)^2)*loge/Desatt)+1/2);
set(handles.nbt,'string',num2str(nbtp));
    end

% --- Executes on button press in r1.
function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
P2('visible','off')
orden

% --- Executes on button press in ftbt_lp.
function ftbt_lp_Callback(hObject, eventdata, handles)
% hObject    handle to ftbt_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global retardo Desatt f nbtp
    if retardo==0 || Desatt<=0 || f<=0
    warndlg('Función de Transferencia Indeterminada, se recomienda ingresar otras especificaciones de diseño','Advertencia');
    else
    set(gcf,'visible','off');
    ftelip(retardo,Desatt,f,nbtp)
    end

% --- Executes on button press in fin3.
function fin3_Callback(hObject, eventdata, handles)
% hObject    handle to fin3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all


% function nbt_Callback(hObject, eventdata, handles)
% % hObject    handle to nbt (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of nbt as text
% %        str2double(get(hObject,'String')) returns contents of nbt as a double


% --- Executes during object creation, after setting all properties.
function nbt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
