function varargout = bessrfz(varargin)
% BESSRFZ MATLAB code for bessrfz.fig
%      BESSRFZ, by itself, creates a new BESSRFZ or raises the existing
%      singleton*.
%
%      H = BESSRFZ returns the handle to a new BESSRFZ or the handle to
%      the existing singleton*.
%
%      BESSRFZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BESSRFZ.M with the given input arguments.
%
%      BESSRFZ('Property','Value',...) creates a new BESSRFZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bessrfz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bessrfz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bessrfz

% Last Modified by GUIDE v2.5 12-Oct-2022 13:02:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bessrfz_OpeningFcn, ...
                   'gui_OutputFcn',  @bessrfz_OutputFcn, ...
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


% --- Executes just before bessrfz is made visible.
function bessrfz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bessrfz (see VARARGIN)
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
% Choose default command line output for bessrfz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bessrfz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bessrfz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global sysbess
h=bodeoptions; 
h.FreqUnits='Hz';
%h.PhaseVisible='off';
bodeplot(sysbess,h,'red')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.berfz);
legend('Bessel-Thomson LP')

% --- Executes on button press in finbes2.
function finbes2_Callback(hObject, eventdata, handles)
% hObject    handle to finbes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in begrpdelz.
function begrpdelz_Callback(hObject, eventdata, handles)
% hObject    handle to begrpdelz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
set(gcf,'visible','off');
begrpdelz(nbtp,sysbess,numbt,denbt,valbot,vrs,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)
%%%begrpdelz(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi,znbes)

% --- Executes on button press in bereg1.
function bereg1_Callback(hObject, eventdata, handles)
% hObject    handle to bereg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
