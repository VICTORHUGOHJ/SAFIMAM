function varargout = filtropa_lp_redreal(varargin)
% FILTROPA_LP_REDREAL MATLAB code for filtropa_lp_redreal.fig
%      FILTROPA_LP_REDREAL, by itself, creates a new FILTROPA_LP_REDREAL or raises the existing
%      singleton*.
%
%      H = FILTROPA_LP_REDREAL returns the handle to a new FILTROPA_LP_REDREAL or the handle to
%      the existing singleton*.
%
%      FILTROPA_LP_REDREAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_LP_REDREAL.M with the given input arguments.
%
%      FILTROPA_LP_REDREAL('Property','Value',...) creates a new FILTROPA_LP_REDREAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_lp_redreal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_lp_redreal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_lp_redreal

% Last Modified by GUIDE v2.5 14-Oct-2022 08:48:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_lp_redreal_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_lp_redreal_OutputFcn, ...
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


% --- Executes just before filtropa_lp_redreal is made visible.
function filtropa_lp_redreal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_lp_redreal (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs
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

% Choose default command line output for filtropa_lp_redreal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_lp_redreal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtropa_lp_redreal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k numerador denparcial numin denminparcial valor_rs npa indpa capa capa_pi indpa_pi indpabr capabr capa_pibr indpa_pibr Lpabp_lp_t Cpabp_lp_t Lpabr_lp_t Cpabr_lp_t Lpabp_lp_pi Cpabp_lp_pi Lpabr_lp_pi Cpabr_lp_pi tawosnum_max taparealnum_max tawosden_max taparealden_max tawosnum_min taparealnum_min tawosden_min taparealden_min num1 den1 num2 den2
j=0;
k=0;
set(handles.tipordpa,'String'," ")
cla(handles.rdpa_lp,'reset')
set(handles.resistor_redpa_lp,'String'," ")
set(handles.ind_redpa_lp,'String'," ")
set(handles.capacitor_redpa_lp,'String'," ")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[tawosnum_max taparealnum_max tawosden_max taparealden_max]=tamaniospascalnumden(numerador,denparcial,valor_rs);
[tawosnum_min taparealnum_min tawosden_min taparealden_min]=tamaniospascalnumden(numin,denminparcial,valor_rs);
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%[indpa,capa,capa_pi,indpa_pi,num1,den1]=pascalelementos(numerador,denparcial,1,valor_rs,npa)
%[indpabr,capabr,capa_pibr,indpa_pibr,num2,den2]=pascalelementos(numin,denminparcial,1,valor_rs,npa)
[indpa,capa,capa_pi,indpa_pi,num1,den1]=elementospascal(numerador,denparcial,1,valor_rs,npa);
[indpabr,capabr,capa_pibr,indpa_pibr,num2,den2]=elementospascal(numin,denminparcial,1,valor_rs,npa);


num1=length(sym2poly(num1));
num2=length(sym2poly(num2));
den1=length(sym2poly(den1));
den2=length(sym2poly(den2));

Lpabp_lp_t=indpa; %tenia round (,6)
Cpabp_lp_t=capa;
Lpabr_lp_t=indpabr;
Cpabr_lp_t=capabr;
Lpabp_lp_pi=indpa_pi;
Cpabp_lp_pi=capa_pi;
Lpabr_lp_pi=indpa_pibr;
Cpabr_lp_pi=capa_pibr;


% --- Executes on button press in redtpa_lp.
function redtpa_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redtpa_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr numerador denparcial numin denminparcial valor_rs npa indpa capa capa_pi indpa_pi indpabr capabr capa_pibr indpa_pibr Lpabp_lp_t Cpabp_lp_t Lpabr_lp_t Cpabr_lp_t j tawosnum_max taparealnum_max tawosden_max taparealden_max tawosnum_min taparealnum_min tawosden_min taparealden_min num1 den1 num2 den2
j=get(handles.redtpa_lp,'Value');
%T-type network
set(handles.tipordpa,'String','T-type network');
f_paobp=get(handles.fpa_opt_bp_real,'Value');
f_paobr=get(handles.fpa_opt_br_real,'Value');

if f_paobp==1
%if tawosnum_max~=taparealnum_max || tawosden_max~=taparealden_max
if num1==length(0) || den1==length(0)
    den1==length(0);
    num1==length(0);
warndlg('Network Synthesis Not Feasible','Warning');
    j=0;
else
    den1==length(0);
    num1==length(0);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs 1]); 
Resistores=strcat(erres,Res);

