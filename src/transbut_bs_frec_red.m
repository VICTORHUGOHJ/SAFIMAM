function varargout = transbut_bs_frec_red(varargin)
% TRANSBUT_BS_FREC_RED MATLAB code for transbut_bs_frec_red.fig
%      TRANSBUT_BS_FREC_RED, by itself, creates a new TRANSBUT_BS_FREC_RED or raises the existing
%      singleton*.
%
%      H = TRANSBUT_BS_FREC_RED returns the handle to a new TRANSBUT_BS_FREC_RED or the handle to
%      the existing singleton*.
%
%      TRANSBUT_BS_FREC_RED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_BS_FREC_RED.M with the given input arguments.
%
%      TRANSBUT_BS_FREC_RED('Property','Value',...) creates a new TRANSBUT_BS_FREC_RED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_bs_frec_red_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_bs_frec_red_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_bs_frec_red

% Last Modified by GUIDE v2.5 27-Oct-2022 09:01:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_bs_frec_red_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_bs_frec_red_OutputFcn, ...
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


% --- Executes just before transbut_bs_frec_red is made visible.
function transbut_bs_frec_red_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_bs_frec_red (see VARARGIN)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_bs_f sysch1_bs_f sysch2_bs_f syse_bs_f Wc_bs Bw_bs
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
sysbut_bs_f=varargin{51};
sysch1_bs_f=varargin{52};
sysch2_bs_f=varargin{53};
syse_bs_f=varargin{54};
Wc_bs=varargin{55};
Bw_bs=varargin{56};

