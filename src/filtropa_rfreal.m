function varargout = filtropa_rfreal(varargin)
% FILTROPA_RFREAL MATLAB code for filtropa_rfreal.fig
%      FILTROPA_RFREAL, by itself, creates a new FILTROPA_RFREAL or raises the existing
%      singleton*.
%
%      H = FILTROPA_RFREAL returns the handle to a new FILTROPA_RFREAL or the handle to
%      the existing singleton*.
%
%      FILTROPA_RFREAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_RFREAL.M with the given input arguments.
%
%      FILTROPA_RFREAL('Property','Value',...) creates a new FILTROPA_RFREAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_rfreal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_rfreal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_rfreal

% Last Modified by GUIDE v2.5 27-Oct-2022 16:52:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_rfreal_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_rfreal_OutputFcn, ...
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


% --- Executes just before filtropa_rfreal is made visible.
function filtropa_rfreal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_rfreal (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs
sysprs=varargin{1};
syspminrs=varargin{2};
npa=varargin{3};
denparcial=varargin{4};
numerador=varargin{5};
denminparcial=varargin{6};
numin=varargin{7};
nump_max=varargin{8};
denp_max=varargin{9};
nump_min=varargin{10};
denp_min=varargin{11};
valor_rs=varargin{12};
% Choose default command line output for filtropa_rfreal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_rfreal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtropa_rfreal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1 p2
cla(handles.palp_rfreal,'reset')
p1=0;
p2=0;
% --- Executes on button press in finpa5.
function finpa5_Callback(hObject, eventdata, handles)
% hObject    handle to finpa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in fpa_lp_red_real.
function fpa_lp_red_real_Callback(hObject, eventdata, handles)
% hObject    handle to fpa_lp_red_real (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs p1 p2
if p1==0 && p2==0
warndlg('Generate Frequency Response','Warning');
else
set(gcf,'visible','off');
filtropa_lp_redreal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs)
end

% --- Executes on button press in filtropa_Opt_bp_rfreal.
function filtropa_Opt_bp_rfreal_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_bp_rfreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs p1
p1=get(handles.filtropa_Opt_bp_rfreal,'Value');
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysprs,h,'green')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.palp_rfreal);
legend('Pascal OBR - LP')

% --- Executes on button press in filtropa_Opt_br_rfreal.
function filtropa_Opt_br_rfreal_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_br_rfreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syspminrs p2
p2=get(handles.filtropa_Opt_br_rfreal,'Value');
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspminrs,h,'b')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.palp_rfreal);
legend('Pascal OBP - LP')

% --- Executes on button press in otaprox1.
function otaprox1_Callback(hObject, eventdata, handles)
% hObject    handle to otaprox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
