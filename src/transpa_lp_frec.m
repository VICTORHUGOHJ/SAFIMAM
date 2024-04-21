function varargout = transpa_lp_frec(varargin)
% TRANSPA_LP_FREC MATLAB code for transpa_lp_frec.fig
%      TRANSPA_LP_FREC, by itself, creates a new TRANSPA_LP_FREC or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_FREC returns the handle to a new TRANSPA_LP_FREC or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_FREC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_FREC.M with the given input arguments.
%
%      TRANSPA_LP_FREC('Property','Value',...) creates a new TRANSPA_LP_FREC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_frec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_frec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_frec

% Last Modified by GUIDE v2.5 27-Oct-2022 17:21:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_frec_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_frec_OutputFcn, ...
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


% --- Executes just before transpa_lp_frec is made visible.
function transpa_lp_frec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_frec (see VARARGIN)

% Choose default command line output for transpa_lp_frec
handles.output = hObject;
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

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_frec wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_frec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1
set(handles.tfpa_lp_frec,'String'," ")
p1=0;

% --- Executes on button press in ftpa_lp_frec.
function ftpa_lp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to ftpa_lp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr palp_frec nump_max denp_max nump_min denp_min Wn_lp syspmax_lp_f syspmin_lp_f p1
p1=get(handles.ftpa_lp_frec,'Value');
palp_frec=handles.palp_frec;
f_paobp=get(handles.fpa_opt_bp_real_tranf,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranf,'Value');
if palp_frec<=0 || ~isnumeric(palp_frec) || ~isreal(palp_frec) || isnan(palp_frec)
warndlg('Enter Numerical real denormalization frequency','Warning');
p1=0;
else
Wn_lp = 2*pi*palp_frec;
if f_paobp==1
 syms s
 s=s*(1/Wn_lp);
 x=s; 
 nump_lp_f=nump_max;
 denp_lp_f=eval(denp_max);
 denp_lp_f=sym2poly(denp_lp_f);
 syspmax_lp_f=tf(nump_lp_f,denp_lp_f);
syspmax_lp_frec=evalc('syspmax_lp_f');
set(handles.tfpa_lp_frec,'string',syspmax_lp_frec);


nump_lpmin_f=nump_min;
denp_lpmin_f=eval(denp_min);
denp_lpmin_f=sym2poly(denp_lpmin_f);
syspmin_lp_f=tf(nump_lpmin_f,denp_lpmin_f);

else
syms s
s=s*(1/Wn_lp);
x=s;
nump_lpmin_f=nump_min;
denp_lpmin_f=eval(denp_min);
denp_lpmin_f=sym2poly(denp_lpmin_f);
syspmin_lp_f=tf(nump_lpmin_f,denp_lpmin_f);
syspmin_lp_frec=evalc('syspmin_lp_f');
set(handles.tfpa_lp_frec,'string',syspmin_lp_frec);

nump_lp_f=nump_max;
denp_lp_f=eval(denp_max);
denp_lp_f=sym2poly(denp_lp_f);
syspmax_lp_f=tf(nump_lp_f,denp_lp_f);


end
end



function palp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to palp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of palp_frec as text
%        str2double(get(hObject,'String')) returns contents of palp_frec as a double
palp_frec=get(hObject,'String'); 
palp_frec=str2double(palp_frec);
handles.palp_frec=palp_frec;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function palp_frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to palp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finpa8.
function finpa8_Callback(hObject, eventdata, handles)
% hObject    handle to finpa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfpalp_frec.
function rfpalp_frec_Callback(hObject, eventdata, handles)
% hObject    handle to rfpalp_frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wn_lp syspmax_lp_f syspmin_lp_f palp_frec p1
palp_frec=handles.palp_frec;
if palp_frec<=0 || ~isnumeric(palp_frec) || ~isreal(palp_frec) || isnan(palp_frec)
warndlg('Enter Numerical real denormalization frequency','Warning');
else
if p1==0
warndlg('Calculate Transfer Function','Warning');
else
set(gcf,'visible','off');
transpa_lp_frec_rf(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wn_lp,syspmax_lp_f,syspmin_lp_f)
end
end
