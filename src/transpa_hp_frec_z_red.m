function varargout = transpa_hp_frec_z_red(varargin)
% TRANSPA_HP_FREC_Z_RED MATLAB code for transpa_hp_frec_z_red.fig
%      TRANSPA_HP_FREC_Z_RED, by itself, creates a new TRANSPA_HP_FREC_Z_RED or raises the existing
%      singleton*.
%
%      H = TRANSPA_HP_FREC_Z_RED returns the handle to a new TRANSPA_HP_FREC_Z_RED or the handle to
%      the existing singleton*.
%
%      TRANSPA_HP_FREC_Z_RED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_HP_FREC_Z_RED.M with the given input arguments.
%
%      TRANSPA_HP_FREC_Z_RED('Property','Value',...) creates a new TRANSPA_HP_FREC_Z_RED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_hp_frec_z_red_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_hp_frec_z_red_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_hp_frec_z_red

% Last Modified by GUIDE v2.5 28-Oct-2022 06:57:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_hp_frec_z_red_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_hp_frec_z_red_OutputFcn, ...
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


% --- Executes just before transpa_hp_frec_z_red is made visible.
function transpa_hp_frec_z_red_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_hp_frec_z_red (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_hp syspmax_hp_f syspmin_hp_f Lpabp_hp_t_f Cpabp_hp_t_f Lpabr_hp_t_f Cpabr_hp_t_f Lpabp_hp_pi_f Cpabp_hp_pi_f Lpabr_hp_pi_f Cpabr_hp_pi_f pahp_frec_z
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
Wc_hp=varargin{21};
syspmax_hp_f=varargin{22};
syspmin_hp_f=varargin{23};
Lpabp_hp_t_f=varargin{24};
Cpabp_hp_t_f=varargin{25};
Lpabr_hp_t_f=varargin{26};
Cpabr_hp_t_f=varargin{27};
Lpabp_hp_pi_f=varargin{28};
Cpabp_hp_pi_f=varargin{29};
Lpabr_hp_pi_f=varargin{30};
Cpabr_hp_pi_f=varargin{31};
pahp_frec_z=varargin{32};
% Choose default command line output for transpa_hp_frec_z_red
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_hp_frec_z_red wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_hp_frec_z_red_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k
j=0;
k=0;
set(handles.rd_patran_hp_frec_z,'String'," ")
cla(handles.rdpa_hp_transf_frec_z,'reset')
set(handles.resistor_redpa_hp_trans_frec_z,'String'," ")
set(handles.ind_redpa_hp_transf_frec_z,'String'," ")
set(handles.capacitor_redpa_hp_transf_frec_z,'String'," ")

% --- Executes on button press in redtpahp_transf_frec_z.
function redtpahp_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redtpahp_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobr f_paobp valor_rs npa pahp_frec_z Lpabp_hp_t_f Cpabp_hp_t_f Lpabr_hp_t_f Cpabr_hp_t_f j
%Wc_hp Lpabp_hp_t_f Cpabp_hp_t_f Lpabr_hp_t_f Cpabr_hp_t_f Lpabp_hp_pi_f Cpabp_hp_pi_f Lpabr_hp_pi_f Cpabr_hp_pi_f 
j=get(handles.redtpahp_transf_frec_z,'Value');
set(handles.rd_patran_hp_frec_z,'String','T-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranhp_z_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranhp_z_red,'Value');
if f_paobp==1
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pahp_frec_z 1*pahp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lpabp_hp_t_f_z=pahp_frec_z.*Lpabp_hp_t_f;
syms L
im=0;
h=length(Lpabp_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_hp_t_f_z));
%Capacitores
Cpabp_hp_t_f_z=(1/pahp_frec_z).*Cpabp_hp_t_f;
syms C
im=0;
h=length(Cpabp_hp_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_hp_t_f_z));

if npa==2
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pahp_frec_z 1*pahp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lpabr_hp_t_f_z=pahp_frec_z.*Lpabr_hp_t_f;
syms L
im=0;
h=length(Lpabr_hp_t_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_hp_t_f_z));
%Capacitores
Cpabr_hp_t_f_z=(1/pahp_frec_z).*Cpabr_hp_t_f;
syms C
im=0;
h=length(Cpabr_hp_t_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_hp_t_f_z));

if npa==2
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in redpipahp_transf_frec_z.
function redpipahp_transf_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpipahp_transf_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobr f_paobp valor_rs npa pahp_frec_z Lpabp_hp_pi_f Cpabp_hp_pi_f Lpabr_hp_pi_f Cpabr_hp_pi_f k
k=get(handles.redpipahp_transf_frec_z,'Value');
set(handles.rd_patran_hp_frec_z,'String','π-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranhp_z_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranhp_z_red,'Value');
if f_paobp==1
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pahp_frec_z 1*pahp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lpabp_hp_pi_f_z=pahp_frec_z.*Lpabp_hp_pi_f;
syms L
im=0;
h=length(Lpabp_hp_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_hp_pi_f_z));
%Capacitores
Cpabp_hp_pi_f_z=(1/pahp_frec_z).*Cpabp_hp_pi_f;
syms C
im=0;
h=length(Cpabp_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_hp_pi_f_z));

if npa==2
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*pahp_frec_z 1*pahp_frec_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lpabr_hp_pi_f_z=pahp_frec_z.*Lpabr_hp_pi_f;
syms L
im=0;
h=length(Lpabr_hp_pi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_hp_pi_f_z));
%Capacitores
Cpabr_hp_pi_f_z=(1/pahp_frec_z).*Cpabr_hp_pi_f;
syms C
im=0;
h=length(Cpabr_hp_pi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_hp_pi_f_z));

if npa==2
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_hp_transf_frec_z)
background=imread('hp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_hp_trans_frec_z,'String',Resistores);
set(handles.ind_redpa_hp_transf_frec_z,'String',Inductores_lp);
set(handles.capacitor_redpa_hp_transf_frec_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in finpa33.
function finpa33_Callback(hObject, eventdata, handles)
% hObject    handle to finpa33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in regpa19.
function regpa19_Callback(hObject, eventdata, handles)
% hObject    handle to regpa19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi j k
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning');
else
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)
end