%Inductores
%Lpabp_lp_t=indpa;
syms L
im=0;
h=length(Lpabp_lp_t);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_lp_t));

%Capacitores 
%Cpabp_lp_t=capa;
syms C
im=0;
h=length(Cpabp_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if npa==2
axes(handles.rdpa_lp)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered network','Warning');
end
end
else
%if tawosnum_min~=taparealnum_min || tawosden_min~=taparealden_min
if num2==length(0) || den2==length(0)
    den2==length(0)
    num2==length(0)
warndlg('Network Synthesis Not Feasible','Warning');
    j=0;
else
    den2==length(0);
    num2==length(0);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs 1]); 
Resistores=strcat(erres,Res);

%Inductores
%Lpabr_lp_t=indpabr;
syms L
im=0;
h=length(Lpabr_lp_t);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_lp_t));

%Capacitores 
%Cpabr_lp_t=capabr;
syms C
im=0;
h=length(Cpabr_lp_t);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_lp_t));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);

if npa==2
axes(handles.rdpa_lp)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end
end
end
% --- Executes on button press in redpipa_lp.
function redpipa_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redpipa_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr numerador denparcial numin denminparcial valor_rs npa indpa capa capa_pi indpa_pi indpabr capabr capa_pibr indpa_pibr Cpabp_lp_pi Lpabp_lp_pi Cpabr_lp_pi Lpabr_lp_pi k tawosnum_max taparealnum_max tawosden_max taparealden_max tawosnum_min taparealnum_min tawosden_min taparealden_min num1 den1 num2 den2
k=get(handles.redpipa_lp,'Value');
set(handles.tipordpa,'String','π-type network');
f_paobp=get(handles.fpa_opt_bp_real,'Value');
f_paobr=get(handles.fpa_opt_br_real,'Value');
if f_paobp==1
%if tawosnum_max~=taparealnum_max || tawosden_max~=taparealden_max
if num1==length(0) || den1==length(0)
        den1==length(0);
    num1==length(0);
warndlg('Network Synthesis Not Feasible','Warning');
    k=0;
else
     den1==length(0);
    num1==length(0);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs 1]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
%Lpabp_lp_pi=indpa_pi;
syms L
im=0;
h=length(Lpabp_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
%Cpabp_lp_pi=capa_pi;
syms C
im=0;
h=length(Cpabp_lp_pi);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
if npa==2
axes(handles.rdpa_lp)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered network','Warning');
end
end
else
%if tawosnum_min~=taparealnum_min || tawosden_min~=taparealden_min
if num2==length(0) || den2==length(0)
    den2==length(0);
    num2==length(0);
warndlg('Network Synthesis Not Feasible','Warning');
    k=0;
else
    den2==length(0);
    num2==length(0);
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs 1]); 
Resistores=strcat(erres,Res);
%set(handles.resistor_redbut_lp,'String',Resistores);
%Inductores
%Lpabr_lp_pi=indpa_pibr; 
syms L
im=0;
h=length(Lpabr_lp_pi);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_lp_pi));
%set(handles.ind_redbut_lp,'String',Inductores_lp);
%Capacitores
%Cpabr_lp_pi=capa_pibr; 
syms C
im=0;
h=length(Cpabr_lp_pi);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_lp_pi));
%set(handles.capacitor_redbut_lp,'String',Capacitores_lp);
if npa==2
axes(handles.rdpa_lp)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp,'String',Resistores);
set(handles.ind_redpa_lp,'String',Inductores_lp);
set(handles.capacitor_redpa_lp,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered network','Warning');
end
end
end


% --- Executes on button press in finpa6.
function finpa6_Callback(hObject, eventdata, handles)
% hObject    handle to finpa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in transfpa.
function transfpa_Callback(hObject, eventdata, handles)
% hObject    handle to transfpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi j k tawosnum_max taparealnum_max tawosden_max taparealden_max tawosnum_min taparealnum_min tawosden_min taparealden_min num1 den1 num2 den2
if j==0 && k==0
 warndlg('Calculate the Electrical Network','Warning');
elseif num1==length(0) || den1==length(0)
    warndlg('Network Synthesis Not Feasible','Warning');
%elseif tawosnum_min~=taparealnum_min || tawosden_min~=taparealden_min
elseif num2==length(0) || den2==length(0)
warndlg('Network Synthesis Not Feasible','Warning');
else
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)
end


% --- Executes on button press in otraprox2.
function otraprox2_Callback(hObject, eventdata, handles)
% hObject    handle to otraprox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
