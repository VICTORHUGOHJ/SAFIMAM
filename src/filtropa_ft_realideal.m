function varargout = filtropa_ft_realideal(varargin)
% FILTROPA_FT_REALIDEAL MATLAB code for filtropa_ft_realideal.fig
%      FILTROPA_FT_REALIDEAL, by itself, creates a new FILTROPA_FT_REALIDEAL or raises the existing
%      singleton*.
%
%      H = FILTROPA_FT_REALIDEAL returns the handle to a new FILTROPA_FT_REALIDEAL or the handle to
%      the existing singleton*.
%
%      FILTROPA_FT_REALIDEAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_FT_REALIDEAL.M with the given input arguments.
%
%      FILTROPA_FT_REALIDEAL('Property','Value',...) creates a new FILTROPA_FT_REALIDEAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_ft_realideal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_ft_realideal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_ft_realideal

% Last Modified by GUIDE v2.5 07-Nov-2022 08:03:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_ft_realideal_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_ft_realideal_OutputFcn, ...
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


% --- Executes just before filtropa_ft_realideal is made visible.
function filtropa_ft_realideal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_ft_realideal (see VARARGIN)
global np wc ws wsp amax amin nch1
np=varargin{1};
wc=varargin{2};
ws=varargin{3};
wsp=varargin{4};
amax=varargin{5};
amin=varargin{6};
nch1=varargin{7};
% Choose default command line output for filtropa_ft_realideal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_ft_realideal wait for user response (see UIRESUME)
% uiwait(handles.figure1);
%ftpa_lp=evalc('sysp');
%set(handles.ftbutt,'string',ftpa_lp);

% --- Outputs from this function are returned to the command line.
function varargout = filtropa_ft_realideal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ft_ideal_fpa_lp.
function ft_ideal_fpa_lp_Callback(hObject, eventdata, handles)
% hObject    handle to ft_ideal_fpa_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np wc ws wsp amax amin nch1
set(gcf,'visible','off');
filtropa_funt(np,wc,ws,wsp,amax,amin,nch1)

% --- Executes on button press in ft_real_fpa_lp.
function ft_real_fpa_lp_Callback(hObject, eventdata, handles)
% hObject    handle to ft_real_fpa_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np wc ws wsp amax amin nch1
set(gcf,'visible','off');
filtropa_ftreal(np,wc,ws,wsp,amax,amin,nch1)

% --- Executes on button press in finpa1.
function finpa1_Callback(hObject, eventdata, handles)
% hObject    handle to finpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all


% --- Executes on button press in elegir.
function elegir_Callback(hObject, eventdata, handles)
% hObject    handle to elegir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
