function varargout = filtropa_rf(varargin)
% FILTROPA_RF MATLAB code for filtropa_rf.fig
%      FILTROPA_RF, by itself, creates a new FILTROPA_RF or raises the existing
%      singleton*.
%
%      H = FILTROPA_RF returns the handle to a new FILTROPA_RF or the handle to
%      the existing singleton*.
%
%      FILTROPA_RF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_RF.M with the given input arguments.
%
%      FILTROPA_RF('Property','Value',...) creates a new FILTROPA_RF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_rf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_rf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_rf

% Last Modified by GUIDE v2.5 27-Oct-2022 16:46:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_rf_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_rf_OutputFcn, ...
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


% --- Executes just before filtropa_rf is made visible.
function filtropa_rf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_rf (see VARARGIN)
global np wc ws wsp amax amin nch1 sysp syspmin
np=varargin{1};
wc=varargin{2};
ws=varargin{3};
wsp=varargin{4};
amax=varargin{5};
amin=varargin{6};
nch1=varargin{7};
sysp=varargin{8};
syspmin=varargin{9};

% Choose default command line output for filtropa_rf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_rf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtropa_rf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1 p2
cla(handles.palp_rf,'reset')
p1=0;
p2=0;
% --- Executes on button press in regpa1.
function regpa1_Callback(hObject, eventdata, handles)
% hObject    handle to regpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np wc ws wsp amax amin nch1 p1 p2
if p1==0 && p2==0
warndlg('Generate Frequency Response','Warning');
else
set(gcf,'visible','off');
filtropa_ft_realideal(np,wc,ws,wsp,amax,amin,nch1)
end

% --- Executes on button press in filtropa_Opt_bp_rf.
function filtropa_Opt_bp_rf_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_bp_rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysp p1
p1=get(handles.filtropa_Opt_bp_rf,'Value');
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysp,h,'green')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.palp_rf);
legend('Pascal OBR - LP')

% --- Executes on button press in filtropa_Opt_br_rf.
function filtropa_Opt_br_rf_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_br_rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syspmin p2
p2=get(handles.filtropa_Opt_br_rf,'Value');
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspmin,h,'b')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.palp_rf);
legend('Pascal OBP - LP')

% --- Executes on button press in finxs.
function finxs_Callback(hObject, eventdata, handles)
% hObject    handle to finxs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all
