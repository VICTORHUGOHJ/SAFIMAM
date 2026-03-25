function varargout = bethom_tranz(varargin)
% BETHOM_TRANZ MATLAB code for bethom_tranz.fig
%      BETHOM_TRANZ, by itself, creates a new BETHOM_TRANZ or raises the existing
%      singleton*.
%
%      H = BETHOM_TRANZ returns the handle to a new BETHOM_TRANZ or the handle to
%      the existing singleton*.
%
%      BETHOM_TRANZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BETHOM_TRANZ.M with the given input arguments.
%
%      BETHOM_TRANZ('Property','Value',...) creates a new BETHOM_TRANZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bethom_tranz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bethom_tranz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bethom_tranz

% Last Modified by GUIDE v2.5 12-Oct-2022 12:59:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bethom_tranz_OpeningFcn, ...
                   'gui_OutputFcn',  @bethom_tranz_OutputFcn, ...
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


% --- Executes just before bethom_tranz is made visible.
function bethom_tranz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bethom_tranz (see VARARGIN)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi
nbtp=varargin{1}
sysbess=varargin{2}
%%%kbt=varargin{3}
%%%zbt=varargin{4}
%%%pbt=varargin{5}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}
vrs=varargin{6}
Lbett_f=varargin{7}
indpa=varargin{8}
Cbett_f=varargin{9}
capa=varargin{10}
Lbetpi_f=varargin{11}
indpa_pi=varargin{12}
Cbetpi_f=varargin{13}
capa_pi=varargin{14}

% Choose default command line output for bethom_tranz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bethom_tranz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bethom_tranz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%set(handles.znbes,'String'," ")
%set(handles.znbes,'String'," ")
set(handles.bess_ft_z,'String'," ")

% --- Executes on button press in ftlpbe_tranz.
function ftlpbe_tranz_Callback(hObject, eventdata, handles)
% hObject    handle to ftlpbe_tranz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global znbes sysbess
znbes=handles.znbes;
if znbes<=0 || ~isnumeric(znbes) || ~isreal(znbes) || isnan(znbes)
warndlg('Ingresar Impedancia de Normalización real numerica','Advertencia');
else
sysbes_lp_z=evalc('sysbess');
set(handles.bess_ft_z,'string',sysbes_lp_z);

end

function znbes_Callback(hObject, eventdata, handles)
% hObject    handle to znbes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of znbes as text
%        str2double(get(hObject,'String')) returns contents of znbes as a double
znbes=get(hObject,'String'); 
znbes=str2double(znbes);
handles.znbes=znbes;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function znbes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to znbes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finbes1.
function finbes1_Callback(hObject, eventdata, handles)
% hObject    handle to finbes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in belp_refrez.
function belp_refrez_Callback(hObject, eventdata, handles)
% hObject    handle to belp_refrez (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
znbes=handles.znbes;
if znbes<=0 || ~isnumeric(znbes) || ~isreal(znbes) || isnan(znbes)
warndlg('Ingresar Impedancia de Normalización real numerica','Advertencia');
else
set(gcf,'visible','off');
%%%bessrfz(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)
bessrfz(nbtp,sysbess,numbt,denbt,valbot,vrs,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)
end
