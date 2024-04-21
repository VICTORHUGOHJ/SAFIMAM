function varargout = transbut_lp_bp(varargin)
% TRANSBUT_LP_BP MATLAB code for transbut_lp_bp.fig
%      TRANSBUT_LP_BP, by itself, creates a new TRANSBUT_LP_BP or raises the existing
%      singleton*.
%
%      H = TRANSBUT_LP_BP returns the handle to a new TRANSBUT_LP_BP or the handle to
%      the existing singleton*.
%
%      TRANSBUT_LP_BP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_LP_BP.M with the given input arguments.
%
%      TRANSBUT_LP_BP('Property','Value',...) creates a new TRANSBUT_LP_BP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_lp_bp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_lp_bp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_lp_bp

% Last Modified by GUIDE v2.5 02-Oct-2022 08:29:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_lp_bp_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_lp_bp_OutputFcn, ...
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


% --- Executes just before transbut_lp_bp is made visible.
function transbut_lp_bp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_lp_bp (see VARARGIN)
global kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t
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

% Choose default command line output for transbut_lp_bp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_lp_bp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_lp_bp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%set(handles.butbp_frec,'String'," ")
%set(handles.butbp_bw,'String'," ")
global d
set(handles.tfbut_bp_frec,'String'," ")
d=0;
% --- Executes on button press in ftbut_bp_frec.
function ftbut_bp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftbut_bp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global butbp_frec f_but butbp_bw f_cheby1 f_cheby2 f_elip numb denb numch1 dench1 numch2 dench2 nume dene Wc_bp Bw_bp sysbut_bp_f sysch1_bp_f sysch2_bp_f syse_bp_f d
d=get(handles.ftbut_bp_frec,'Value');
butbp_frec=handles.butbp_frec; %frecuencia de corte 1
butbp_bw=handles.butbp_bw; %frecuencia de corte 2
if butbp_frec<=0 || ~isnumeric(butbp_frec) || ~isreal(butbp_frec) || butbp_bw<=0 || ~isnumeric(butbp_bw) || ~isreal(butbp_bw) || isnan(butbp_bw) || isnan(butbp_bw)
warndlg('Enter numerical actual cutoff frequencies','Warning');
d=0;
else

Wc_bp = sqrt((2*pi*butbp_frec)*(2*pi*butbp_bw)); %2*pi*********************
Bw_bp = (2*pi*butbp_bw)-(2*pi*butbp_frec); %2*pi***********************
%Wc_bp=2*pi*(((butbp_bw-butbp_frec)/2)+butbp_frec)

if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
[num_bp, den_bp] = lp2bp(numb,denb,Wc_bp,Bw_bp);
sysbut_bp_f=tf(num_bp,den_bp);
sysbut_bp_frec=evalc('sysbut_bp_f');
set(handles.tfbut_bp_frec,'string',sysbut_bp_frec);
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
[num_bp, den_bp] = lp2bp(numch1,dench1,Wc_bp,Bw_bp);
sysch1_bp_f=tf(num_bp,den_bp);
sysch1_bp_frec=evalc('sysch1_bp_f');
set(handles.tfbut_bp_frec,'string',sysch1_bp_frec);
elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
[num_bp, den_bp] = lp2bp(numch2,dench2,Wc_bp,Bw_bp);
sysch2_bp_f=tf(num_bp,den_bp);
sysch2_bp_frec=evalc('sysch2_bp_f');
set(handles.tfbut_bp_frec,'string',sysch2_bp_frec);
else
[num_bp, den_bp] = lp2bp(nume,dene,Wc_bp,Bw_bp);
syse_bp_f=tf(num_bp,den_bp);
syse_bp_frec=evalc('syse_bp_f');
set(handles.tfbut_bp_frec,'string',syse_bp_frec);
end
end

function butbp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to butbp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of butbp_frec as text
%        str2double(get(hObject,'String')) returns contents of butbp_frec as a double
butbp_frec=get(hObject,'String'); 
butbp_frec=str2double(butbp_frec);
handles.butbp_frec=butbp_frec;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function butbp_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butbp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fin21.
function fin21_Callback(hObject, eventdata, handles)
% hObject    handle to fin21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfbutbp_frec.
function rfbutbp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfbutbp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global butbp_frec butbp_bw  kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t Wc_bp Bw_bp sysbut_bp_f sysch1_bp_f sysch2_bp_f syse_bp_f d
butbp_frec=handles.butbp_frec;
butbp_bw=handles.butbp_bw;
if butbp_frec<=0 || ~isnumeric(butbp_frec) || ~isreal(butbp_frec) || butbp_bw<=0 || ~isnumeric(butbp_bw) || ~isreal(butbp_bw) || isnan(butbp_frec) || isnan(butbp_bw)
warndlg('Enter numerical actual cutoff frequencies','Warning');
else
if d==0
warndlg('Calculate Transfer Function','Warning');
else
set(gcf,'visible','off');
transbut_bp_frec_rf(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t,Wc_bp,Bw_bp,sysbut_bp_f,sysch1_bp_f,sysch2_bp_f,syse_bp_f)
%Wc_bp Bw_bp sysbut_bp_f sysch1_bp_f sysch2_bp_f syse_bp_f
end
end

function butbp_bw_Callback(hObject, eventdata, handles)
% hObject    handle to butbp_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of butbp_bw as text
%        str2double(get(hObject,'String')) returns contents of butbp_bw as a double
butbp_bw=get(hObject,'String'); 
butbp_bw=str2double(butbp_bw);
handles.butbp_bw=butbp_bw;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function butbp_bw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butbp_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
