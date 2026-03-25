function varargout = begrpdelz(varargin)
% BEGRPDELZ MATLAB code for begrpdelz.fig
%      BEGRPDELZ, by itself, creates a new BEGRPDELZ or raises the existing
%      singleton*.
%
%      H = BEGRPDELZ returns the handle to a new BEGRPDELZ or the handle to
%      the existing singleton*.
%
%      BEGRPDELZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BEGRPDELZ.M with the given input arguments.
%
%      BEGRPDELZ('Property','Value',...) creates a new BEGRPDELZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before begrpdelz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to begrpdelz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help begrpdelz

% Last Modified by GUIDE v2.5 12-Oct-2022 13:04:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @begrpdelz_OpeningFcn, ...
                   'gui_OutputFcn',  @begrpdelz_OutputFcn, ...
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


% --- Executes just before begrpdelz is made visible.
function begrpdelz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to begrpdelz (see VARARGIN)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
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
znbes=varargin{15}
% Choose default command line output for begrpdelz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes begrpdelz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = begrpdelz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%%%global kbt numbt denbt
global numbt denbt
%%%bg=[numbt*abs(kbt)];
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
axes(handles.begrpz);

% --- Executes on button press in finbes3.
function finbes3_Callback(hObject, eventdata, handles)
% hObject    handle to finbes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in belpredz.
function belpredz_Callback(hObject, eventdata, handles)
% hObject    handle to belpredz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
cla(handles.begrpz,'reset')
set(gcf,'visible','off');
bessredlpz(nbtp,sysbess,numbt,denbt,valbot,vrs,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)
%%%bessredlpz(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)

% --- Executes on button press in bereg2.
function bereg2_Callback(hObject, eventdata, handles)
% hObject    handle to bereg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.begrpz,'reset')
set(gcf,'visible','off');
orden
