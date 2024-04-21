function varargout = transpa_bp_frec_z_rf(varargin)
% TRANSPA_BP_FREC_Z_RF MATLAB code for transpa_bp_frec_z_rf.fig
%      TRANSPA_BP_FREC_Z_RF, by itself, creates a new TRANSPA_BP_FREC_Z_RF or raises the existing
%      singleton*.
%
%      H = TRANSPA_BP_FREC_Z_RF returns the handle to a new TRANSPA_BP_FREC_Z_RF or the handle to
%      the existing singleton*.
%
%      TRANSPA_BP_FREC_Z_RF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_BP_FREC_Z_RF.M with the given input arguments.
%
%      TRANSPA_BP_FREC_Z_RF('Property','Value',...) creates a new TRANSPA_BP_FREC_Z_RF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_bp_frec_z_rf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_bp_frec_z_rf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_bp_frec_z_rf

% Last Modified by GUIDE v2.5 09-Oct-2022 09:09:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_bp_frec_z_rf_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_bp_frec_z_rf_OutputFcn, ...
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


% --- Executes just before transpa_bp_frec_z_rf is made visible.
function transpa_bp_frec_z_rf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_bp_frec_z_rf (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_bp Bw_bp syspmax_bp_f syspmin_bp_f Cpabp_paralelo_bp_t_f Lpabp_paralelo_bp_t_f Cpabp_serie_bp_t_f Lpabp_serie_bp_t_f Cpabr_paralelo_bp_t_f Lpabr_paralelo_bp_t_f Cpabr_serie_bp_t_f Lpabr_serie_bp_t_f Cpabp_paralelo_bp_pi_f Lpabp_paralelo_bp_pi_f Cpabp_serie_bp_pi_f Lpabp_serie_bp_pi_f Cpabr_paralelo_bp_pi_f Lpabr_paralelo_bp_pi_f Cpabr_serie_bp_pi_f Lpabr_serie_bp_pi_f pabp_frec_z
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
Lpabp_lp_t=varargin{13};
Cpabp_lp_t=varargin{14};
Cpabp_lp_pi=varargin{15};
Lpabp_lp_pi=varargin{16};
Lpabr_lp_t=varargin{17};
Cpabr_lp_t=varargin{18};
Cpabr_lp_pi=varargin{19};
Lpabr_lp_pi=varargin{20};
Wc_bp=varargin{21};
Bw_bp=varargin{22};
syspmax_bp_f=varargin{23};
syspmin_bp_f=varargin{24};
Cpabp_paralelo_bp_t_f=varargin{25};
Lpabp_paralelo_bp_t_f=varargin{26};
Cpabp_serie_bp_t_f=varargin{27};
Lpabp_serie_bp_t_f=varargin{28};
Cpabr_paralelo_bp_t_f=varargin{29};
Lpabr_paralelo_bp_t_f=varargin{30};
Cpabr_serie_bp_t_f=varargin{31};
Lpabr_serie_bp_t_f=varargin{32};
Cpabp_paralelo_bp_pi_f=varargin{33};
Lpabp_paralelo_bp_pi_f=varargin{34};
Cpabp_serie_bp_pi_f=varargin{35};
Lpabp_serie_bp_pi_f=varargin{36};
Cpabr_paralelo_bp_pi_f=varargin{37};
Lpabr_paralelo_bp_pi_f=varargin{38};
Cpabr_serie_bp_pi_f=varargin{39};
Lpabr_serie_bp_pi_f=varargin{40};
pabp_frec_z=varargin{41};
% Choose default command line output for transpa_bp_frec_z_rf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_bp_frec_z_rf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_bp_frec_z_rf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1
cla(handles.rfpabp_frec_z,'reset')
p1=0;

% --- Executes on button press in finpa20.
function finpa20_Callback(hObject, eventdata, handles)
% hObject    handle to finpa20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in redpa_bp_frec_z.
function redpa_bp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpa_bp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_bp Bw_bp syspmax_bp_f syspmin_bp_f Cpabp_paralelo_bp_t_f Lpabp_paralelo_bp_t_f Cpabp_serie_bp_t_f Lpabp_serie_bp_t_f Cpabr_paralelo_bp_t_f Lpabr_paralelo_bp_t_f Cpabr_serie_bp_t_f Lpabr_serie_bp_t_f Cpabp_paralelo_bp_pi_f Lpabp_paralelo_bp_pi_f Cpabp_serie_bp_pi_f Lpabp_serie_bp_pi_f Cpabr_paralelo_bp_pi_f Lpabr_paralelo_bp_pi_f Cpabr_serie_bp_pi_f Lpabr_serie_bp_pi_f pabp_frec_z p1
if p1==0
warndlg('Calculate Frequency Response','Warning');
else
set(gcf,'visible','off');
transpa_bp_frec_z_red(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wc_bp,Bw_bp,syspmax_bp_f,syspmin_bp_f,Cpabp_paralelo_bp_t_f,Lpabp_paralelo_bp_t_f,Cpabp_serie_bp_t_f,Lpabp_serie_bp_t_f,Cpabr_paralelo_bp_t_f,Lpabr_paralelo_bp_t_f,Cpabr_serie_bp_t_f,Lpabr_serie_bp_t_f,Cpabp_paralelo_bp_pi_f,Lpabp_paralelo_bp_pi_f,Cpabp_serie_bp_pi_f,Lpabp_serie_bp_pi_f,Cpabr_paralelo_bp_pi_f,Lpabr_paralelo_bp_pi_f,Cpabr_serie_bp_pi_f,Lpabr_serie_bp_pi_f,pabp_frec_z)
end

% --- Executes on button press in regpa10.
function regpa10_Callback(hObject, eventdata, handles)
% hObject    handle to regpa10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)

% --- Executes on button press in genlp_bp_f_z_rf.
function genlp_bp_f_z_rf_Callback(hObject, eventdata, handles)
% hObject    handle to genlp_bp_f_z_rf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syspmax_bp_f syspmin_bp_f f_paobp f_paobr p1
p1=get(handles.genlp_bp_f_z_rf,'Value');
f_paobp=get(handles.fpa_opt_bp_real_tranbp_z_rf,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranbp_z_rf,'Value');
if f_paobp==1
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspmax_bp_f,h,'green')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfpabp_frec_z);
legend('Pascal OBR - BP')

else
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspmin_bp_f,h,'b')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfpabp_frec_z);
legend('Pascal OBP - BP')
end
