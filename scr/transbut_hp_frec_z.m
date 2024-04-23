function varargout = transbut_hp_frec_z(varargin)
% TRANSBUT_HP_FREC_Z MATLAB code for transbut_hp_frec_z.fig
%      TRANSBUT_HP_FREC_Z, by itself, creates a new TRANSBUT_HP_FREC_Z or raises the existing
%      singleton*.
%
%      H = TRANSBUT_HP_FREC_Z returns the handle to a new TRANSBUT_HP_FREC_Z or the handle to
%      the existing singleton*.
%
%      TRANSBUT_HP_FREC_Z('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_HP_FREC_Z.M with the given input arguments.
%
%      TRANSBUT_HP_FREC_Z('Property','Value',...) creates a new TRANSBUT_HP_FREC_Z or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_hp_frec_z_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_hp_frec_z_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_hp_frec_z

% Last Modified by GUIDE v2.5 27-Oct-2022 08:12:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_hp_frec_z_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_hp_frec_z_OutputFcn, ...
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


% --- Executes just before transbut_hp_frec_z is made visible.
function transbut_hp_frec_z_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_hp_frec_z (see VARARGIN)

global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_hp_f sysch1_hp_f sysch2_hp_f syse_hp_f Wc_hp Lbu_hp_t_f Cbu_hp_t_f Lch1_hp_t_f Cch1_hp_t_f Lch2_hp_t_f Cch2_hp_t_f Le_hp_t_f Ce_hp_t_f Lbu_hp_pi_f Cbu_hp_pi_f Lch1_hp_pi_f Cch1_hp_pi_f Lch2_hp_pi_f Cch2_hp_pi_f Le_hp_pi_f Ce_hp_pi_f
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

% Choose default command line output for transbut_hp_frec_z
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_hp_frec_z wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_hp_frec_z_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%set(handles.buthp_frec_z,'String'," ")
global d
set(handles.tfbut_hp_frec_z,'String'," ")
d=0;

% --- Executes on button press in ftbut_hp_frec_z.
function ftbut_hp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to ftbut_hp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global buthp_frec_z sysbut_hp_f sysch1_hp_f f_but f_cheby1 syse_hp_f sysch2_hp_f f_elip f_cheby2 d
d=get(handles.ftbut_hp_frec_z,'Value');
buthp_frec_z=handles.buthp_frec_z;
if buthp_frec_z<=0 || ~isnumeric(buthp_frec_z) || ~isreal(buthp_frec_z) || isnan(buthp_frec_z)
warndlg('Enter Numerical Real Denormalization Impedance','Warning');
d=0;
else
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
sysbut_hp_f_z=evalc('sysbut_hp_f');
set(handles.tfbut_hp_frec_z,'string',sysbut_hp_f_z);
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
sysch1_hp_f_z=evalc('sysch1_hp_f');
set(handles.tfbut_hp_frec_z,'string',sysch1_hp_f_z);
elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
sysch2_hp_f_z=evalc('sysch2_hp_f');
set(handles.tfbut_hp_frec_z,'string',sysch2_hp_f_z);
else
syse_hp_f_z=evalc('syse_hp_f');
set(handles.tfbut_hp_frec_z,'string',syse_hp_f_z);
end
end


function buthp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to buthp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of buthp_frec_z as text
%        str2double(get(hObject,'String')) returns contents of buthp_frec_z as a double
buthp_frec_z=get(hObject,'String'); 
buthp_frec_z=str2double(buthp_frec_z);
handles.buthp_frec_z=buthp_frec_z;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function buthp_frec_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to buthp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fin18.
function fin18_Callback(hObject, eventdata, handles)
% hObject    handle to fin18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfbuthp_frec_z.
function rfbuthp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to rfbuthp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_hp_f sysch1_hp_f sysch2_hp_f syse_hp_f Wc_hp Lbu_hp_t_f Cbu_hp_t_f Lch1_hp_t_f Cch1_hp_t_f Lch2_hp_t_f Cch2_hp_t_f Le_hp_t_f Ce_hp_t_f Lbu_hp_pi_f Cbu_hp_pi_f Lch1_hp_pi_f Cch1_hp_pi_f Lch2_hp_pi_f Cch2_hp_pi_f Le_hp_pi_f Ce_hp_pi_f buthp_frec_z d
buthp_frec_z=handles.buthp_frec_z;
if buthp_frec_z<=0 || ~isnumeric(buthp_frec_z) || ~isreal(buthp_frec_z) || isnan(buthp_frec_z)
warndlg('Enter Numerical Real Denormalization Impedance','Warning');
else
if d==0
warndlg('Calculate Transfer Function','Warning');
else
set(gcf,'visible','off');
transbut_hp_frec_z_rf(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t,sysbut_hp_f,sysch1_hp_f,sysch2_hp_f,syse_hp_f,Wc_hp,Lbu_hp_t_f,Cbu_hp_t_f,Lch1_hp_t_f,Cch1_hp_t_f,Lch2_hp_t_f,Cch2_hp_t_f,Le_hp_t_f,Ce_hp_t_f,Lbu_hp_pi_f,Cbu_hp_pi_f,Lch1_hp_pi_f,Cch1_hp_pi_f,Lch2_hp_pi_f,Cch2_hp_pi_f,Le_hp_pi_f,Ce_hp_pi_f,buthp_frec_z)
end
end
