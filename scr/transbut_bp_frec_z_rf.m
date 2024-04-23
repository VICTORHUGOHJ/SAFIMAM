function varargout = transbut_bp_frec_z_rf(varargin)
% TRANSBUT_BP_FREC_Z_RF MATLAB code for transbut_bp_frec_z_rf.fig
%      TRANSBUT_BP_FREC_Z_RF, by itself, creates a new TRANSBUT_BP_FREC_Z_RF or raises the existing
%      singleton*.
%
%      H = TRANSBUT_BP_FREC_Z_RF returns the handle to a new TRANSBUT_BP_FREC_Z_RF or the handle to
%      the existing singleton*.
%
%      TRANSBUT_BP_FREC_Z_RF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_BP_FREC_Z_RF.M with the given input arguments.
%
%      TRANSBUT_BP_FREC_Z_RF('Property','Value',...) creates a new TRANSBUT_BP_FREC_Z_RF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_bp_frec_z_rf_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_bp_frec_z_rf_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_bp_frec_z_rf

% Last Modified by GUIDE v2.5 27-Oct-2022 10:43:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_bp_frec_z_rf_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_bp_frec_z_rf_OutputFcn, ...
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


% --- Executes just before transbut_bp_frec_z_rf is made visible.
function transbut_bp_frec_z_rf_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_bp_frec_z_rf (see VARARGIN)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t Wc_bp Bw_bp sysbut_bp_f sysch1_bp_f sysch2_bp_f syse_bp_f Lbu_serie_bp_pi_f Cbu_serie_bp_pi_f Lbu_paralelo_bp_pi_f Cbu_paralelo_bp_pi_f Lch1_serie_bp_pi_f Cch1_serie_bp_pi_f Lch1_paralelo_bp_pi_f Cch1_paralelo_bp_pi_f Lch2_serie_bp_pi_f Cch2_serie_bp_pi_f Lch2_paralelo_bp_pi_f Cch2_paralelo_bp_pi_f Le_serie_bp_pi_f Ce_serie_bp_pi_f Le_paralelo_bp_pi_f Ce_paralelo_bp_pi_f Lbu_serie_bp_t_f Cbu_serie_bp_t_f Lbu_paralelo_bp_t_f Cbu_paralelo_bp_t_f Lch1_serie_bp_t_f Cch1_serie_bp_t_f Lch1_paralelo_bp_t_f Cch1_paralelo_bp_t_f Lch2_serie_bp_t_f Cch2_serie_bp_t_f Lch2_paralelo_bp_t_f Cch2_paralelo_bp_t_f Le_serie_bp_t_f Ce_serie_bp_t_f Le_paralelo_bp_t_f Ce_paralelo_bp_t_f butbp_frec_z
kb=varargin{1};
zb=varargin{2};
pb=varargin{3};
numb=varargin{4};
denb=varargin{5};
rs=varargin{6};
RL=varargin{7};
Lbu_lp_t=varargin{8};
Cbu_lp_t=varargin{9};
sysbut_lp=varargin{10};
Lbu_lp_pi=varargin{11};
Cbu_lp_pi=varargin{12};
nb=varargin{13};
nch1=varargin{14};
f_but=varargin{15};
f_cheby1=varargin{16};
zc1=varargin{17};
pc1=varargin{18};
kc1=varargin{19};
numch1=varargin{20};
dench1=varargin{21};
sysch1_lp=varargin{22};
Lch1_lp_pi=varargin{23};
Cch1_lp_pi=varargin{24};
Lch1_lp_t=varargin{25};
Cch1_lp_t=varargin{26};
f_cheby2=varargin{27};
f_elip=varargin{28};
nch2=varargin{29};
ne=varargin{30};
zc2=varargin{31};
pc2=varargin{32};
kc2=varargin{33};
numch2=varargin{34};
dench2=varargin{35};
sysch2_lp=varargin{36};
ze=varargin{37};
pe=varargin{38};
ke=varargin{39};
nume=varargin{40};
dene=varargin{41};
syse_lp=varargin{42};
Lch2_lp_pi=varargin{43};
Cch2_lp_pi=varargin{44};
Le_lp_pi=varargin{45};
Ce_lp_pi=varargin{46};
Lch2_lp_t=varargin{47};
Cch2_lp_t=varargin{48};
Le_lp_t=varargin{49};
Ce_lp_t=varargin{50};
Wc_bp=varargin{51};
Bw_bp=varargin{52};
sysbut_bp_f=varargin{53};
sysch1_bp_f=varargin{54};
sysch2_bp_f=varargin{55};
syse_bp_f=varargin{56};
Lbu_serie_bp_pi_f=varargin{57};
Cbu_serie_bp_pi_f=varargin{58};
Lbu_paralelo_bp_pi_f=varargin{59};
Cbu_paralelo_bp_pi_f=varargin{60};
Lch1_serie_bp_pi_f=varargin{61};
Cch1_serie_bp_pi_f=varargin{62};
Lch1_paralelo_bp_pi_f=varargin{63};
Cch1_paralelo_bp_pi_f=varargin{64};
Lch2_serie_bp_pi_f=varargin{65};
Cch2_serie_bp_pi_f=varargin{66};
Lch2_paralelo_bp_pi_f=varargin{67};
Cch2_paralelo_bp_pi_f=varargin{68};
Le_serie_bp_pi_f=varargin{69};
Ce_serie_bp_pi_f=varargin{70};
Le_paralelo_bp_pi_f=varargin{71};
Ce_paralelo_bp_pi_f=varargin{72};
Lbu_serie_bp_t_f=varargin{73};
Cbu_serie_bp_t_f=varargin{74};
Lbu_paralelo_bp_t_f=varargin{75};
Cbu_paralelo_bp_t_f=varargin{76};
Lch1_serie_bp_t_f=varargin{77};
Cch1_serie_bp_t_f=varargin{78};
Lch1_paralelo_bp_t_f=varargin{79};
Cch1_paralelo_bp_t_f=varargin{80};
Lch2_serie_bp_t_f=varargin{81};
Cch2_serie_bp_t_f=varargin{82};
Lch2_paralelo_bp_t_f=varargin{83};
Cch2_paralelo_bp_t_f=varargin{84};
Le_serie_bp_t_f=varargin{85};
Ce_serie_bp_t_f=varargin{86};
Le_paralelo_bp_t_f=varargin{87};
Ce_paralelo_bp_t_f=varargin{88};
butbp_frec_z=varargin{89};
% Choose default command line output for transbut_bp_frec_z_rf
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_bp_frec_z_rf wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_bp_frec_z_rf_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

