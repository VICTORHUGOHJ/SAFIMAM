function varargout = transpa_lp_bp(varargin)
% TRANSPA_LP_BP MATLAB code for transpa_lp_bp.fig
%      TRANSPA_LP_BP, by itself, creates a new TRANSPA_LP_BP or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_BP returns the handle to a new TRANSPA_LP_BP or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_BP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_BP.M with the given input arguments.
%
%      TRANSPA_LP_BP('Property','Value',...) creates a new TRANSPA_LP_BP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_bp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_bp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_bp

% Last Modified by GUIDE v2.5 06-Oct-2022 16:15:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_bp_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_bp_OutputFcn, ...
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


% --- Executes just before transpa_lp_bp is made visible.
function transpa_lp_bp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_bp (see VARARGIN)
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
% Choose default command line output for transpa_lp_bp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_bp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_bp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%set(handles.pabp_frec,'String'," ")
%set(handles.pabp_bw,'String'," ")
global p1
set(handles.tfpa_bp_frec,'String'," ")
p1=0;

% --- Executes on button press in ftpa_bp_frec.
function ftpa_bp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftpa_bp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr nump_max denp_max nump_min denp_min Wc_bp Bw_bp syspmax_bp_f syspmin_bp_f pabp_frec pabp_bw p1
p1=get(handles.ftpa_bp_frec,'Value');
pabp_frec=handles.pabp_frec;
pabp_bw=handles.pabp_bw;
f_paobp=get(handles.fpa_opt_bp_real_tranbp,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranbp,'Value');
if pabp_frec<=0 || ~isnumeric(pabp_frec) || ~isreal(pabp_frec) || pabp_bw<=0 || ~isnumeric(pabp_bw) || ~isreal(pabp_bw) || isnan(pabp_frec) || isnan(pabp_bw)
warndlg('Enter numerical actual cutoff frequencies','Warning');
p1=0;
else
%Wc_bp=2*pi*sqrt(pabp_frec*pabp_bw);
%Bw_bp=2*pi*(pabp_bw-pabp_frec);
Wc_bp = sqrt((2*pi*pabp_frec)*(2*pi*pabp_bw)); %2*pi*********************
Bw_bp = (2*pi*pabp_bw)-(2*pi*pabp_frec);%2*pi***********************

if f_paobp==1
[num_bp, den_bp] = lp2bp(nump_max,sym2poly(denp_max),Wc_bp,Bw_bp);
syspmax_bp_f=tf(num_bp,den_bp);
syspmax_bp_frec=evalc('syspmax_bp_f');
set(handles.tfpa_bp_frec,'string',syspmax_bp_frec);

[num_bp_br, den_bp_br] = lp2bp(nump_min,sym2poly(denp_min),Wc_bp,Bw_bp);
syspmin_bp_f=tf(num_bp_br,den_bp_br);


else
[num_bp_br, den_bp_br] = lp2bp(nump_min,sym2poly(denp_min),Wc_bp,Bw_bp);
syspmin_bp_f=tf(num_bp_br,den_bp_br);
syspmin_bp_frec=evalc('syspmin_bp_f');
set(handles.tfpa_bp_frec,'string',syspmin_bp_frec);

[num_bp, den_bp] = lp2bp(nump_max,sym2poly(denp_max),Wc_bp,Bw_bp);
syspmax_bp_f=tf(num_bp,den_bp);

end
end

function pabp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to pabp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pabp_frec as text
%        str2double(get(hObject,'String')) returns contents of pabp_frec as a double
pabp_frec=get(hObject,'String'); 
pabp_frec=str2double(pabp_frec);
handles.pabp_frec=pabp_frec;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pabp_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pabp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finpa16.
function finpa16_Callback(hObject, eventdata, handles)
% hObject    handle to finpa16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfpabp_frec.
function rfpabp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfpabp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wc_bp Bw_bp syspmax_bp_f syspmin_bp_f pabp_frec pabp_bw p1
pabp_frec=handles.pabp_frec;
pabp_bw=handles.pabp_bw;
if pabp_frec<=0 || ~isnumeric(pabp_frec) || ~isreal(pabp_frec) || pabp_bw<=0 || ~isnumeric(pabp_bw) || ~isreal(pabp_bw) || isnan(pabp_frec) || isnan(pabp_bw) 
warndlg('Enter numerical actual cutoff frequencies','Warning');
else
if p1==0
warndlg('Calculate Transfer Function','Warning');
else
    set(gcf,'visible','off');
transpa_bp_frec_rfr(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wc_bp,Bw_bp,syspmax_bp_f,syspmin_bp_f)
end
end

function pabp_bw_Callback(hObject, eventdata, handles)
% hObject    handle to pabp_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pabp_bw as text
%        str2double(get(hObject,'String')) returns contents of pabp_bw as a double
pabp_bw=get(hObject,'String'); 
pabp_bw=str2double(pabp_bw);
handles.pabp_bw=pabp_bw;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pabp_bw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pabp_bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
