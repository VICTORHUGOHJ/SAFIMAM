function varargout = transbut_lp_frec(varargin)
% TRANSBUT_LP_FREC MATLAB code for transbut_lp_frec.fig
%      TRANSBUT_LP_FREC, by itself, creates a new TRANSBUT_LP_FREC or raises the existing
%      singleton*.
%
%      H = TRANSBUT_LP_FREC returns the handle to a new TRANSBUT_LP_FREC or the handle to
%      the existing singleton*.
%
%      TRANSBUT_LP_FREC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSBUT_LP_FREC.M with the given input arguments.
%
%      TRANSBUT_LP_FREC('Property','Value',...) creates a new TRANSBUT_LP_FREC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transbut_lp_frec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transbut_lp_frec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transbut_lp_frec

% Last Modified by GUIDE v2.5 10-Oct-2022 09:14:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transbut_lp_frec_OpeningFcn, ...
                   'gui_OutputFcn',  @transbut_lp_frec_OutputFcn, ...
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


% --- Executes just before transbut_lp_frec is made visible.
function transbut_lp_frec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transbut_lp_frec (see VARARGIN)

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

% Choose default command line output for transbut_lp_frec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transbut_lp_frec wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transbut_lp_frec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%set(handles.butlp_frec,'String'," ")
global d
d=0;
set(handles.tfbut_lp_frec,'String'," ")

% --- Executes on button press in ftbut_lp_frec.
function ftbut_lp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftbut_lp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global butlp_frec denb numb sysbut_lp_f Wn_lp numch1 dench1 sysch1_lp_f f_but f_cheby1 f_cheby2 f_elip numch2 dench2 nume dene sysch2_lp_f syse_lp_f d
d=get(handles.ftbut_lp_frec,'Value');
butlp_frec=handles.butlp_frec;
if butlp_frec<=0 || ~isnumeric(butlp_frec) || ~isreal(butlp_frec) || isnan(butlp_frec)
warndlg('Enter Numerical real denormalization frequency','Warning');
%d=set(handles.ftbut_lp_frec,'Value',0)
d=0;
else
Wn_lp = 2*pi*butlp_frec;
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
syms s
s=s*(1/Wn_lp);
denb_lp_f=poly2sym(denb);
x=s;
numb_lp_f=numb;
denb_lp_f=eval(denb_lp_f);
denb_lp_f=sym2poly(denb_lp_f);
sysbut_lp_f=tf(numb_lp_f,denb_lp_f);
sysbut_lp_frec=evalc('sysbut_lp_f');
set(handles.tfbut_lp_frec,'string',sysbut_lp_frec);
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
syms s
s=s*(1/Wn_lp);
dench1_lp_f=poly2sym(dench1);
x=s;
numch1_lp_f=numch1;
dench1_lp_f=eval(dench1_lp_f);
dench1_lp_f=sym2poly(dench1_lp_f);
sysch1_lp_f=tf(numch1_lp_f,dench1_lp_f);
sysch1_lp_frec=evalc('sysch1_lp_f');
set(handles.tfbut_lp_frec,'string',sysch1_lp_frec);

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
syms s
s=s*(1/Wn_lp);

numch2_lp_f=poly2sym(numch2);
dench2_lp_f=poly2sym(dench2);
x=s;
numch2_lp_f=eval(numch2_lp_f);
dench2_lp_f=eval(dench2_lp_f);
numch2_lp_f=sym2poly(numch2_lp_f);
dench2_lp_f=sym2poly(dench2_lp_f);

sysch2_lp_f=tf(numch2_lp_f,dench2_lp_f);
sysch2_lp_frec=evalc('sysch2_lp_f');
set(handles.tfbut_lp_frec,'string',sysch2_lp_frec);
else

syms s
s=s*(1/Wn_lp);

nume_lp_f=poly2sym(nume);
dene_lp_f=poly2sym(dene);
x=s;
nume_lp_f=eval(nume_lp_f);
dene_lp_f=eval(dene_lp_f);

nume_lp_f=sym2poly(nume_lp_f);
dene_lp_f=sym2poly(dene_lp_f);

syse_lp_f=tf(nume_lp_f,dene_lp_f);
syse_lp_frec=evalc('syse_lp_f');
set(handles.tfbut_lp_frec,'string',syse_lp_frec);
end
end

function butlp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to butlp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of butlp_frec as text
%        str2double(get(hObject,'String')) returns contents of butlp_frec as a double
butlp_frec=get(hObject,'String'); 
butlp_frec=str2double(butlp_frec);
handles.butlp_frec=butlp_frec;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function butlp_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to butlp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fin10.
function fin10_Callback(hObject, eventdata, handles)
% hObject    handle to fin10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfbutlp_frec.
function rfbutlp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfbutlp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%sysch2_lp_f syse_lp_f Wn_lp
global butlp_frec kb zb pb numb denb rs RL Lbu_lp_t Cbu_lp_t sysbut_lp Lbu_lp_pi Cbu_lp_pi nb nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp Lch1_lp_pi Cch1_lp_pi Lch1_lp_t Cch1_lp_t f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp Lch2_lp_pi Cch2_lp_pi Le_lp_pi Ce_lp_pi Lch2_lp_t Cch2_lp_t Le_lp_t Ce_lp_t sysbut_lp_f sysch1_lp_f sysch2_lp_f syse_lp_f Wn_lp d
butlp_frec=handles.butlp_frec;
if butlp_frec<=0 || ~isnumeric(butlp_frec) || ~isreal(butlp_frec) || isnan(butlp_frec)
    warndlg('Enter Numerical real denormalization frequency','Warning');
else
if d==0
warndlg('Calculate Transfer Function','Warning');
else
set(gcf,'visible','off');
transbut_lp_frec_rf(kb,zb,pb,numb,denb,rs,RL,Lbu_lp_t,Cbu_lp_t,sysbut_lp,Lbu_lp_pi,Cbu_lp_pi,nb,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,Lch1_lp_pi,Cch1_lp_pi,Lch1_lp_t,Cch1_lp_t,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp,Lch2_lp_pi,Cch2_lp_pi,Le_lp_pi,Ce_lp_pi,Lch2_lp_t,Cch2_lp_t,Le_lp_t,Ce_lp_t,sysbut_lp_f,sysch1_lp_f,sysch2_lp_f,syse_lp_f,Wn_lp)
end
end
%sysbut_lp_f sysch1_lp_f sysch2_lp_f syse_lp_f Wn_lp
