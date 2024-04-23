function varargout = transpa_lp_frec_rf(varargin)
% TRANSPA_LP_FREC_RF MATLAB code for transpa_lp_frec_rf.fig
%      TRANSPA_LP_FREC_RF, by itself, creates a new TRANSPA_LP_FREC_RF or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_FREC_RF returns the handle to a new TRANSPA_LP_FREC_RF or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_FREC_RF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_FREC_RF.M with the given input arguments.
%
%      TRANSPA_LP_FREC_RF('Property','Value',...) creates a new TRANSPA_LP_FREC_RF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_frec_rf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_frec_rf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_frec_rf

% Last Modified by GUIDE v2.5 07-Oct-2022 22:49:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_frec_rf_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_frec_rf_OutputFcn, ...
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


% --- Executes just before transpa_lp_frec_rf is made visible.
function transpa_lp_frec_rf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_frec_rf (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wn_lp syspmax_lp_f syspmin_lp_f
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
Wn_lp=varargin{21};
syspmax_lp_f=varargin{22};
syspmin_lp_f=varargin{23};

% Choose default command line output for transpa_lp_frec_rf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_frec_rf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_frec_rf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1
cla(handles.rfpalp_frec,'reset')
p1=0;

% --- Executes on button press in finpa9.
function finpa9_Callback(hObject, eventdata, handles)
% hObject    handle to finpa9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in redpa_lp_frec.
function redpa_lp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to redpa_lp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wn_lp syspmax_lp_f syspmin_lp_f p1
if p1==0
   warndlg('Calculate Frequency Response','Warning');
else
set(gcf,'visible','off');
transpa_lp_frec_red(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wn_lp,syspmax_lp_f,syspmin_lp_f)
end

% --- Executes on button press in regpa2.
function regpa2_Callback(hObject, eventdata, handles)
% hObject    handle to regpa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)

% --- Executes on button press in genrf_trans_palp_frec.
function genrf_trans_palp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to genrf_trans_palp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syspmax_lp_f syspmin_lp_f f_paobp f_paobr p1
p1=get(handles.genrf_trans_palp_frec,'Value');
f_paobp=get(handles.fpa_opt_bp_real_tranf_rf,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranf_rf,'Value');
if f_paobp==1
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspmax_lp_f,h,'green')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfpalp_frec);
legend('Pascal OBR - LP')

else
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syspmin_lp_f,h,'b')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfpalp_frec);
legend('Pascal OBP - LP')
end
