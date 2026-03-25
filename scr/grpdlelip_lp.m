function varargout = grpdlelip_lp(varargin)
% GRPDLELIP_LP MATLAB code for grpdlelip_lp.fig
%      GRPDLELIP_LP, by itself, creates a new GRPDLELIP_LP or raises the existing
%      singleton*.
%
%      H = GRPDLELIP_LP returns the handle to a new GRPDLELIP_LP or the handle to
%      the existing singleton*.
%
%      GRPDLELIP_LP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRPDLELIP_LP.M with the given input arguments.
%
%      GRPDLELIP_LP('Property','Value',...) creates a new GRPDLELIP_LP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grpdlelip_lp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grpdlelip_lp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grpdlelip_lp

% Last Modified by GUIDE v2.5 24-Apr-2023 14:17:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grpdlelip_lp_OpeningFcn, ...
                   'gui_OutputFcn',  @grpdlelip_lp_OutputFcn, ...
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


% --- Executes just before grpdlelip_lp is made visible.
function grpdlelip_lp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grpdlelip_lp (see VARARGIN)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt valbot
nbtp=varargin{1}
sysbess=varargin{2}
%%%kbt=varargin{3}
%%%zbt=varargin{4}
%%%pbt=varargin{5}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}
% Choose default command line output for grpdlelip_lp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grpdlelip_lp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grpdlelip_lp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt
%%bg=[numbt*abs(kbt)];
bg=[numbt];
ag=[denbt];
[he,w] = freqs(bg,ag,10000);
grpdel = (-1)*diff(unwrap(angle(he)))./diff(w);
wx=-w;
w=flipud(w);
w(end+1)=0;
w=[w;wx];
grpdelx=grpdel;
grpdel=flipud(grpdel);
grpdel(end+1)=grpdel(end,end);
grpdel(end+1)=grpdel(end,end);
grpdel=[grpdel;grpdelx];

hold on
semilogx(w(2:end),grpdel,'r')
set(findall(gcf,'type','line'),'linewidth',1.3)
hold off
grid on
xlabel('Frecuencia (rad/s)');
ylabel('Retardo de grupo (s)');
legend('Bessel-Thomson');
axes(handles.grpdel_elip);

% --- Executes on button press in fine3.
function fine3_Callback(hObject, eventdata, handles)
% hObject    handle to fine3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in redelip_lp.
function redelip_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redelip_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt vrs valbot
vrs=handles.vrs
if vrs<=0 || ~isnumeric(vrs) || ~isreal(vrs) || isnan(vrs)
warndlg('Ingresar un valor de resistencia interna numerico, real mayor que cero','Advertencia');
else
cla(handles.grpdel_elip,'reset')
set(gcf,'visible','off');
%%%redelip_lp(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt)
redelip_lp(nbtp,sysbess,numbt,denbt,valbot,vrs)
end

% --- Executes on button press in regthom1.
function regthom1_Callback(hObject, eventdata, handles)
% hObject    handle to regthom1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.grpdel_elip,'reset')
set(gcf,'visible','off');
orden



function vrs_Callback(hObject, eventdata, handles)
% hObject    handle to vrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vrs as text
%        str2double(get(hObject,'String')) returns contents of vrs as a double
vrs=get(hObject,'String'); 
vrs=str2double(vrs); 
handles.vrs=vrs;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function vrs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vrs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
