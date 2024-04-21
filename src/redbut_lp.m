function varargout = redbut_lp(varargin)
% RDBUT_LP MATLAB code for rdbut_lp.fig
%      RDBUT_LP, by itself, creates a new RDBUT_LP or raises the existing
%      singleton*.
%
%      H = RDBUT_LP returns the handle to a new RDBUT_LP or the handle to
%      the existing singleton*.
%
%      RDBUT_LP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RDBUT_LP.M with the given input arguments.
%
%      RDBUT_LP('Property','Value',...) creates a new RDBUT_LP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before redbut_lp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to redbut_lp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rdbut_lp

% Last Modified by GUIDE v2.5 25-Oct-2022 18:34:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @redbut_lp_OpeningFcn, ...
                   'gui_OutputFcn',  @redbut_lp_OutputFcn, ...
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


% --- Executes just before rdbut_lp is made visible.
function redbut_lp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rdbut_lp (see VARARGIN)

global nb sysbut_lp kb zb pb numb denb amax amin nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp wc wsp f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp
nb=varargin{1};
sysbut_lp=varargin{2};
kb=varargin{3};
zb=varargin{4};
pb=varargin{5};
numb=varargin{6};
denb=varargin{7};
amax=varargin{8};
amin=varargin{9};
nch1=varargin{10};
f_but=varargin{11};
f_cheby1=varargin{12};
zc1=varargin{13};
pc1=varargin{14};
kc1=varargin{15};
numch1=varargin{16};
dench1=varargin{17};
sysch1_lp=varargin{18};
wc=varargin{19};
wsp=varargin{20};
f_cheby2=varargin{21};
f_elip=varargin{22};
nch2=varargin{23};
ne=varargin{24};
zc2=varargin{25};
pc2=varargin{26};
kc2=varargin{27};
numch2=varargin{28};
dench2=varargin{29};
sysch2_lp=varargin{30};
ze=varargin{31};
pe=varargin{32};
ke=varargin{33};
nume=varargin{34};
dene=varargin{35};
syse_lp=varargin{36};
% 
% Choose default command line output for rdbut_lp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rdbut_lp wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = redbut_lp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k l
j=0;
k=0;
l=0;
set(handles.rd,'String'," ")
cla(handles.rdbut_lp,'reset')
set(handles.resistor_redbut_lp,'String'," ")
set(handles.ind_redbut_lp,'String'," ")
set(handles.capacitor_redbut_lp,'String'," ")


% --- Executes on button press in redtbut_lp.
function redtbut_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redtbut_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%find_system('Name','sim1');
%open_system('sim1')
global nb wc wsp amax amin rs RL Lbu_lp_t Cbu_lp_t nch1 f_but f_cheby1 Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t j Lbu Cbu Lch1 Cch1 Lch2 Cch2 Le Ce l rd
j=get(handles.redtbut_lp,'Value');
%
RL=1; %Resistencia de Carga
%Ladderbut=1; %tipo de Red 1 para tipo T y 2 para tipo pi
if l==0
 set(handles.rd,'String','NaN');
 rd=get(handles.rd,'String');
 warndlg('Save Rs value','Warning')
