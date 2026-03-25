function varargout = bessredlpz(varargin)
% BESSREDLPZ MATLAB code for bessredlpz.fig
%      BESSREDLPZ, by itself, creates a new BESSREDLPZ or raises the existing
%      singleton*.
%
%      H = BESSREDLPZ returns the handle to a new BESSREDLPZ or the handle to
%      the existing singleton*.
%
%      BESSREDLPZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BESSREDLPZ.M with the given input arguments.
%
%      BESSREDLPZ('Property','Value',...) creates a new BESSREDLPZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bessredlpz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bessredlpz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bessredlpz

% Last Modified by GUIDE v2.5 20-Apr-2023 09:18:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bessredlpz_OpeningFcn, ...
                   'gui_OutputFcn',  @bessredlpz_OutputFcn, ...
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


% --- Executes just before bessredlpz is made visible.
function bessredlpz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bessredlpz (see VARARGIN)
global nbtp sysbess numbt denbt valbot vrs Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi znbes
nbtp=varargin{1}
sysbess=varargin{2}
%%%kbt=varargin{3}
%%%zbt=varargin{4}
%%%pbt=varargin{5}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}
vrs=varargin{6}
Lbett_f=varargin{7}
indpa=varargin{8}
Cbett_f=varargin{9}
capa=varargin{10}
Lbetpi_f=varargin{11}
indpa_pi=varargin{12}
Cbetpi_f=varargin{13}
capa_pi=varargin{14}
znbes=varargin{15}
% Choose default command line output for bessredlpz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bessredlpz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bessredlpz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k znbes Lbett_f Cbett_f Lbetpi_f Cbetpi_f Lbett_f_z Cbett_f_z Lbetpi_f_z Cbetpi_f_z
j=0;
k=0;
set(handles.rd_elip_z,'String'," ")
cla(handles.rdelip_lp_z,'reset')
set(handles.resistor_redelip_lp_z,'String'," ")
set(handles.ind_redelip_lp_z,'String'," ")
set(handles.capacitor_redelip_lp_z,'String'," ")
Lbett_f_z=znbes.*Lbett_f;
Cbett_f_z=(1/znbes).*Cbett_f;
Lbetpi_f_z=znbes.*Lbetpi_f;
Cbetpi_f_z=(1/znbes).*Cbetpi_f;

% --- Executes on button press in redtelip_lp_z.
function redtelip_lp_z_Callback(hObject, eventdata, handles)
% hObject    handle to redtelip_lp_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp znbes Lbett_f_z Cbett_f_z j vrs
j=get(handles.redtelip_lp_z,'Value')
set(handles.rd_elip_z,'String','Red tipo T');
%[indpa,capa,indpa_pi,capa_pi]=elementosbessel(denbt,numbt,nbtp,1,1);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([vrs*znbes 1*znbes]); 
Resistores=strcat(erres,Res);
%Inductores
%Lbett_f=indpa;
syms L
im=0;
h=length(Lbett_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbett_f_z));
%Capacitores
%Cbett_f=capa;
syms C
im=0;
h=length(Cbett_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbett_f_z));

if nbtp==2
axes(handles.rdelip_lp_z)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%

elseif nbtp==3
axes(handles.rdelip_lp_z)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==4
axes(handles.rdelip_lp_z)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==5
axes(handles.rdelip_lp_z)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==6
axes(handles.rdelip_lp_z)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==7
axes(handles.rdelip_lp_z)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==8
axes(handles.rdelip_lp_z)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==9
axes(handles.rdelip_lp_z)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==10
axes(handles.rdelip_lp_z)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==11
axes(handles.rdelip_lp_z)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==12
axes(handles.rdelip_lp_z)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==13
axes(handles.rdelip_lp_z)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==14
axes(handles.rdelip_lp_z)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==15
axes(handles.rdelip_lp_z)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==16
axes(handles.rdelip_lp_z)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==17
axes(handles.rdelip_lp_z)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==18
axes(handles.rdelip_lp_z)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==19
axes(handles.rdelip_lp_z)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==20
axes(handles.rdelip_lp_z)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==21
axes(handles.rdelip_lp_z)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
else
    msgbox('Red No Registrada','Red Eléctrica');
end

% --- Executes on button press in redpielip_lp_z.
function redpielip_lp_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpielip_lp_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Lbetpi_f_z Cbetpi_f_z
% Lbetpi_f_z Cbetpi_f_z
global nbtp znbes Lbetpi_f_z Cbetpi_f_z k vrs
k=get(handles.redpielip_lp_z,'Value')
set(handles.rd_elip_z,'String','Red tipo π');
%[indpa,capa,indpa_pi,capa_pi]=elementosbessel(denbt,numbt,nbtp,1,1); 

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([vrs*znbes 1*znbes]); 
Resistores=strcat(erres,Res);
%Inductores
%Lbetpi_f=indpa_pi;
syms L
im=0;
h=length(Lbetpi_f_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbetpi_f_z));
%Capacitores
%Cbetpi_f=capa_pi;
syms C
im=0;
h=length(Cbetpi_f_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbetpi_f_z));

if nbtp==2
axes(handles.rdelip_lp_z)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%

elseif nbtp==3
axes(handles.rdelip_lp_z)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==4
axes(handles.rdelip_lp_z)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==5
axes(handles.rdelip_lp_z)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==6
axes(handles.rdelip_lp_z)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==7
axes(handles.rdelip_lp_z)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==8
axes(handles.rdelip_lp_z)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==9
axes(handles.rdelip_lp_z)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==10
axes(handles.rdelip_lp_z)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==11
axes(handles.rdelip_lp_z)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==12
axes(handles.rdelip_lp_z)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==13
axes(handles.rdelip_lp_z)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==14
axes(handles.rdelip_lp_z)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==15
axes(handles.rdelip_lp_z)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==16
axes(handles.rdelip_lp_z)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==17
axes(handles.rdelip_lp_z)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==18
axes(handles.rdelip_lp_z)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==19
axes(handles.rdelip_lp_z)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==20
axes(handles.rdelip_lp_z)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
elseif nbtp==21
axes(handles.rdelip_lp_z)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp_z,'String',Resistores);
set(handles.ind_redelip_lp_z,'String',Inductores_lp);
set(handles.capacitor_redelip_lp_z,'String',Capacitores_lp);
%%%
else
    msgbox('Red No Registrada','Red Eléctrica');
end


% --- Executes on button press in finbes4.
function finbes4_Callback(hObject, eventdata, handles)
% hObject    handle to finbes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in bereg3.
function bereg3_Callback(hObject, eventdata, handles)
% hObject    handle to bereg3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global j k
if j==0 && k==0
 warndlg('Generar la Red Eléctrica','Advertencia');
else
set(gcf,'visible','off');
orden
end
