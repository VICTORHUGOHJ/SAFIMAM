function varargout = ftelip(varargin)
% FTELIP MATLAB code for ftelip.fig
%      FTELIP, by itself, creates a new FTELIP or raises the existing
%      singleton*.
%
%      H = FTELIP returns the handle to a new FTELIP or the handle to
%      the existing singleton*.
%
%      FTELIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTELIP.M with the given input arguments.
%
%      FTELIP('Property','Value',...) creates a new FTELIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ftelip_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ftelip_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ftelip

% Last Modified by GUIDE v2.5 09-Oct-2022 14:50:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ftelip_OpeningFcn, ...
                   'gui_OutputFcn',  @ftelip_OutputFcn, ...
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


% --- Executes just before ftelip is made visible.
function ftelip_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ftelip (see VARARGIN)
global nbtp sysbess numbt denbt valbot
nbtp=varargin{1}
sysbess=varargin{2}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}
% Choose default command line output for ftelip
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ftelip wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ftelip_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt
%Bessel Thomson
%%%[kbt, zbt, pbt] = BESSEL_POLES(1, nbtp);
%%%numbt=poly(zbt)*abs(kbt)
%%%denbt=poly(pbt)
%%%sysbess=tf(numbt,denbt)
sysbessel=evalc('sysbess');
set(handles.ftelip,'string',sysbessel);

% --- Executes on button press in rfe1.
function rfe1_Callback(hObject, eventdata, handles)
% hObject    handle to rfe1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt valbot
set(gcf,'visible','off');
%%%rfelip_lp(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt)
rfelip_lp(nbtp,sysbess,numbt,denbt,valbot)

% --- Executes on button press in fine1.
function fine1_Callback(hObject, eventdata, handles)
% hObject    handle to fine1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all