global sysbut_bp_f sysch1_bp_f f_but f_cheby1 syse_bp_f sysch2_bp_f f_elip f_cheby2
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysbut_bp_f,h,'c')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbutbp_frec_z);
legend('Butterworth BP')

elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysch1_bp_f,h,'red')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbutbp_frec_z);
legend('Chebyshev I BP')

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysch2_bp_f,h,'k')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbutbp_frec_z);
legend('Chebyshev II BP')

else
h=bodeoptions; 
h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syse_bp_f,h,'magenta')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbutbp_frec_z);
legend('Elliptic BP')
end

% --- Executes on button press in fin25.
function fin25_Callback(hObject, eventdata, handles)
% hObject    handle to fin25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in redbut_bp_frec_z.
function redbut_bp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redbut_bp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t Wc_bp Bw_bp sysbut_bp_f sysch1_bp_f sysch2_bp_f syse_bp_f Lbu_serie_bp_pi_f Cbu_serie_bp_pi_f Lbu_paralelo_bp_pi_f Cbu_paralelo_bp_pi_f Lch1_serie_bp_pi_f Cch1_serie_bp_pi_f Lch1_paralelo_bp_pi_f Cch1_paralelo_bp_pi_f Lch2_serie_bp_pi_f Cch2_serie_bp_pi_f Lch2_paralelo_bp_pi_f Cch2_paralelo_bp_pi_f Le_serie_bp_pi_f Ce_serie_bp_pi_f Le_paralelo_bp_pi_f Ce_paralelo_bp_pi_f Lbu_serie_bp_t_f Cbu_serie_bp_t_f Lbu_paralelo_bp_t_f Cbu_paralelo_bp_t_f Lch1_serie_bp_t_f Cch1_serie_bp_t_f Lch1_paralelo_bp_t_f Cch1_paralelo_bp_t_f Lch2_serie_bp_t_f Cch2_serie_bp_t_f Lch2_paralelo_bp_t_f Cch2_paralelo_bp_t_f Le_serie_bp_t_f Ce_serie_bp_t_f Le_paralelo_bp_t_f Ce_paralelo_bp_t_f butbp_frec_z
set(gcf,'visible','off');
transbut_bp_frec_z_red(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t,Wc_bp,Bw_bp,sysbut_bp_f,sysch1_bp_f,sysch2_bp_f,syse_bp_f,Lbu_serie_bp_pi_f,Cbu_serie_bp_pi_f,Lbu_paralelo_bp_pi_f,Cbu_paralelo_bp_pi_f,Lch1_serie_bp_pi_f,Cch1_serie_bp_pi_f,Lch1_paralelo_bp_pi_f,Cch1_paralelo_bp_pi_f,Lch2_serie_bp_pi_f,Cch2_serie_bp_pi_f,Lch2_paralelo_bp_pi_f,Cch2_paralelo_bp_pi_f,Le_serie_bp_pi_f,Ce_serie_bp_pi_f,Le_paralelo_bp_pi_f,Ce_paralelo_bp_pi_f,Lbu_serie_bp_t_f,Cbu_serie_bp_t_f,Lbu_paralelo_bp_t_f,Cbu_paralelo_bp_t_f,Lch1_serie_bp_t_f,Cch1_serie_bp_t_f,Lch1_paralelo_bp_t_f,Cch1_paralelo_bp_t_f,Lch2_serie_bp_t_f,Cch2_serie_bp_t_f,Lch2_paralelo_bp_t_f,Cch2_paralelo_bp_t_f,Le_serie_bp_t_f,Ce_serie_bp_t_f,Le_paralelo_bp_t_f,Ce_paralelo_bp_t_f,butbp_frec_z)

% --- Executes on button press in reg15.
function reg15_Callback(hObject, eventdata, handles)
% hObject    handle to reg15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t
set(gcf,'visible','off');
tranbut(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t)
