function varargout = transbut_hp_fre_z_red(varargin)
% TRANSBUT_HP_FRE_Z_RED MATLAB code for transbut_hp_fre_z_red.fig
%      TRANSBUT_HP_FRE_Z_RED, by itself, creates a new TRANSBUT_HP_FRE_Z_RED or raises the existing
%      singleton*.
%
%      H = TRANSBUT_HP_FRE_Z_RED returns the handle to a new TRANSBUT_HP_FRE_Z_RED or the handle to
%      the existing singleton*.
%
%      TRANSBUT_HP_FRE_Z_RED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_HP_FRE_Z_RED.M with the given input arguments.
%
%      TRANSBUT_HP_FRE_Z_RED('Property','Value',...) creates a new TRANSBUT_HP_FRE_Z_RED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_hp_fre_z_red_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_hp_fre_z_red_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_hp_fre_z_red

% Last Modified by GUIDE v2.5 30-Sep-2022 20:00:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_hp_fre_z_red_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_hp_fre_z_red_OutputFcn, ...
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


% --- Executes just before transbut_hp_fre_z_red is made visible.
function transbut_hp_fre_z_red_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_hp_fre_z_red (see VARARGIN)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_hp_f sysch1_hp_f sysch2_hp_f syse_hp_f Wc_hp Lbu_hp_t_f Cbu_hp_t_f Lch1_hp_t_f Cch1_hp_t_f Lch2_hp_t_f Cch2_hp_t_f Le_hp_t_f Ce_hp_t_f Lbu_hp_pi_f Cbu_hp_pi_f Lch1_hp_pi_f Cch1_hp_pi_f Lch2_hp_pi_f Cch2_hp_pi_f Le_hp_pi_f Ce_hp_pi_f buthp_frec_z
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
sysbut_hp_f=varargin{51};
sysch1_hp_f=varargin{52};
sysch2_hp_f=varargin{53};
syse_hp_f=varargin{54};
Wc_hp=varargin{55};
Lbu_hp_t_f=varargin{56};
Cbu_hp_t_f=varargin{57};
Lch1_hp_t_f=varargin{58};
Cch1_hp_t_f=varargin{59};
Lch2_hp_t_f=varargin{60};
Cch2_hp_t_f=varargin{61};
Le_hp_t_f=varargin{62};
Ce_hp_t_f=varargin{63};
Lbu_hp_pi_f=varargin{64};
Cbu_hp_pi_f=varargin{65};
Lch1_hp_pi_f=varargin{66};
Cch1_hp_pi_f=varargin{67};
Lch2_hp_pi_f=varargin{68};
Cch2_hp_pi_f=varargin{69};
Le_hp_pi_f=varargin{70};
Ce_hp_pi_f=varargin{71};
buthp_frec_z=varargin{72};

% Choose default command line output for transbut_hp_fre_z_red
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_hp_fre_z_red wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_hp_fre_z_red_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k
j=0;
k=0;
set(handles.rd_buttran_hp_frec_z,'String'," ")
cla(handles.rdbut_hp_transf_frec_z,'reset')
set(handles.resistor_redbut_hp_trans_frec_z,'String'," ")
set(handles.ind_redbut_hp_transf_frec_z,'String'," ")
set(handles.capacitor_redbut_hp_transf_frec_z,'String'," ")

% --- Executes on button press in redtbuthp_transf_frec_z.
function redtbuthp_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redtbuthp_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rs RL nb nch1 buthp_frec_z f_but f_cheby1 Lbu_hp_t_f Cbu_hp_t_f Lch1_hp_t_f Cch1_hp_t_f f_cheby2 f_elip nch2 ne Le_hp_t_f Ce_hp_t_f Lch2_hp_t_f Cch2_hp_t_f j
j=get(handles.redtbuthp_transf_frec_z,'Value');
set(handles.rd_buttran_hp_frec_z,'String','T-type network'); %π
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lbu_hp_t_f_z=buthp_frec_z.*Lbu_hp_t_f;
syms L
im=0;
h=length(Lbu_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbu_hp_t_f_z));
%Capacitores
Cbu_hp_t_f_z=(1/buthp_frec_z).*Cbu_hp_t_f;
syms C
im=0;
h=length(Cbu_hp_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbu_hp_t_f_z));