else
set(handles.rd,'String','T-type network');
rd=get(handles.rd,'String');
rs=handles.rs;
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
%[Lbu,Cbu,Kbu]=BW_LADDER(wc,wsp,amax,amin,nb,Rs,RL,Ladderbut);
if ischar(Lbu) || ischar(Cbu)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
 Lbu_lp_t=0;
 Cbu_lp_t=0;

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lbu=round(Lbu,6);
Lbu_lp_t=Lbu(Lbu~=0);
syms L
im=0;
h=length(Lbu_lp_t);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbu_lp_t));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cbu=round(Cbu,6);
Cbu_lp_t=Cbu(Cbu~=0);
syms C
im=0;
h=length(Cbu_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbu_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nb==2
axes(handles.rdbut_lp)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==3
axes(handles.rdbut_lp)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==4
axes(handles.rdbut_lp)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==5
axes(handles.rdbut_lp)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==6
axes(handles.rdbut_lp)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==7
axes(handles.rdbut_lp)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==8
axes(handles.rdbut_lp)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==9
axes(handles.rdbut_lp)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==10
axes(handles.rdbut_lp)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==11
axes(handles.rdbut_lp)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==12
axes(handles.rdbut_lp)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==13
axes(handles.rdbut_lp)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==14
axes(handles.rdbut_lp)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==15
axes(handles.rdbut_lp)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==16
axes(handles.rdbut_lp)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==17
axes(handles.rdbut_lp)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==18
axes(handles.rdbut_lp)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==19
axes(handles.rdbut_lp)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==20
axes(handles.rdbut_lp)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==21
axes(handles.rdbut_lp)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
%%%%%%%%%CHEBY 1
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0 
%[Lch1,Cch1,Kch1]=CH_I_LADDER(wc,wsp,amax,amin,nch1,Rs,RL,1);
if ischar(Lch1) || ischar(Cch1)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
 Lch1_lp_t=0;
 Cch1_lp_t=0;
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lch1=round(Lch1,6);
Lch1_lp_t=Lch1(Lch1~=0);
syms L
im=0;
h=length(Lch1_lp_t);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch1_lp_t));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cch1=round(Cch1,6);
Cch1_lp_t=Cch1(Cch1~=0);
syms C
im=0;
h=length(Cch1_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch1_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nch1==2
axes(handles.rdbut_lp)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==3
axes(handles.rdbut_lp)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==4
axes(handles.rdbut_lp)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==5
axes(handles.rdbut_lp)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==6
axes(handles.rdbut_lp)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==7
axes(handles.rdbut_lp)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==8
axes(handles.rdbut_lp)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==9
axes(handles.rdbut_lp)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==10
axes(handles.rdbut_lp)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==11
axes(handles.rdbut_lp)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==12
axes(handles.rdbut_lp)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==13
axes(handles.rdbut_lp)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==14
axes(handles.rdbut_lp)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==15
axes(handles.rdbut_lp)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==16
axes(handles.rdbut_lp)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==17
axes(handles.rdbut_lp)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==18
axes(handles.rdbut_lp)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==19
axes(handles.rdbut_lp)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==20
axes(handles.rdbut_lp)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==21
axes(handles.rdbut_lp)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
%%%%%CHEBY 2
elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%[Gch2,Zch2,Pch2]=CH_II_POLES(wc,wsp,amax,amin,nch2);
%[Lch2,Cch2,Kch2]=CH_II_LADDER(Gch2,Zch2,Pch2,wc,wsp,Rs,RL,1);

if ischar(Lch2) || ischar(Cch2)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
 Lch2_lp_t=0;
 Cch2_lp_t=0;
else

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lch2=round(Lch2,6);
Lch2_lp_t=Lch2(Lch2~=0);
syms L
im=0;
h=length(Lch2_lp_t);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch2_lp_t));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cch2=round(Cch2,6);
Cch2_lp_t=Cch2(Cch2~=0);
syms C
im=0;
h=length(Cch2_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch2_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nch2==2
axes(handles.rdbut_lp)
background=imread('lp2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==3
axes(handles.rdbut_lp)
background=imread('lp2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==4
axes(handles.rdbut_lp)
background=imread('lp2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==5
axes(handles.rdbut_lp)
background=imread('lp2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==6
axes(handles.rdbut_lp)
background=imread('lp2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==7
axes(handles.rdbut_lp)
background=imread('lp2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==8
axes(handles.rdbut_lp)
background=imread('lp2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==9
axes(handles.rdbut_lp)
background=imread('lp2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==10
axes(handles.rdbut_lp)
background=imread('lp2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==11
axes(handles.rdbut_lp)
background=imread('lp2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==12
axes(handles.rdbut_lp)
background=imread('lp2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==13
axes(handles.rdbut_lp)
background=imread('lp2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==14
axes(handles.rdbut_lp)
background=imread('lp2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==15
axes(handles.rdbut_lp)
background=imread('lp2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==16
axes(handles.rdbut_lp)
background=imread('lp2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==17
axes(handles.rdbut_lp)
background=imread('lp2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==18
axes(handles.rdbut_lp)
background=imread('lp2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==19
axes(handles.rdbut_lp)
background=imread('lp2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==20
axes(handles.rdbut_lp)
background=imread('lp2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==21
axes(handles.rdbut_lp)
background=imread('lp2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
%%%%%ELIPTICO
else
% [Ge Ze R_ZEROSe Pe Wsnew]=CA_POLES(wc,wsp,amax,amin,ne);
% [Le Ce Rs RL WOei Kei]=CA_LADDER(Ge,Ze,R_ZEROSe,Pe,wc,wsp,Rs,RL,1);

if ischar(Le) || ischar(Ce)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
 Le_lp_t=0;
 Ce_lp_t=0;
else

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Le=round(Le,6);
Le_lp_t=Le(Le~=0);
syms L
im=0;
h=length(Le_lp_t);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Le_lp_t));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Ce=round(Ce,6);
Ce_lp_t=Ce(Ce~=0);
syms C
im=0;
h=length(Ce_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Ce_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if ne==2
axes(handles.rdbut_lp)
background=imread('lp2_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==3
axes(handles.rdbut_lp)
background=imread('lp2_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==4
axes(handles.rdbut_lp)
background=imread('lp2_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==5
axes(handles.rdbut_lp)
background=imread('lp2_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==6
axes(handles.rdbut_lp)
background=imread('lp2_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==7
axes(handles.rdbut_lp)
background=imread('lp2_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==8
axes(handles.rdbut_lp)
background=imread('lp2_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==9
axes(handles.rdbut_lp)
background=imread('lp2_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==10
axes(handles.rdbut_lp)
background=imread('lp2_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==11
axes(handles.rdbut_lp)
background=imread('lp2_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==12
axes(handles.rdbut_lp)
background=imread('lp2_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==13
axes(handles.rdbut_lp)
background=imread('lp2_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==14
axes(handles.rdbut_lp)
background=imread('lp2_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==15
axes(handles.rdbut_lp)
background=imread('lp2_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==16
axes(handles.rdbut_lp)
background=imread('lp2_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==17
axes(handles.rdbut_lp)
background=imread('lp2_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==18
axes(handles.rdbut_lp)
background=imread('lp2_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==19
axes(handles.rdbut_lp)
background=imread('lp2_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==20
axes(handles.rdbut_lp)
background=imread('lp2_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==21
axes(handles.rdbut_lp)
background=imread('lp2_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
end
end
% --- Executes on button press in redpibut_lp.
function redpibut_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redpibut_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nb wc wsp amax amin rs RL Lbu_lp_pi Cbu_lp_pi nch1 f_but f_cheby1 Lch1_lp_pi Cch1_lp_pi f_cheby2 f_elip nch2 ne Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi k Lbu_pi Cbu_pi Lch1_pi Cch1_pi Lch2_pi Cch2_pi Le_pi Ce_pi l rd
k=get(handles.redpibut_lp,'Value');
%Rs=1; %Resistencia Interna
RL=1; %Resistencia de Carga
if l==0
set(handles.rd,'String','NaN');
rd=get(handles.rd,'String');
 warndlg('Save Rs value','Warning')
 else
set(handles.rd,'String','π-type network');
rd=get(handles.rd,'String');
 rs=handles.rs;
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
% [Lbu,Cbu,Kbu]=BW_LADDER(wc,wsp,amax,amin,nb,Rs,RL,2);
if ischar(Lbu_pi) || ischar(Cbu_pi)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
Lbu_lp_pi=0;
Cbu_lp_pi=0;
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lbu_pi=round(Lbu_pi,6)
Lbu_lp_pi=Lbu_pi(Lbu_pi~=0)
syms L
im=0;
h=length(Lbu_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbu_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cbu_pi=round(Cbu_pi,6);
Cbu_lp_pi=Cbu_pi(Cbu_pi~=0);
syms C
im=0;
h=length(Cbu_lp_pi);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbu_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nb==2
axes(handles.rdbut_lp)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==3
axes(handles.rdbut_lp)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==4
axes(handles.rdbut_lp)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==5
axes(handles.rdbut_lp)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==6
axes(handles.rdbut_lp)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==7
axes(handles.rdbut_lp)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==8
axes(handles.rdbut_lp)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==9
axes(handles.rdbut_lp)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==10
axes(handles.rdbut_lp)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==11
axes(handles.rdbut_lp)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==12
axes(handles.rdbut_lp)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==13
axes(handles.rdbut_lp)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==14
axes(handles.rdbut_lp)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==15
axes(handles.rdbut_lp)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==16
axes(handles.rdbut_lp)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==17
axes(handles.rdbut_lp)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==18
axes(handles.rdbut_lp)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==19
axes(handles.rdbut_lp)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==20
axes(handles.rdbut_lp)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nb==21
axes(handles.rdbut_lp)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
%[Lch1,Cch1,Kch1]=CH_I_LADDER(wc,wsp,amax,amin,nch1,Rs,RL,0);
if ischar(Lch1_pi) || ischar(Cch1_pi)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
Lch1_lp_pi=0;
Cch1_lp_pi=0;
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lch1_pi=round(Lch1_pi,6);
Lch1_lp_pi=Lch1_pi(Lch1_pi~=0);
syms L
im=0;
h=length(Lch1_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch1_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cch1_pi=round(Cch1_pi,6);
Cch1_lp_pi=Cch1_pi(Cch1_pi~=0);
syms C
im=0;
h=length(Cch1_lp_pi);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch1_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nch1==2
axes(handles.rdbut_lp)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==3
axes(handles.rdbut_lp)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==4
axes(handles.rdbut_lp)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==5
axes(handles.rdbut_lp)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==6
axes(handles.rdbut_lp)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==7
axes(handles.rdbut_lp)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==8
axes(handles.rdbut_lp)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==9
axes(handles.rdbut_lp)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==10
axes(handles.rdbut_lp)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==11
axes(handles.rdbut_lp)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==12
axes(handles.rdbut_lp)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==13
axes(handles.rdbut_lp)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==14
axes(handles.rdbut_lp)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==15
axes(handles.rdbut_lp)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==16
axes(handles.rdbut_lp)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==17
axes(handles.rdbut_lp)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==18
axes(handles.rdbut_lp)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==19
axes(handles.rdbut_lp)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==20
axes(handles.rdbut_lp)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch1==21
axes(handles.rdbut_lp)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
% [Gch2,Zch2,Pch2]=CH_II_POLES(wc,wsp,amax,amin,nch2);
% [Lch2,Cch2,Kch2]=CH_II_LADDER(Gch2,Zch2,Pch2,wc,wsp,Rs,RL,0);
if ischar(Lch2_pi) || ischar(Cch2_pi)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
Lch2_lp_pi=0;
Cch2_lp_pi=0;
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Lch2_pi=round(Lch2_pi,6);
Lch2_lp_pi=Lch2_pi(Lch2_pi~=0);
syms L
im=0;
h=length(Lch2_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lch2_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Cch2_pi=round(Cch2_pi,6);
Cch2_lp_pi=Cch2_pi(Cch2_pi~=0);
syms C
im=0;
h=length(Cch2_lp_pi);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cch2_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if nch2==2
axes(handles.rdbut_lp)
background=imread('lp2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==3
axes(handles.rdbut_lp)
background=imread('lp2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==4
axes(handles.rdbut_lp)
background=imread('lp2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==5
axes(handles.rdbut_lp)
background=imread('lp2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==6
axes(handles.rdbut_lp)
background=imread('lp2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==7
axes(handles.rdbut_lp)
background=imread('lp2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==8
axes(handles.rdbut_lp)
background=imread('lp2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==9
axes(handles.rdbut_lp)
background=imread('lp2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==10
axes(handles.rdbut_lp)
background=imread('lp2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==11
axes(handles.rdbut_lp)
background=imread('lp2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==12
axes(handles.rdbut_lp)
background=imread('lp2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==13
axes(handles.rdbut_lp)
background=imread('lp2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==14
axes(handles.rdbut_lp)
background=imread('lp2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==15
axes(handles.rdbut_lp)
background=imread('lp2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==16
axes(handles.rdbut_lp)
background=imread('lp2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==17
axes(handles.rdbut_lp)
background=imread('lp2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==18
axes(handles.rdbut_lp)
background=imread('lp2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==19
axes(handles.rdbut_lp)
background=imread('lp2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==20
axes(handles.rdbut_lp)
background=imread('lp2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif nch2==21
axes(handles.rdbut_lp)
background=imread('lp2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
    msgbox('Unregistered Network','Warning');
end
end
%%%ELIPTICO
else
% [Ge Ze R_ZEROSe Pe Wsnew]=CA_POLES(wc,wsp,amax,amin,ne);
% [Le Ce Rs RL WOei Kei]=CA_LADDER(Ge,Ze,R_ZEROSe,Pe,wc,wsp,Rs,RL,0);
if ischar(Le_pi) || ischar(Ce_pi)
warndlg('Network Synthesis Not Feasible','Warning');
    set(handles.rd,'String'," ")
    cla(handles.rdbut_lp,'reset')
    set(handles.resistor_redbut_lp,'String','NaN');
    set(handles.ind_redbut_lp,'String','NaN');
    set(handles.capacitor_redbut_lp,'String','NaN');
Le_lp_pi=0;
Ce_lp_pi=0;
else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([rs RL]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
Le_pi=round(Le_pi,6);
Le_lp_pi=Le_pi(Le_pi~=0);
syms L
im=0;
h=length(Le_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Le_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
Ce_pi=round(Ce_pi,6);
Ce_lp_pi=Ce_pi(Ce_pi~=0);
syms C
im=0;
h=length(Ce_lp_pi);
aux=ones(1,h);
for y=1:1:h
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Ce_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if ne==2
axes(handles.rdbut_lp)
background=imread('lp2_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==3
axes(handles.rdbut_lp)
background=imread('lp2_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==4
axes(handles.rdbut_lp)
background=imread('lp2_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==5
axes(handles.rdbut_lp)
background=imread('lp2_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==6
axes(handles.rdbut_lp)
background=imread('lp2_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==7
axes(handles.rdbut_lp)
background=imread('lp2_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==8
axes(handles.rdbut_lp)
background=imread('lp2_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==9
axes(handles.rdbut_lp)
background=imread('lp2_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==10
axes(handles.rdbut_lp)
background=imread('lp2_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==11
axes(handles.rdbut_lp)
background=imread('lp2_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==12
axes(handles.rdbut_lp)
background=imread('lp2_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==13
axes(handles.rdbut_lp)
background=imread('lp2_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==14
axes(handles.rdbut_lp)
background=imread('lp2_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==15
axes(handles.rdbut_lp)
background=imread('lp2_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==16
axes(handles.rdbut_lp)
background=imread('lp2_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==17
axes(handles.rdbut_lp)
background=imread('lp2_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==18
axes(handles.rdbut_lp)
background=imread('lp2_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==19
axes(handles.rdbut_lp)
background=imread('lp2_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==20
axes(handles.rdbut_lp)
background=imread('lp2_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

elseif ne==21
axes(handles.rdbut_lp)
background=imread('lp2_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redbut_lp,'String',Resistores);
set(handles.ind_redbut_lp,'String',Inductores_lp);
set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
%%%

else
set(handles.resistor_redbut_lp,'String','NaN');
set(handles.ind_redbut_lp,'String','NaN');
set(handles.capacitor_redbut_lp,'String','NaN');
msgbox('Unregistered Network','Warning');
end
end
end
end

% --- Executes on button press in fin5.
function fin5_Callback(hObject, eventdata, handles)
% hObject    handle to fin5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clearvars,clc,close all


% --- Executes on button press in transf.
function transf_Callback(hObject, eventdata, handles)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t j k rd
rs=handles.rs;
if rs<0 || ~isnumeric(rs) || ~isreal(rs) || isnan(rs)
 msgbox('Enter a value of Rs that is real and greater than zero','Warning');
else
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning')
else
d1=strcmp(rd,'NaN');
d2=strcmp(rd,'π-type network');
d3=strcmp(rd,'T-type network');
if d1==1
 warndlg('Save value of Rs','Warning')
else
    x=get(handles.resistor_redbut_lp,'String');
    y=get(handles.ind_redbut_lp,'String');
    z=get(handles.capacitor_redbut_lp,'String');
%     a=iscell(x);
%     b=iscell(y);
%     c=iscell(z);
m='NaN';

q1=strcmp(m,x); %si son 1 son iguales con NaN
q1=unique(q1);
q2=strcmp(m,y);
q2=unique(q2);
q3=strcmp(m,z);
q3=unique(q3);
%     x=str2double(get(handles.resistor_redbut_lp,'String'))
%     y=str2double(get(handles.ind_redbut_lp,'String'))
%     z=str2double(get(handles.capacitor_redbut_lp,'String'))
    if q1==1 || q2==1 || q3==1
        msgbox('Unregistered Network, choose another Approach Method','Warning');
    else
set(gcf,'visible','off');
tranbut(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t)
   end
end
end
end
% hObject    handle to transf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in otaprox.
function otaprox_Callback(hObject, eventdata, handles)
% hObject    handle to otaprox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden



function rs_Callback(hObject, eventdata, handles)
% hObject    handle to rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rs as text
%        str2double(get(hObject,'String')) returns contents of rs as a double
rs=get(hObject,'String'); 
rs=str2double(rs);
handles.rs=rs;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function rs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guardars.
function guardars_Callback(hObject, eventdata, handles)
% hObject    handle to guardars (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global wc wsp amax amin nb nch1 nch2 ne Lbu Cbu Lch1 Cch1 Lch2 Cch2 Le Ce Lbu_pi Cbu_pi Lch1_pi Cch1_pi Lch2_pi Cch2_pi Le_pi Ce_pi rs l j k
%red tipo t
l=get(handles.guardars,'Value');
j=0;
k=0;
set(handles.rd,'String'," ")
cla(handles.rdbut_lp,'reset')
set(handles.resistor_redbut_lp,'String'," ")
set(handles.ind_redbut_lp,'String'," ")
set(handles.capacitor_redbut_lp,'String'," ")
rs=handles.rs;
if rs<0 || ~isnumeric(rs) || ~isreal(rs) || isnan(rs)
 msgbox('Enter a value of Rs that is real and greater than zero','Warning');
l=0;
else
Ladderbut=1;
Laddercheb=1;
if mod(nb, 2) == 0 		%par	
		if (rs > 1 & Ladderbut == 1)
            Lbu='0';
            Cbu='0';
        else
[Lbu,Cbu,Kbu]=BW_LADDER(wc,wsp,amax,amin,nb,rs,1,Ladderbut);
        end
else
 [Lbu,Cbu,Kbu]=BW_LADDER(wc,wsp,amax,amin,nb,rs,1,Ladderbut);
end


if mod(nch1, 2) == 0 		%par	
		if (rs > 1 & Laddercheb == 1)
            Lch1='0';
            Cch1='0';
        else
[Lch1,Cch1,Kch1]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb);
        end
else
 [Lch1,Cch1,Kch1]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb);
end

%[Lch1,Cch1,Kch1]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb)
try
[Gch2,Zch2,Pch2]=CH_II_POLES(wc,wsp,amax,amin,nch2);
[Lch2,Cch2,Kch2]=CH_II_LADDER(Gch2,Zch2,Pch2,wc,wsp,rs,1,1);
catch
    Lch2='0';
    Cch2='0';
end
try
[Ge Ze R_ZEROSe Pe Wsnew]=CA_POLES(wc,wsp,amax,amin,ne);
[Le Ce Rs RL WOei Kei]=CA_LADDER(Ge,Ze,R_ZEROSe,Pe,wc,wsp,rs,1,1);
catch
    Le='0';
    Ce='0';
end
%red tipo pi
Ladderbut2=2;
Laddercheb2=0;
if mod(nb, 2) == 0 		%par	
		if (rs < 1 & Ladderbut2 == 2)
            Lbu_pi='0';
            Cbu_pi='0';
        else
[Lbu_pi,Cbu_pi,Kbu_pi]=BW_LADDER(wc,wsp,amax,amin,nb,rs,1,Ladderbut2);
        end
else
    [Lbu_pi,Cbu_pi,Kbu_pi]=BW_LADDER(wc,wsp,amax,amin,nb,rs,1,Ladderbut2);
end
%[Lbu_pi,Cbu_pi,Kbu_pi]=BW_LADDER(wc,wsp,amax,amin,nb,rs,1,Ladderbut2)

if mod(nch1, 2) == 0 		%par	
		if (rs < 1 & Laddercheb2 == 0)
            Lch1_pi='0';
            Cch1_pi='0';
        else
[Lch1_pi,Cch1_pi,Kch1_pi]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb2);
        end
else
 [Lch1_pi,Cch1_pi,Kch1_pi]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb2);
end

%[Lch1_pi,Cch1_pi,Kch1_pi]=CH_I_LADDER(wc,wsp,amax,amin,nch1,rs,1,Laddercheb2)
try
[Gch2_pi,Zch2_pi,Pch2_pi]=CH_II_POLES(wc,wsp,amax,amin,nch2);
[Lch2_pi,Cch2_pi,Kch2_pi]=CH_II_LADDER(Gch2_pi,Zch2_pi,Pch2_pi,wc,wsp,rs,1,0);
catch
    Lch2_pi='0';
    Cch2_pi='0';
end
try
[Ge_pi Ze_pi R_ZEROSe_pi Pe_pi Wsnew_pi]=CA_POLES(wc,wsp,amax,amin,ne);
[Le_pi Ce_pi Rs_pi RL_pi WOei_pi Kei_pi]=CA_LADDER(Ge_pi,Ze_pi,R_ZEROSe_pi,Pe_pi,wc,wsp,rs,1,0);
catch
    Le_pi='0';
    Ce_pi='0';
end


end
