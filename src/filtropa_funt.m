function varargout = filtropa_funt(varargin)
% FILTROPA_FUNT MATLAB code for filtropa_funt.fig
%      FILTROPA_FUNT, by itself, creates a new FILTROPA_FUNT or raises the existing
%      singleton*.
%
%      H = FILTROPA_FUNT returns the handle to a new FILTROPA_FUNT or the handle to
%      the existing singleton*.
%
%      FILTROPA_FUNT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_FUNT.M with the given input arguments.
%
%      FILTROPA_FUNT('Property','Value',...) creates a new FILTROPA_FUNT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_funt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_funt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_funt

% Last Modified by GUIDE v2.5 07-Oct-2022 22:16:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_funt_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_funt_OutputFcn, ...
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


% --- Executes just before filtropa_funt is made visible.
function filtropa_funt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_funt (see VARARGIN)
global np wc ws wsp amax amin nch1
np=varargin{1};
wc=varargin{2};
ws=varargin{3};
wsp=varargin{4};
amax=varargin{5};
amin=varargin{6};
nch1=varargin{7};
% Choose default command line output for filtropa_funt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_funt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtropa_funt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1 p2 sysp syspmin np amax wsp amin
set(handles.ft_pa_lp,'String'," ")
p1=0;
p2=0;
sysp=funpas_optbandstop(np,amax);
[syspmin]=funpas_optbandpas(np,wsp,amin);
% --- Executes on button press in filtropa_Opt_bp.
function filtropa_Opt_bp_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_bp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np amax sysp p1
p1=get(handles.filtropa_Opt_bp,'Value');
ftpa_lp_obp=evalc('sysp');
set(handles.ft_pa_lp,'string',ftpa_lp_obp);

% --- Executes on button press in filtropa_Opt_br.
function filtropa_Opt_br_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_br (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np wsp amin syspmin p2
p2=get(handles.filtropa_Opt_br,'Value');
ftpa_lp_obpmin=evalc('syspmin');
set(handles.ft_pa_lp,'string',ftpa_lp_obpmin);

% --- Executes on button press in rf_palp.
function rf_palp_Callback(hObject, eventdata, handles)
% hObject    handle to rf_palp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np wc ws wsp amax amin nch1 sysp syspmin p1 p2
if p1==0 && p2==0
warndlg('Generate Transfer Function','Warning');
else
set(gcf,'visible','off');
filtropa_rf(np,wc,ws,wsp,amax,amin,nch1,sysp,syspmin)
end

% --- Executes on button press in finpasc.
function finpasc_Callback(hObject, eventdata, handles)
% hObject    handle to finpasc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all