% Choose default command line output for transbut_bs_frec_red
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_bs_frec_red wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_bs_frec_red_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k Lbu_paralelo_bs_t_f Lbu_lp_t Cbu_paralelo_bs_t_f Lbu_serie_bs_t_f Cbu_lp_t Cbu_serie_bs_t_f Lch1_paralelo_bs_t_f Lch1_lp_t Cch1_paralelo_bs_t_f Lch1_serie_bs_t_f Cch1_lp_t Cch1_serie_bs_t_f Lch2_paralelo_bs_t_f Lch2_lp_t Cch2_paralelo_bs_t_f Lch2_serie_bs_t_f Cch2_lp_t Cch2_serie_bs_t_f Le_paralelo_bs_t_f Le_lp_t Ce_paralelo_bs_t_f Le_serie_bs_t_f Ce_lp_t Ce_serie_bs_t_f Lbu_paralelo_bs_pi_f Lbu_lp_pi Cbu_paralelo_bs_pi_f Lbu_serie_bs_pi_f Cbu_lp_pi Cbu_serie_bs_pi_f Lch1_paralelo_bs_pi_f Lch1_lp_pi Cch1_paralelo_bs_pi_f Lch1_serie_bs_pi_f Cch1_lp_pi Cch1_serie_bs_pi_f Lch2_paralelo_bs_pi_f Lch2_lp_pi Cch2_paralelo_bs_pi_f Lch2_serie_bs_pi_f Cch2_lp_pi Cch2_serie_bs_pi_f Le_paralelo_bs_pi_f Le_lp_pi Ce_paralelo_bs_pi_f Le_serie_bs_pi_f Ce_lp_pi Ce_serie_bs_pi_f Bw_bs Wc_bs
j=0;
k=0;
set(handles.rd_buttran_bs_frec,'String'," ")
cla(handles.rdbut_bs_transf_frec,'reset')
set(handles.resistor_redbut_bs_trans_frec,'String'," ")
set(handles.ind_redbut_bs_transf_frec,'String'," ")
set(handles.cap_redbut_bs_transf_frec,'String'," ")
set(handles.capacitor_redbut_bs_transf_frec,'String'," ")
set(handles.inductor_redbut_bs_transf_frec,'String'," ")
Lbu_paralelo_bs_t_f=(Lbu_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Cbu_paralelo_bs_t_f=(Lbu_lp_t.^-1).*(1/Bw_bs);
Lbu_serie_bs_t_f=(Cbu_lp_t.^-1).*(1/Bw_bs);
Cbu_serie_bs_t_f=(Cbu_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Lch1_paralelo_bs_t_f=(Lch1_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Cch1_paralelo_bs_t_f=(Lch1_lp_t.^-1).*(1/Bw_bs);
Lch1_serie_bs_t_f=(Cch1_lp_t.^-1).*(1/Bw_bs);
Cch1_serie_bs_t_f=(Cch1_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Lch2_paralelo_bs_t_f=(Lch2_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Cch2_paralelo_bs_t_f=(Lch2_lp_t.^-1).*(1/Bw_bs);
Lch2_serie_bs_t_f=(Cch2_lp_t.^-1).*(1/Bw_bs);
Cch2_serie_bs_t_f=(Cch2_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Le_paralelo_bs_t_f=(Le_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Ce_paralelo_bs_t_f=(Le_lp_t.^-1).*(1/Bw_bs);
Le_serie_bs_t_f=(Ce_lp_t.^-1).*(1/Bw_bs);
Ce_serie_bs_t_f=(Ce_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
Lbu_paralelo_bs_pi_f=(Lbu_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Cbu_paralelo_bs_pi_f=(Lbu_lp_pi.^-1).*(1/Bw_bs);
Lbu_serie_bs_pi_f=(Cbu_lp_pi.^-1).*(1/Bw_bs);
Cbu_serie_bs_pi_f=(Cbu_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Lch1_paralelo_bs_pi_f=(Lch1_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Cch1_paralelo_bs_pi_f=(Lch1_lp_pi.^-1).*(1/Bw_bs);
Lch1_serie_bs_pi_f=(Cch1_lp_pi.^-1).*(1/Bw_bs);
Cch1_serie_bs_pi_f=(Cch1_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Lch2_paralelo_bs_pi_f=(Lch2_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Cch2_paralelo_bs_pi_f=(Lch2_lp_pi.^-1).*(1/Bw_bs);
Lch2_serie_bs_pi_f=(Cch2_lp_pi.^-1).*(1/Bw_bs);
Cch2_serie_bs_pi_f=(Cch2_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Le_paralelo_bs_pi_f=(Le_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
Ce_paralelo_bs_pi_f=(Le_lp_pi.^-1).*(1/Bw_bs);
Le_serie_bs_pi_f=(Ce_lp_pi.^-1).*(1/Bw_bs);
Ce_serie_bs_pi_f=(Ce_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));

% --- Executes on button press in redtbutbs_transf_frec.
function redtbutbs_transf_frec_Callback(hObject, eventdata, handles)
% hObject    handle to redtbutbs_transf_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_but f_cheby1 f_cheby2 f_elip rs RL nb nch1 nch2 ne Wc_bs Bw_bs Lbu_lp_t Cbu_lp_t Lch1_lp_t Cch1_lp_t Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t Lbu_serie_bs_t_f Cbu_serie_bs_t_f Lbu_paralelo_bs_t_f Cbu_paralelo_bs_t_f Lch1_serie_bs_t_f Cch1_serie_bs_t_f Lch1_paralelo_bs_t_f Cch1_paralelo_bs_t_f Lch2_serie_bs_t_f Cch2_serie_bs_t_f Lch2_paralelo_bs_t_f Cch2_paralelo_bs_t_f Le_serie_bs_t_f Ce_serie_bs_t_f Le_paralelo_bs_t_f Ce_paralelo_bs_t_f j
j=get(handles.redtbutbs_transf_frec,'Value');
set(handles.rd_buttran_bs_frec,'String','T-type network');
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lbu_paralelo_bs_t_f=(Lbu_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lbu_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lbu_paralelo_bs_t_f));
%Capacitores paralelo
%Cbu_paralelo_bs_t_f=(Lbu_lp_t.^-1).*(1/Bw_bs);
syms C
im=0;
h=length(Cbu_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cbu_paralelo_bs_t_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lbu_serie_bs_t_f=(Cbu_lp_t.^-1).*(1/Bw_bs);
syms L
im=0;
h=length(Lbu_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lbu_serie_bs_t_f));
%Capacitores serie
%Cbu_serie_bs_t_f=(Cbu_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cbu_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cbu_serie_bs_t_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nb==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lch1_paralelo_bs_t_f=(Lch1_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lch1_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lch1_paralelo_bs_t_f));
%Capacitores paralelo
%Cch1_paralelo_bs_t_f=(Lch1_lp_t.^-1).*(1/Bw_bs);
syms C
im=0;
h=length(Cch1_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cch1_paralelo_bs_t_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lch1_serie_bs_t_f=(Cch1_lp_t.^-1).*(1/Bw_bs);
syms L
im=0;
h=length(Lch1_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lch1_serie_bs_t_f));
%Capacitores serie
%Cch1_serie_bs_t_f=(Cch1_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cch1_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cch1_serie_bs_t_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nch1==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lch2_paralelo_bs_t_f=(Lch2_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lch2_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lch2_paralelo_bs_t_f));
%Capacitores paralelo
%Cch2_paralelo_bs_t_f=(Lch2_lp_t.^-1).*(1/Bw_bs);
syms C p
im=0;
h=length(Cch2_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
w = strcat(ele,ese);
%%%
eze=string(aux*p);
v=strcat(w,eze);
%%%
Capacitores_bs_paralelo = strcat(v,'=',string(Cch2_paralelo_bs_t_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lch2_serie_bs_t_f=(Cch2_lp_t.^-1).*(1/Bw_bs);
syms L s
im=0;
h=length(Lch2_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
w = strcat(ele,ese);
%%%
eze=string(aux*s);
v=strcat(w,eze);
%%%
Inductores_bs_serie = strcat(v,'=',string(Lch2_serie_bs_t_f));
%Capacitores serie
%Cch2_serie_bs_t_f=(Cch2_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cch2_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cch2_serie_bs_t_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nch2==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Le_paralelo_bs_t_f=(Le_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Le_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Le_paralelo_bs_t_f));
%Capacitores paralelo
%Ce_paralelo_bs_t_f=(Le_lp_t.^-1).*(1/Bw_bs);
syms C p
im=0;
h=length(Ce_paralelo_bs_t_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
w = strcat(ele,ese);
%%%
eze=string(aux*p);
v=strcat(w,eze);
%%%
Capacitores_bs_paralelo = strcat(v,'=',string(Ce_paralelo_bs_t_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Le_serie_bs_t_f=(Ce_lp_t.^-1).*(1/Bw_bs);
syms L s
im=0;
h=length(Le_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
w = strcat(ele,ese);
%%%
eze=string(aux*s);
v=strcat(w,eze);
%%%
Inductores_bs_serie = strcat(v,'=',string(Le_serie_bs_t_f));
%Capacitores serie
%Ce_serie_bs_t_f=(Ce_lp_t).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Ce_serie_bs_t_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Ce_serie_bs_t_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if ne==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in redpibutbs_transf_frec.
function redpibutbs_transf_frec_Callback(hObject, eventdata, handles)
% hObject    handle to redpibutbs_transf_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_but f_cheby1 f_cheby2 f_elip rs RL Lbu_lp_pi Cbu_lp_pi Lch1_lp_pi Cch1_lp_pi Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi nb nch1 nch2 ne Wc_bs Bw_bs Lbu_serie_bs_pi_f Cbu_serie_bs_pi_f Lbu_paralelo_bs_pi_f Cbu_paralelo_bs_pi_f Lch1_serie_bs_pi_f Cch1_serie_bs_pi_f Lch1_paralelo_bs_pi_f Cch1_paralelo_bs_pi_f Lch2_serie_bs_pi_f Cch2_serie_bs_pi_f Lch2_paralelo_bs_pi_f Cch2_paralelo_bs_pi_f Le_serie_bs_pi_f Ce_serie_bs_pi_f Le_paralelo_bs_pi_f Ce_paralelo_bs_pi_f k
k=get(handles.redpibutbs_transf_frec,'Value');
set(handles.rd_buttran_bs_frec,'String','π-type network');
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lbu_paralelo_bs_pi_f=(Lbu_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lbu_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lbu_paralelo_bs_pi_f));
%Capacitores paralelo
%Cbu_paralelo_bs_pi_f=(Lbu_lp_pi.^-1).*(1/Bw_bs);
syms C
im=0;
h=length(Cbu_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cbu_paralelo_bs_pi_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lbu_serie_bs_pi_f=(Cbu_lp_pi.^-1).*(1/Bw_bs);
syms L
im=0;
h=length(Lbu_serie_bs_pi_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lbu_serie_bs_pi_f));
%Capacitores serie
%Cbu_serie_bs_pi_f=(Cbu_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cbu_serie_bs_pi_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cbu_serie_bs_pi_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nb==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nb==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lch1_paralelo_bs_pi_f=(Lch1_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lch1_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lch1_paralelo_bs_pi_f));
%Capacitores paralelo
%Cch1_paralelo_bs_pi_f=(Lch1_lp_pi.^-1).*(1/Bw_bs);
syms C
im=0;
h=length(Cch1_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cch1_paralelo_bs_pi_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lch1_serie_bs_pi_f=(Cch1_lp_pi.^-1).*(1/Bw_bs);
syms L
im=0;
h=length(Lch1_serie_bs_pi_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lch1_serie_bs_pi_f));
%Capacitores serie
%Cch1_serie_bs_pi_f=(Cch1_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cch1_serie_bs_pi_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cch1_serie_bs_pi_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nch1==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch1==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Lch2_paralelo_bs_pi_f=(Lch2_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Lch2_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lch2_paralelo_bs_pi_f));
%Capacitores paralelo
%Cch2_paralelo_bs_pi_f=(Lch2_lp_pi.^-1).*(1/Bw_bs);
syms C p
im=0;
h=length(Cch2_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
w = strcat(ele,ese);
%%%
eze=string(aux*p);
v=strcat(w,eze);
%%%
Capacitores_bs_paralelo = strcat(v,'=',string(Cch2_paralelo_bs_pi_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Lch2_serie_bs_pi_f=(Cch2_lp_pi.^-1).*(1/Bw_bs);
syms L s
im=0;
h=length(Lch2_serie_bs_pi_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
w = strcat(ele,ese);
%%%
eze=string(aux*s);
v=strcat(w,eze);
%%%
Inductores_bs_serie = strcat(v,'=',string(Lch2_serie_bs_pi_f));
%Capacitores serie
%Cch2_serie_bs_pi_f=(Cch2_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Cch2_serie_bs_pi_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cch2_serie_bs_pi_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if nch2==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif nch2==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

%falta filtro eliptico pi bs
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
%Le_paralelo_bs_pi_f=(Le_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms L
im=0;
h=length(Le_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Le_paralelo_bs_pi_f));
%Capacitores paralelo
%Ce_paralelo_bs_pi_f=(Le_lp_pi.^-1).*(1/Bw_bs);
syms C p
im=0;
h=length(Ce_paralelo_bs_pi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
w = strcat(ele,ese);
%%%
eze=string(aux*p);
v=strcat(w,eze);
%%%
Capacitores_bs_paralelo = strcat(v,'=',string(Ce_paralelo_bs_pi_f));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
%Le_serie_bs_pi_f=(Ce_lp_pi.^-1).*(1/Bw_bs);
syms L s
im=0;
h=length(Le_serie_bs_pi_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
w = strcat(ele,ese);
%%%
eze=string(aux*s);
v=strcat(w,eze);
%%%
Inductores_bs_serie = strcat(v,'=',string(Le_serie_bs_pi_f));
%Capacitores serie
%Ce_serie_bs_pi_f=(Ce_lp_pi).*(Bw_bs/(Wc_bs*Wc_bs));
syms C
im=0;
h=length(Ce_serie_bs_pi_f);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Ce_serie_bs_pi_f));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if ne==2
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==3
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==4
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==5
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==6
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==7
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==8
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==9
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==10
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==11
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==12
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==13
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==14
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==15
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==16
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==17
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==18
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==19
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==20
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
elseif ne==21
axes(handles.rdbut_bs_transf_frec)
background=imread('bs2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_bs_trans_frec,'String',Resistores);
%set(handles.ind_redbut_bs_transf_frec,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redbut_bs_transf_frec,'String',Inductores_bs_serie);
set(handles.cap_redbut_bs_transf_frec,'String',Capacitores_bs_serie);
%set(handles.capacitor_redbut_bs_transf_frec,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redbut_bs_transf_frec,'String',Capacitores_bs_paralelo);
set(handles.inductor_redbut_bs_transf_frec,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in fin29.
function fin29_Callback(hObject, eventdata, handles)
% hObject    handle to fin29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in reg18.
function reg18_Callback(hObject, eventdata, handles)
% hObject    handle to reg18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t
set(gcf,'visible','off');
tranbut(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t)

% --- Executes on button press in butbs_trans_frec_z.
function butbs_trans_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to butbs_trans_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_bs_f sysch1_bs_f sysch2_bs_f syse_bs_f Wc_bs Bw_bs Lbu_serie_bs_t_f Cbu_serie_bs_t_f Lbu_paralelo_bs_t_f Cbu_paralelo_bs_t_f Lch1_serie_bs_t_f Cch1_serie_bs_t_f Lch1_paralelo_bs_t_f Cch1_paralelo_bs_t_f Lch2_serie_bs_t_f Cch2_serie_bs_t_f Lch2_paralelo_bs_t_f Cch2_paralelo_bs_t_f Le_serie_bs_t_f Ce_serie_bs_t_f Le_paralelo_bs_t_f Ce_paralelo_bs_t_f Lbu_serie_bs_pi_f Cbu_serie_bs_pi_f Lbu_paralelo_bs_pi_f Cbu_paralelo_bs_pi_f Lch1_serie_bs_pi_f Cch1_serie_bs_pi_f Lch1_paralelo_bs_pi_f Cch1_paralelo_bs_pi_f Lch2_serie_bs_pi_f Cch2_serie_bs_pi_f Lch2_paralelo_bs_pi_f Cch2_paralelo_bs_pi_f Le_serie_bs_pi_f Ce_serie_bs_pi_f Le_paralelo_bs_pi_f Ce_paralelo_bs_pi_f j k
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning');
else
set(gcf,'visible','off');
transbut_bs_frec_z(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t,sysbut_bs_f,sysch1_bs_f,sysch2_bs_f,syse_bs_f,Wc_bs,Bw_bs,Lbu_serie_bs_t_f,Cbu_serie_bs_t_f,Lbu_paralelo_bs_t_f,Cbu_paralelo_bs_t_f,Lch1_serie_bs_t_f,Cch1_serie_bs_t_f,Lch1_paralelo_bs_t_f,Cch1_paralelo_bs_t_f,Lch2_serie_bs_t_f,Cch2_serie_bs_t_f,Lch2_paralelo_bs_t_f,Cch2_paralelo_bs_t_f,Le_serie_bs_t_f,Ce_serie_bs_t_f,Le_paralelo_bs_t_f,Ce_paralelo_bs_t_f,Lbu_serie_bs_pi_f,Cbu_serie_bs_pi_f,Lbu_paralelo_bs_pi_f,Cbu_paralelo_bs_pi_f,Lch1_serie_bs_pi_f,Cch1_serie_bs_pi_f,Lch1_paralelo_bs_pi_f,Cch1_paralelo_bs_pi_f,Lch2_serie_bs_pi_f,Cch2_serie_bs_pi_f,Lch2_paralelo_bs_pi_f,Cch2_paralelo_bs_pi_f,Le_serie_bs_pi_f,Ce_serie_bs_pi_f,Le_paralelo_bs_pi_f,Ce_paralelo_bs_pi_f)
%Lbu_serie_bs_t_f,Cbu_serie_bs_t_f,Lbu_paralelo_bs_t_f,Cbu_paralelo_bs_t_f,Lch1_serie_bs_t_f,Cch1_serie_bs_t_f,Lch1_paralelo_bs_t_f,Cch1_paralelo_bs_t_f,Lch2_serie_bs_t_f,Cch2_serie_bs_t_f,Lch2_paralelo_bs_t_f,Cch2_paralelo_bs_t_f,Le_serie_bs_t_f,Ce_serie_bs_t_f,Le_paralelo_bs_t_f,Ce_paralelo_bs_t_f,Lbu_serie_bs_pi_f,Cbu_serie_bs_pi_f,Lbu_paralelo_bs_pi_f,Cbu_paralelo_bs_pi_f,Lch1_serie_bs_pi_f,Cch1_serie_bs_pi_f,Lch1_paralelo_bs_pi_f,Cch1_paralelo_bs_pi_f,Lch2_serie_bs_pi_f,Cch2_serie_bs_pi_f,Lch2_paralelo_bs_pi_f,Cch2_paralelo_bs_pi_f,Le_serie_bs_pi_f,Ce_serie_bs_pi_f,Le_paralelo_bs_pi_f,Ce_paralelo_bs_pi_f
end
