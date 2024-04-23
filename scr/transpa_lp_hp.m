function varargout = transpa_lp_hp(varargin)
% TRANSPA_LP_HP MATLAB code for transpa_lp_hp.fig
%      TRANSPA_LP_HP, by itself, creates a new TRANSPA_LP_HP or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_HP returns the handle to a new TRANSPA_LP_HP or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_HP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_HP.M with the given input arguments.
%
%      TRANSPA_LP_HP('Property','Value',...) creates a new TRANSPA_LP_HP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_hp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_hp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_hp

% Last Modified by GUIDE v2.5 27-Oct-2022 20:31:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_hp_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_hp_OutputFcn, ...
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


% --- Executes just before transpa_lp_hp is made visible.
function transpa_lp_hp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_hp (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi
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

% Choose default command line output for transpa_lp_hp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_hp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_hp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1
set(handles.tfpa_hp_frec,'String'," ")
p1=0;

% --- Executes on button press in ftpa_hp_frec.
function ftpa_hp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftpa_hp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr nump_max denp_max nump_min denp_min Wc_hp syspmax_hp_f syspmin_hp_f pahp_frec p1
p1=get(handles.ftpa_hp_frec,'Value');
pahp_frec=handles.pahp_frec;
f_paobp=get(handles.fpa_opt_bp_real_tranhp,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranhp,'Value');
if pahp_frec<=0 || ~isnumeric(pahp_frec) || ~isreal(pahp_frec) || isnan(pahp_frec)
warndlg('Enter Numerical real denormalization frequency','Warning');
p1=0;
else
Wc_hp = 2*pi*pahp_frec;

if f_paobp==1

kp=nump_max;
zp=[];
px=solve(denp_max);
x=length(px);
z=zeros(x,1);
for i=1:x
z(i)=px(i);
end
pp=z;
[ GHP, ZHP, PHP ]=PZ_2_HP_S(kp, zp, pp, Wc_hp);
numb_hp=poly(ZHP)*GHP; denb_hp=poly(PHP);
syspmax_hp_f=tf(numb_hp,denb_hp);
syspabp_hp_frec=evalc('syspmax_hp_f');
set(handles.tfpa_hp_frec,'string',syspabp_hp_frec);

kpm=nump_min;
zpm=[];
pxm=solve(denp_min);
xm=length(pxm);
zm=zeros(xm,1);
for i=1:xm
zm(i)=pxm(i);
end
ppm=zm;
[ GHPm, ZHPm, PHPm ]=PZ_2_HP_S(kpm, zpm, ppm, Wc_hp);
numb_hpm=poly(ZHPm)*GHPm; denb_hpm=poly(PHPm);
syspmin_hp_f=tf(numb_hpm,denb_hpm);


else

kpm=nump_min;
zpm=[];
pxm=solve(denp_min);
xm=length(pxm);
zm=zeros(xm,1);
for i=1:xm
zm(i)=pxm(i);
end
ppm=zm;
[ GHPm, ZHPm, PHPm ]=PZ_2_HP_S(kpm, zpm, ppm, Wc_hp);
numb_hpm=poly(ZHPm)*GHPm; denb_hpm=poly(PHPm);
syspmin_hp_f=tf(numb_hpm,denb_hpm);
syspabr_hp_frec=evalc('syspmin_hp_f');
set(handles.tfpa_hp_frec,'string',syspabr_hp_frec);

kp=nump_max;
zp=[];
px=solve(denp_max);
x=length(px);
z=zeros(x,1);
for i=1:x
z(i)=px(i);
end
pp=z;
[ GHP, ZHP, PHP ]=PZ_2_HP_S(kp, zp, pp, Wc_hp);
numb_hp=poly(ZHP)*GHP; denb_hp=poly(PHP);
syspmax_hp_f=tf(numb_hp,denb_hp);


end
end


function pahp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to pahp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pahp_frec as text
%        str2double(get(hObject,'String')) returns contents of pahp_frec as a double
pahp_frec=get(hObject,'String'); 
pahp_frec=str2double(pahp_frec);
handles.pahp_frec=pahp_frec;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function pahp_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pahp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finpa28.
function finpa28_Callback(hObject, eventdata, handles)
% hObject    handle to finpa28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfpahp_frec.
function rfpahp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfpahp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_hp syspmax_hp_f syspmin_hp_f pahp_frec p1
pahp_frec=handles.pahp_frec;
if pahp_frec<=0 || ~isnumeric(pahp_frec) || ~isreal(pahp_frec) || isnan(pahp_frec)
warndlg('Enter Numerical real denormalization frequency','Warning');
else
if p1==0
    warndlg('Calculate Transfer Function','Warning');
else
    set(gcf,'visible','off');
transpa_hp_frec_rf(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wc_hp,syspmax_hp_f,syspmin_hp_f)
end
end
