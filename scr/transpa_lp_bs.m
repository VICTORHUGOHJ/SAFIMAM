function varargout = transpa_lp_bs(varargin)
% TRANSPA_LP_BS MATLAB code for transpa_lp_bs.fig
%      TRANSPA_LP_BS, by itself, creates a new TRANSPA_LP_BS or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_BS returns the handle to a new TRANSPA_LP_BS or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_BS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_BS.M with the given input arguments.
%
%      TRANSPA_LP_BS('Property','Value',...) creates a new TRANSPA_LP_BS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_bs_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_bs_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_bs

% Last Modified by GUIDE v2.5 06-Oct-2022 16:57:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_bs_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_bs_OutputFcn, ...
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


% --- Executes just before transpa_lp_bs is made visible.
function transpa_lp_bs_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_bs (see VARARGIN)
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
% Choose default command line output for transpa_lp_bs
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_bs wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_bs_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%set(handles.pabs_frec,'String'," ")
%set(handles.pabs_bw,'String'," ")
global p1
set(handles.tfpa_bs_frec,'String'," ")
p1=0;

% --- Executes on button press in ftpa_bs_frec.
function ftpa_bs_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftpa_bs_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr nump_max denp_max nump_min denp_min Wc_bs Bw_bs syspmax_bs_f syspmin_bs_f pabs_frec pabs_bw p1
p1=get(handles.ftpa_bs_frec,'Value');
pabs_frec=handles.pabs_frec;
pabs_bw=handles.pabs_bw;
f_paobp=get(handles.fpa_opt_bp_real_tranbs,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranbs,'Value');
if pabs_frec<=0 || ~isnumeric(pabs_frec) || ~isreal(pabs_frec) || pabs_bw<=0 || ~isnumeric(pabs_bw) || ~isreal(pabs_bw) || isnan(pabs_frec) || isnan(pabs_bw)
warndlg('Enter numerical actual cutoff frequencies','Warning');
p1=0;
else
%Wc_bs=2*pi*sqrt(pabs_frec*pabs_bw);
%Bw_bs=2*pi*(pabs_bw-pabs_frec);
Wc_bs = sqrt((2*pi*pabs_frec)*(2*pi*pabs_bw)); %2*pi*********************
Bw_bs = (2*pi*pabs_bw)-(2*pi*pabs_frec); %2*pi***********************

if f_paobp==1
[num_bs, den_bs] = lp2bs(nump_max,sym2poly(denp_max),Wc_bs,Bw_bs);
syspmax_bs_f=tf(num_bs,den_bs);
syspmax_bs_frec=evalc('syspmax_bs_f');
set(handles.tfpa_bs_frec,'string',syspmax_bs_frec);

[num_bs_br, den_bs_br] = lp2bs(nump_min,sym2poly(denp_min),Wc_bs,Bw_bs);
syspmin_bs_f=tf(num_bs_br,den_bs_br);


else
[num_bs_br, den_bs_br] = lp2bs(nump_min,sym2poly(denp_min),Wc_bs,Bw_bs);
syspmin_bs_f=tf(num_bs_br,den_bs_br);
syspmin_bs_frec=evalc('syspmin_bs_f');
set(handles.tfpa_bs_frec,'string',syspmin_bs_frec);

[num_bs, den_bs] = lp2bs(nump_max,sym2poly(denp_max),Wc_bs,Bw_bs);
syspmax_bs_f=tf(num_bs,den_bs);

end
end


function pabs_frec_Callback(hObject, eventdata, handles)
% hObject    handle to pabs_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pabs_frec as text
%        str2double(get(hObject,'String')) returns contents of pabs_frec as a double
pabs_frec=get(hObject,'String'); 
pabs_frec=str2double(pabs_frec);
handles.pabs_frec=pabs_frec;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pabs_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pabs_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finpa22.
function finpa22_Callback(hObject, eventdata, handles)
% hObject    handle to finpa22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfpabs_frec.
function rfpabs_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfpabs_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_bs Bw_bs syspmax_bs_f syspmin_bs_f pabs_frec pabs_bw p1
pabs_frec=handles.pabs_frec;
pabs_bw=handles.pabs_bw;
if pabs_frec<=0 || ~isnumeric(pabs_frec) || ~isreal(pabs_frec) || pabs_bw<=0 || ~isnumeric(pabs_bw) || ~isreal(pabs_bw) || isnan(pabs_frec) || isnan(pabs_bw)
warndlg('Enter numerical actual cutoff frequencies','Warning');
else
if p1==0
    warndlg('Calculate Transfer Function','Warning');
else
    set(gcf,'visible','off');
transpa_bs_frec_rf(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wc_bs,Bw_bs,syspmax_bs_f,syspmin_bs_f)
end
end


function pabs_bw_Callback(hObject, eventdata, handles)
% hObject    handle to pabs_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pabs_bw as text
%        str2double(get(hObject,'String')) returns contents of pabs_bw as a double
pabs_bw=get(hObject,'String'); 
pabs_bw=str2double(pabs_bw);
handles.pabs_bw=pabs_bw;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pabs_bw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pabs_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
