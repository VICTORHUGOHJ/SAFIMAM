function varargout = transpa_lp_z_red(varargin)
% TRANSPA_LP_Z_RED MATLAB code for transpa_lp_z_red.fig
%      TRANSPA_LP_Z_RED, by itself, creates a new TRANSPA_LP_Z_RED or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_Z_RED returns the handle to a new TRANSPA_LP_Z_RED or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_Z_RED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_Z_RED.M with the given input arguments.
%
%      TRANSPA_LP_Z_RED('Property','Value',...) creates a new TRANSPA_LP_Z_RED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_z_red_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_z_red_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_z_red

% Last Modified by GUIDE v2.5 27-Oct-2022 19:27:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_z_red_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_z_red_OutputFcn, ...
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


% --- Executes just before transpa_lp_z_red is made visible.
function transpa_lp_z_red_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_z_red (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi palp_z
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
palp_z=varargin{21};
% Choose default command line output for transpa_lp_z_red
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_z_red wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_z_red_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global j k
j=0;
k=0;
set(handles.rd_patran_z,'String'," ")
cla(handles.rdpa_lp_transfz,'reset')
set(handles.resistor_redpa_lp_trans_z,'String'," ")
set(handles.ind_redpa_lp_transf_z,'String'," ")
set(handles.capacitor_redpa_lp_transf_z,'String'," ")

% --- Executes on button press in redtpalp_transf_z.
function redtpalp_transf_z_Callback(hObject, eventdata, handles)
% hObject    handle to redtpalp_transf_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
global f_paobr f_paobp valor_rs npa palp_z Lpabp_lp_t Cpabp_lp_t Lpabr_lp_t Cpabr_lp_t j
j=get(handles.redtpalp_transf_z,'Value');
set(handles.rd_patran_z,'String','T-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranz_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranz_red,'Value');
if f_paobp==1
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*palp_z 1*palp_z]); 
Resistores=strcat(erres,Res);

%Inductores
Lpabp_lp_t_z=palp_z*Lpabp_lp_t;
syms L
im=0;
h=length(Lpabp_lp_t_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_lp_t_z));

%Capacitores 
Cpabp_lp_t_z=(1/palp_z)*Cpabp_lp_t;
syms C
im=0;
h=length(Cpabp_lp_t_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_lp_t_z));

if npa==2
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*palp_z 1*palp_z]); 
Resistores=strcat(erres,Res);
%Inductores
Lpabr_lp_t_z=palp_z*Lpabr_lp_t;
syms L
im=0;
h=length(Lpabr_lp_t_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_lp_t_z));

%Capacitores
Cpabr_lp_t_z=(1/palp_z)*Cpabr_lp_t;
syms C
im=0;
h=length(Cpabr_lp_t_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_lp_t_z));

if npa==2
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp_transfz)
background=imread('lp_t_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end



% --- Executes on button press in redpipalp_transf_z.
function redpipalp_transf_z_Callback(hObject, eventdata, handles)
% hObject    handle to redpipalp_transf_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
global f_paobr f_paobp valor_rs npa palp_z Cpabp_lp_pi Lpabp_lp_pi Cpabr_lp_pi Lpabr_lp_pi k
k=get(handles.redpipalp_transf_z,'Value');
set(handles.rd_patran_z,'String','π-type network');
f_paobp=get(handles.fpa_opt_bp_real_tranz_red,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranz_red,'Value');
if f_paobp==1
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*palp_z 1*palp_z]); 
Resistores=strcat(erres,Res);

%Inductores
Lpabp_lp_pi_z=palp_z*Lpabp_lp_pi;
syms L
im=0;
h=length(Lpabp_lp_pi_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabp_lp_pi_z));

%Capacitores 
%(1/palp_frec_z)*Cpabp_lp_t_f
Cpabp_lp_pi_z=(1/palp_z)*Cpabp_lp_pi;
syms C
im=0;
h=length(Cpabp_lp_pi_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabp_lp_pi_z));

if npa==2
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==7
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

else
%Resistores
erres=string({'Rs= ','RL= '});
Res=string([valor_rs*palp_z 1*palp_z]); 
Resistores=strcat(erres,Res);

%Inductores
Lpabr_lp_pi_z=palp_z*Lpabr_lp_pi;
syms L
im=0;
h=length(Lpabr_lp_pi_z);
aux=ones(1,h);
for y=2:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*L);
v = strcat(ele,ese);
Inductores_lp = strcat(v,'=',string(Lpabr_lp_pi_z));

%Capacitores 
Cpabr_lp_pi_z=(1/palp_z)*Cpabr_lp_pi;
syms C
im=0;
h=length(Cpabr_lp_pi_z);
aux=ones(1,h);
for y=1:2:h*2
    im=im(im~=0);
    im=[im,y];
end
ese=string([im]);
ele=string(aux*C);
v = strcat(ele,ese);
Capacitores_lp = strcat(v,'=',string(Cpabr_lp_pi_z));

if npa==2
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_2.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==3
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_3.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==4
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_4.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==5
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_5.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==6
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_6.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
 elseif npa==7
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_7.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==8
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_8.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==9
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_9.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==10
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_10.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==11
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_11.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==12
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_12.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==13
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_13.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==14
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_14.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==15
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_15.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==16
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_16.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==17
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_17.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==18
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_18.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==19
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_19.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==20
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_20.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
elseif npa==21
axes(handles.rdpa_lp_transfz)
background=imread('lp_pi_21.jpg'); 
axis off;
imshow(background);
%%%Elementos
set(handles.resistor_redpa_lp_trans_z,'String',Resistores);
set(handles.ind_redpa_lp_transf_z,'String',Inductores_lp);
set(handles.capacitor_redpa_lp_transf_z,'String',Capacitores_lp);
%%%
else
    msgbox('Unregistered Network','Warning');
end

end

% --- Executes on button press in finpa15.
function finpa15_Callback(hObject, eventdata, handles)
% hObject    handle to finpa15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in regpa7.
function regpa7_Callback(hObject, eventdata, handles)
% hObject    handle to regpa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi j k
if j==0 && k==0
 warndlg('Calculate Electrical Network','Warning');
else
set(gcf,'visible','off');
tranpascal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi)
end
