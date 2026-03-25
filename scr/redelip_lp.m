function varargout = redelip_lp(varargin)
% REDELIP_LP MATLAB code for redelip_lp.fig
%      REDELIP_LP, by itself, creates a new REDELIP_LP or raises the existing
%      singleton*.
%
%      H = REDELIP_LP returns the handle to a new REDELIP_LP or the handle to
%      the existing singleton*.
%
%      REDELIP_LP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REDELIP_LP.M with the given input arguments.
%
%      REDELIP_LP('Property','Value',...) creates a new REDELIP_LP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before redelip_lp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to redelip_lp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help redelip_lp

% Last Modified by GUIDE v2.5 12-Oct-2022 11:53:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @redelip_lp_OpeningFcn, ...
                   'gui_OutputFcn',  @redelip_lp_OutputFcn, ...
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


% --- Executes just before redelip_lp is made visible.
function redelip_lp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to redelip_lp (see VARARGIN)
%%%global nbtp sysbess kbt zbt pbt numbt denbt
global nbtp sysbess numbt denbt valbot vrs
nbtp=varargin{1}
sysbess=varargin{2}
%%%kbt=varargin{3}
%%%zbt=varargin{4}
%%%pbt=varargin{5}
numbt=varargin{3}
denbt=varargin{4}
valbot=varargin{5}
vrs=varargin{6}

% Choose default command line output for redelip_lp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes redelip_lp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = redelip_lp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k denbt numbt nbtp Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi valbot vrs
j=0;
k=0;
set(handles.rd_elip,'String'," ")
cla(handles.rdelip_lp,'reset')
set(handles.resistor_redelip_lp,'String'," ")
set(handles.ind_redelip_lp,'String'," ")
set(handles.capacitor_redelip_lp,'String'," ")
%[indpa,capa,indpa_pi,capa_pi]=elementhomson(denbt,numbt,nbtp,1,1)
%[indpa,capa,indpa_pi,capa_pi]=elementosbesselthomson(denbt,numbt,nbt,RL,Rs)
[indpa,capa,indpa_pi,capa_pi]=elementosbesselthomson(denbt,numbt,nbtp,1,vrs)
if valbot==1
    indpa_x=indpa
    capa_x=capa
    indpa_pi_x=indpa_pi
    capa_pi_x=capa_pi
elseif valbot==2
    indpa_x=flip(capa)
    capa_x=flip(indpa)
    indpa_pi_x=flip(capa_pi)
    capa_pi_x=flip(indpa_pi)
else
  indpa_x=0;
  capa_x=0;
  indpa_pi_x=0;
  capa_pi_x=0;
end

Lbett_f=indpa_x
Cbett_f=capa_x
Lbetpi_f=indpa_pi_x
Cbetpi_f=capa_pi_x

% --- Executes on button press in redtelip_lp.
function redtelip_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redtelip_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp numbt denbt indpa capa indpa_pi capa_pi Lbett_f Cbett_f j vrs

j=get(handles.redtelip_lp,'Value')
set(handles.rd_elip,'String','Red tipo T');
%[indpa,capa,indpa_pi,capa_pi]=elementosbessel(denbt,numbt,nbtp,1,1);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([vrs 1]); 
Resistores=strcat(erres,Res);
%Inductores
%Lbett_f=indpa;
syms L
im=0;
h=length(Lbett_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbett_f));
%Capacitores
%Cbett_f=capa;
syms C
im=0;
h=length(Cbett_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbett_f));

if nbtp==2
axes(handles.rdelip_lp)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%

elseif nbtp==3
axes(handles.rdelip_lp)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==4
axes(handles.rdelip_lp)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==5
axes(handles.rdelip_lp)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==6
axes(handles.rdelip_lp)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==7
axes(handles.rdelip_lp)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==8
axes(handles.rdelip_lp)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==9
axes(handles.rdelip_lp)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==10
axes(handles.rdelip_lp)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==11
axes(handles.rdelip_lp)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==12
axes(handles.rdelip_lp)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==13
axes(handles.rdelip_lp)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==14
axes(handles.rdelip_lp)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==15
axes(handles.rdelip_lp)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==16
axes(handles.rdelip_lp)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==17
axes(handles.rdelip_lp)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==18
axes(handles.rdelip_lp)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==19
axes(handles.rdelip_lp)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==20
axes(handles.rdelip_lp)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==21
axes(handles.rdelip_lp)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
else
set(handles.resistor_redelip_lp,'String','NaN');
set(handles.ind_redelip_lp,'String','NaN');
set(handles.capacitor_redelip_lp,'String','NaN');
    msgbox('Red No Registrada','Red Eléctrica');