if nb==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lch1_hp_t_f_z=buthp_frec_z.*Lch1_hp_t_f;
syms L
im=0;
h=length(Lch1_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch1_hp_t_f_z));
%Capacitores
Cch1_hp_t_f_z=(1/buthp_frec_z).*Cch1_hp_t_f;
syms C
im=0;
h=length(Cch1_hp_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch1_hp_t_f_z));

if nch1==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lch2_hp_t_f_z=buthp_frec_z.*Lch2_hp_t_f;
syms L
im=0;
h=length(Lch2_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch2_hp_t_f_z));
%Capacitores
Cch2_hp_t_f_z=(1/buthp_frec_z).*Cch2_hp_t_f;
syms C
im=0;
h=length(Cch2_hp_t_f_z);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch2_hp_t_f_z));

if nch2==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Le_hp_t_f_z=buthp_frec_z.*Le_hp_t_f;
syms L
im=0;
h=length(Le_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Le_hp_t_f_z));
%Capacitores
Ce_hp_t_f_z=(1/buthp_frec_z).*Ce_hp_t_f;
syms C
im=0;
h=length(Ce_hp_t_f_z);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Ce_hp_t_f_z));

if ne==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in redpibuthp_transf_frec_z.
function redpibuthp_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpibuthp_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rs RL nb nch1 f_but f_cheby1 buthp_frec_z Lbu_hp_pi_f Cbu_hp_pi_f Lch1_hp_pi_f Cch1_hp_pi_f f_cheby2 f_elip nch2 ne Le_hp_pi_f Ce_hp_pi_f Lch2_hp_pi_f Cch2_hp_pi_f k
k=get(handles.redpibuthp_transf_frec_z,'Value');
set(handles.rd_buttran_hp_frec_z,'String','π-type network');
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lbu_hp_pi_f_z=buthp_frec_z.*Lbu_hp_pi_f;
syms L
im=0;
h=length(Lbu_hp_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbu_hp_pi_f_z));
%Capacitores
Cbu_hp_pi_f_z=(1/buthp_frec_z).*Cbu_hp_pi_f;
syms C
im=0;
h=length(Cbu_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbu_hp_pi_f_z));

if nb==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nb==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lch1_hp_pi_f_z=buthp_frec_z.*Lch1_hp_pi_f;
syms L
im=0;
h=length(Lch1_hp_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch1_hp_pi_f_z));
%Capacitores
Cch1_hp_pi_f_z=(1/buthp_frec_z).*Cch1_hp_pi_f;
syms C
im=0;
h=length(Cch1_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch1_hp_pi_f_z));

if nch1==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch1==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lch2_hp_pi_f_z=buthp_frec_z.*Lch2_hp_pi_f;
syms L
im=0;
h=length(Lch2_hp_pi_f_z);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch2_hp_pi_f_z));
%Capacitores
Cch2_hp_pi_f_z=(1/buthp_frec_z).*Cch2_hp_pi_f;
syms C
im=0;
h=length(Cch2_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch2_hp_pi_f_z));

if nch2==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif nch2==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs*buthp_frec_z RL*buthp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Le_hp_pi_f_z=buthp_frec_z.*Le_hp_pi_f;
syms L
im=0;
h=length(Le_hp_pi_f_z);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Le_hp_pi_f_z));
%Capacitores
Ce_hp_pi_f_z=(1/buthp_frec_z).*Ce_hp_pi_f;
syms C
im=0;
h=length(Ce_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Ce_hp_pi_f_z));

if ne==2
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==3
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==4
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==5
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==6
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==7
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==8
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==9
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==10
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==11
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==12
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==13
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==14
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==15
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==16
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==17
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==18
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==19
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==20 
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif ne==21
axes(handles.rdbut_hp_transf_frec_z)
background=imread('hp2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redbut_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redbut_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end
end

% --- Executes on button press in fin20.
function fin20_Callback(hObject, eventdata, handles)
% hObject    handle to fin20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in reg12.
function reg12_Callback(hObject, eventdata, handles)
% hObject    handle to reg12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t j k
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning');
else
set(gcf,'visible','off');
tranbut(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t)
end
