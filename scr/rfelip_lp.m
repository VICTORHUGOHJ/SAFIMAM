function varargout = rfelip_lp(varargin)
% RFELIP_LP MATLAB code for rfelip_lp.fig
%      RFELIP_LP, by itself, creates a new RFELIP_LP or raises the existing
%      singleton*.
%
%      H = RFELIP_LP returns the handle to a new RFELIP_LP or the handle to
%      the existing singleton*.
%
%      RFELIP_LP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RFELIP_LP.M with the given input arguments.
%
%      RFELIP_LP('Property','Value',...) creates a new RFELIP_LP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rfelip_lp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rfelip_lp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rfelip_lp

% Last Modified by GUIDE v2.5 28-Oct-2022 07:03:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rfelip_lp_OpeningFcn, ...
                   'gui_OutputFcn',  @rfelip_lp_OutputFcn, ...
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


% --- Executes just before rfelip_lp is made visible.
function rfelip_lp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rfelip_lp (see VARARGIN)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt valbot
nbtp=varargin{1}
sysbess=varargin{2}
%%kbt=varargin{3}
%%zbt=varargin{4}
%%pbt=varargin{5}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}

% Choose default command line output for rfelip_lp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rfelip_lp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rfelip_lp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global sysbess
h=bodeoptions; 
%h.FreqUnits='Hz';
%h.PhaseVisible='off';
bodeplot(sysbess,h,'red')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfelip);
legend('Bessel-Thomson LP')

% --- Executes on button press in fine2.
function fine2_Callback(hObject, eventdata, handles)
% hObject    handle to fine2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in groupdelay.
function groupdelay_Callback(hObject, eventdata, handles)
% hObject    handle to groupdelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt valbot
set(gcf,'visible','off');
%%%grpdlelip_lp(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt)
grpdlelip_lp(nbtp,sysbess,numbt,denbt,valbot)


% --- Executes on button press in regthom2.
function regthom2_Callback(hObject, eventdata, handles)
% hObject    handle to regthom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