end

% --- Executes on button press in redpielip_lp.
function redpielip_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redpielip_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nbtp numbt denbt indpa capa indpa_pi capa_pi Lbetpi_f Cbetpi_f k vrs
k=get(handles.redpielip_lp,'Value')
set(handles.rd_elip,'String','Red tipo π');
%[indpa,capa,indpa_pi,capa_pi]=elementosbessel(denbt,numbt,nbtp,1,1); 

%Resistores
erres=string({'Rs= ','RL= '});
Res=string([vrs 1]); 
Resistores=strcat(erres,Res);
%Inductores
%Lbetpi_f=indpa_pi;
syms L
im=0;
h=length(Lbetpi_f);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lbetpi_f));
%Capacitores
%Cbetpi_f=capa_pi;
syms C
im=0;
h=length(Cbetpi_f);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cbetpi_f));

if nbtp==2
axes(handles.rdelip_lp)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%

elseif nbtp==3
axes(handles.rdelip_lp)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==4
axes(handles.rdelip_lp)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==5
axes(handles.rdelip_lp)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==6
axes(handles.rdelip_lp)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==7
axes(handles.rdelip_lp)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==8
axes(handles.rdelip_lp)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==9
axes(handles.rdelip_lp)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==10
axes(handles.rdelip_lp)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==11
axes(handles.rdelip_lp)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==12
axes(handles.rdelip_lp)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==13
axes(handles.rdelip_lp)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==14
axes(handles.rdelip_lp)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==15
axes(handles.rdelip_lp)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==16
axes(handles.rdelip_lp)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==17
axes(handles.rdelip_lp)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==18
axes(handles.rdelip_lp)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==19
axes(handles.rdelip_lp)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==20
axes(handles.rdelip_lp)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
elseif nbtp==21
axes(handles.rdelip_lp)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redelip_lp,'String',Resistores);
set(handles.ind_redelip_lp,'String',Inductores_lp);
set(handles.capacitor_redelip_lp,'String',Capacitores_lp);
%%%
else
set(handles.resistor_redelip_lp,'String','NaN');
set(handles.ind_redelip_lp,'String','NaN');
set(handles.capacitor_redelip_lp,'String','NaN');
    msgbox('Red No Registrada','Red Eléctrica');
end



% --- Executes on button press in fine4.
function fine4_Callback(hObject, eventdata, handles)
% hObject    handle to fine4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rege1.
function rege1_Callback(hObject, eventdata, handles)
% hObject    handle to rege1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden


% --- Executes on button press in bestranz.
function bestranz_Callback(hObject, eventdata, handles)
% hObject    handle to bestranz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%global nbtp sysbess kbt zbt pbt numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi j k
global nbtp sysbess numbt denbt Lbett_f indpa Cbett_f capa Lbetpi_f indpa_pi Cbetpi_f capa_pi j k valbot vrs
if j==0 && k==0
 warndlg('Generar la Red Eléctrica','Advertencia');
else
%%%    x=get(handles.resistor_redelip_lp,'String');
%%%    y=get(handles.ind_redelip_lp,'String');
%%%    z=get(handles.capacitor_redelip_lp,'String');
%%%    a=iscell(x)
%%%    b=iscell(y)
%%%    c=iscell(z)
%     x=str2double(get(handles.resistor_redbut_lp,'String'))
%     y=str2double(get(handles.ind_redbut_lp,'String'))
%     z=str2double(get(handles.capacitor_redbut_lp,'String'))
%%%   if ~iscell(x) || ~iscell(y) || ~iscell(z)
%%%    msgbox('Red No Registrada, elegir otro Método de Aproximación','Red Eléctrica');
%%%   else 
set(gcf,'visible','off');
%%%bethom_tranz(nbtp,sysbess,kbt,zbt,pbt,numbt,denbt,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi)
bethom_tranz(nbtp,sysbess,numbt,denbt,valbot,vrs,Lbett_f,indpa,Cbett_f,capa,Lbetpi_f,indpa_pi,Cbetpi_f,capa_pi)
%%%   end
end
