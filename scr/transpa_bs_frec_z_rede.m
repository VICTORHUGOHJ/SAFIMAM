function varargout = transpa_bs_frec_z_rede(varargin)
% TRANSPA_BS_FREC_Z_REDE MATLAB code for transpa_bs_frec_z_rede.fig
%      TRANSPA_BS_FREC_Z_REDE, by itself, creates a new TRANSPA_BS_FREC_Z_REDE or raises the existing
%      singleton*.
%
%      H = TRANSPA_BS_FREC_Z_REDE returns the handle to a new TRANSPA_BS_FREC_Z_REDE or the handle to
%      the existing singleton*.
%
%      TRANSPA_BS_FREC_Z_REDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_BS_FREC_Z_REDE.M with the given input arguments.
%
%      TRANSPA_BS_FREC_Z_REDE('Property','Value',...) creates a new TRANSPA_BS_FREC_Z_REDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_bs_frec_z_rede_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_bs_frec_z_rede_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_bs_frec_z_rede

% Last Modified by GUIDE v2.5 28-Oct-2022 09:40:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_bs_frec_z_rede_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_bs_frec_z_rede_OutputFcn, ...
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


% --- Executes just before transpa_bs_frec_z_rede is made visible.
function transpa_bs_frec_z_rede_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_bs_frec_z_rede (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_bs Bw_bs syspmax_bs_f syspmin_bs_f Cpabp_paralelo_bs_pi_f Lpabp_paralelo_bs_pi_f Cpabp_serie_bs_pi_f Lpabp_serie_bs_pi_f Cpabr_paralelo_bs_pi_f Lpabr_paralelo_bs_pi_f Cpabr_serie_bs_pi_f Lpabr_serie_bs_pi_f Cpabp_paralelo_bs_t_f Lpabp_paralelo_bs_t_f Cpabp_serie_bs_t_f Lpabp_serie_bs_t_f Cpabr_paralelo_bs_t_f Lpabr_paralelo_bs_t_f Cpabr_serie_bs_t_f Lpabr_serie_bs_t_f pabs_frec_z
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
Wc_bs=varargin{21};
Bw_bs=varargin{22};
syspmax_bs_f=varargin{23};
syspmin_bs_f=varargin{24};
Cpabp_paralelo_bs_pi_f=varargin{25};
Lpabp_paralelo_bs_pi_f=varargin{26};
Cpabp_serie_bs_pi_f=varargin{27};
Lpabp_serie_bs_pi_f=varargin{28};
Cpabr_paralelo_bs_pi_f=varargin{29};
Lpabr_paralelo_bs_pi_f=varargin{30};
Cpabr_serie_bs_pi_f=varargin{31};
Lpabr_serie_bs_pi_f=varargin{32};
Cpabp_paralelo_bs_t_f=varargin{33};
Lpabp_paralelo_bs_t_f=varargin{34};
Cpabp_serie_bs_t_f=varargin{35};
Lpabp_serie_bs_t_f=varargin{36};
Cpabr_paralelo_bs_t_f=varargin{37};
Lpabr_paralelo_bs_t_f=varargin{38};
Cpabr_serie_bs_t_f=varargin{39};
Lpabr_serie_bs_t_f=varargin{40};
pabs_frec_z=varargin{41};
% Choose default command line output for transpa_bs_frec_z_rede
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_bs_frec_z_rede wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_bs_frec_z_rede_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k
j=0;
k=0;
set(handles.rd_patran_bs_frec_z,'String'," ")
cla(handles.rdpa_bs_transf_frec_z,'reset')
set(handles.resistor_redpa_bs_trans_frec_z,'String'," ")
set(handles.ind_redpa_bs_transf_frec_z,'String'," ")
set(handles.cap_redpa_bs_transf_frec_z,'String'," ");
set(handles.capacitor_redpa_bs_transf_frec_z,'String'," ")
set(handles.inductor_redpa_bs_transf_frec_z,'String'," ")

% --- Executes on button press in redtpabs_transf_frec_z.
function redtpabs_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redtpabs_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobr f_paobp valor_rs npa pabs_frec_z Cpabp_paralelo_bs_t_f Lpabp_paralelo_bs_t_f Cpabp_serie_bs_t_f Lpabp_serie_bs_t_f Cpabr_paralelo_bs_t_f Lpabr_paralelo_bs_t_f Cpabr_serie_bs_t_f Lpabr_serie_bs_t_f j
%Lpabp_bp_t Cpabp_bp_t Cpabp_bp_pi Lpabp_bp_pi Lpabr_bp_t Cpabr_bp_t Cpabr_bp_pi Lpabr_bp_pi Wc_bp Bw_bp
j=get(handles.redtpabs_transf_frec_z,'Value');
set(handles.rd_patran_bs_frec_z,'String','T-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranbs_z_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranbs_z_red,'Value');
if f_paobp==1
%Resistor
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pabs_frec_z 1*pabs_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
Lpabp_paralelo_bs_t_f_z=pabs_frec_z.*Lpabp_paralelo_bs_t_f;
syms L
im=0;
h=length(Lpabp_paralelo_bs_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lpabp_paralelo_bs_t_f_z));
%Capacitores paralelo
Cpabp_paralelo_bs_t_f_z=(1/pabs_frec_z).*Cpabp_paralelo_bs_t_f;
syms C
im=0;
h=length(Cpabp_paralelo_bs_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cpabp_paralelo_bs_t_f_z));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
Lpabp_serie_bs_t_f_z=pabs_frec_z.*Lpabp_serie_bs_t_f;
syms L
im=0;
h=length(Lpabp_serie_bs_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lpabp_serie_bs_t_f_z));
%Capacitores serie
Cpabp_serie_bs_t_f_z=(1/pabs_frec_z).*Cpabp_serie_bs_t_f;
syms C
im=0;
h=length(Cpabp_serie_bs_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cpabp_serie_bs_t_f_z));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if npa==2
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==3
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==4
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==5
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==6
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==7
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==8
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==9
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==10
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==11
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==12
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==13
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==14
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==15
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==16
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==17
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==18
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==19
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==20
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==21
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pabs_frec_z 1*pabs_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
Lpabr_paralelo_bs_t_f_z=pabs_frec_z.*Lpabr_paralelo_bs_t_f;
syms L
im=0;
h=length(Lpabr_paralelo_bs_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lpabr_paralelo_bs_t_f_z));
%Capacitores paralelo
Cpabr_paralelo_bs_t_f_z=(1/pabs_frec_z).*Cpabr_paralelo_bs_t_f;
syms C
im=0;
h=length(Cpabr_paralelo_bs_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cpabr_paralelo_bs_t_f_z));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
Lpabr_serie_bs_t_f_z=pabs_frec_z.*Lpabr_serie_bs_t_f;
syms L
im=0;
h=length(Lpabr_serie_bs_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lpabr_serie_bs_t_f_z));
%Capacitores serie
Cpabr_serie_bs_t_f_z=(1/pabs_frec_z).*Cpabr_serie_bs_t_f;
syms C
im=0;
h=length(Cpabr_serie_bs_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cpabr_serie_bs_t_f_z));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if npa==2
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==3
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==4
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==5
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==6
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==7
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==8
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==9
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==10
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==11
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==12
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==13
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==14
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==15
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==16
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==17
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==18
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==19
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==20
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==21
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in redpipabs_transf_frec_z.
function redpipabs_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpipabs_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobr f_paobp valor_rs npa pabs_frec_z Cpabp_paralelo_bs_pi_f Lpabp_paralelo_bs_pi_f Cpabp_serie_bs_pi_f Lpabp_serie_bs_pi_f Cpabr_paralelo_bs_pi_f Lpabr_paralelo_bs_pi_f Cpabr_serie_bs_pi_f Lpabr_serie_bs_pi_f k
%Lpabp_bp_t Cpabp_bp_t Cpabp_bp_pi Lpabp_bp_pi Lpabr_bp_t Cpabr_bp_t Cpabr_bp_pi Lpabr_bp_pi Wc_bp Bw_bp
k=get(handles.redpipabs_transf_frec_z,'Value');
set(handles.rd_patran_bs_frec_z,'String','π-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranbs_z_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranbs_z_red,'Value');
if f_paobp==1
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pabs_frec_z 1*pabs_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
Lpabp_paralelo_bs_pi_f_z=pabs_frec_z.*Lpabp_paralelo_bs_pi_f;
syms L
im=0;
h=length(Lpabp_paralelo_bs_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lpabp_paralelo_bs_pi_f_z));
%Capacitores paralelo
Cpabp_paralelo_bs_pi_f_z=(1/pabs_frec_z).*Cpabp_paralelo_bs_pi_f;
syms C
im=0;
h=length(Cpabp_paralelo_bs_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cpabp_paralelo_bs_pi_f_z));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
Lpabp_serie_bs_pi_f_z=pabs_frec_z.*Lpabp_serie_bs_pi_f;
syms L
im=0;
h=length(Lpabp_serie_bs_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lpabp_serie_bs_pi_f_z));
%Capacitores serie
Cpabp_serie_bs_pi_f_z=(1/pabs_frec_z).*Cpabp_serie_bs_pi_f;
syms C
im=0;
h=length(Cpabp_serie_bs_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cpabp_serie_bs_pi_f_z));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if npa==2
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==3
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==4
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==5
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==6
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==7
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==8
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==9
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==10
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==11
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==12
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==13
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==14
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==15
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==16
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==17
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==18
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==19
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==20
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==21
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pabs_frec_z 1*pabs_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores paralelo
Lpabr_paralelo_bs_pi_f_z=pabs_frec_z.*Lpabr_paralelo_bs_pi_f;
syms L
im=0;
h=length(Lpabr_paralelo_bs_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_paralelo = strcat(v,'=',string(Lpabr_paralelo_bs_pi_f_z));
%Capacitores paralelo
Cpabr_paralelo_bs_pi_f_z=(1/pabs_frec_z).*Cpabr_paralelo_bs_pi_f;
syms C
im=0;
h=length(Cpabr_paralelo_bs_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_paralelo = strcat(v,'=',string(Cpabr_paralelo_bs_pi_f_z));

%Euivalencia de Inductor en la Red
Ind_Cap_paralelo_bs_f = strcat(Inductores_bs_paralelo," ",Capacitores_bs_paralelo);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Inductores serie
Lpabr_serie_bs_pi_f_z=pabs_frec_z.*Lpabr_serie_bs_pi_f;
syms L
im=0;
h=length(Lpabr_serie_bs_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_bs_serie = strcat(v,'=',string(Lpabr_serie_bs_pi_f_z));
%Capacitores serie
Cpabr_serie_bs_pi_f_z=(1/pabs_frec_z).*Cpabr_serie_bs_pi_f;
syms C
im=0;
h=length(Cpabr_serie_bs_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_bs_serie = strcat(v,'=',string(Cpabr_serie_bs_pi_f_z));

%Euivalencia de Capacitor en la Red
Ind_Cap_serie_bs_f = strcat(Inductores_bs_serie," ",Capacitores_bs_serie);

if npa==2
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==3
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==4
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==5
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==6
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==7
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==8
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==9
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==10
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==11
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==12
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==13
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==14
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==15
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==16
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==17
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==18
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==19
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==20
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
elseif npa==21
axes(handles.rdpa_bs_transf_frec_z)
background=imread('bs_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_bs_trans_frec_z,'String',Resistores);
%set(handles.ind_redpa_bs_transf_frec_z,'String',Ind_Cap_serie_bs_f);
set(handles.ind_redpa_bs_transf_frec_z,'String',Inductores_bs_serie);
set(handles.cap_redpa_bs_transf_frec_z,'String',Capacitores_bs_serie);
%set(handles.capacitor_redpa_bs_transf_frec_z,'String',Ind_Cap_paralelo_bs_f);
set(handles.capacitor_redpa_bs_transf_frec_z,'String',Capacitores_bs_paralelo);
set(handles.inductor_redpa_bs_transf_frec_z,'String',Inductores_bs_paralelo);
%%%
else
    msgbox('Unregistered Network','Warning');
end


end

% --- Executes on button press in finpa27.
function finpa27_Callback(hObject, eventdata, handles)
% hObject    handle to finpa27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in regpa15.
function regpa15_Callback(hObject, eventdata, handles)
% hObject    handle to regpa15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi j k
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning');
else
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)
end
