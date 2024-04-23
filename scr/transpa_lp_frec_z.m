function varargout = transpa_lp_frec_z(varargin)
% TRANSPA_LP_FREC_Z MATLAB code for transpa_lp_frec_z.fig
%      TRANSPA_LP_FREC_Z, by itself, creates a new TRANSPA_LP_FREC_Z or raises the existing
%      singleton*.
%
%      H = TRANSPA_LP_FREC_Z returns the handle to a new TRANSPA_LP_FREC_Z or the handle to
%      the existing singleton*.
%
%      TRANSPA_LP_FREC_Z('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSPA_LP_FREC_Z.M with the given input arguments.
%
%      TRANSPA_LP_FREC_Z('Property','Value',...) creates a new TRANSPA_LP_FREC_Z or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transpa_lp_frec_z_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transpa_lp_frec_z_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transpa_lp_frec_z

% Last Modified by GUIDE v2.5 27-Oct-2022 17:41:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transpa_lp_frec_z_OpeningFcn, ...
                   'gui_OutputFcn',  @transpa_lp_frec_z_OutputFcn, ...
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


% --- Executes just before transpa_lp_frec_z is made visible.
function transpa_lp_frec_z_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transpa_lp_frec_z (see VARARGIN)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wn_lp syspmax_lp_f syspmin_lp_f Lpabp_lp_t_f Cpabp_lp_t_f Lpabr_lp_t_f Cpabr_lp_t_f Cpabp_lp_pi_f Lpabp_lp_pi_f Cpabr_lp_pi_f Lpabr_lp_pi_f
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
Wn_lp=varargin{21};
syspmax_lp_f=varargin{22};
syspmin_lp_f=varargin{23};
Lpabp_lp_t_f=varargin{24};
Cpabp_lp_t_f=varargin{25};
Lpabr_lp_t_f=varargin{26};
Cpabr_lp_t_f=varargin{27};
Cpabp_lp_pi_f=varargin{28};
Lpabp_lp_pi_f=varargin{29};
Cpabr_lp_pi_f=varargin{30};
Lpabr_lp_pi_f=varargin{31};
% Choose default command line output for transpa_lp_frec_z
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transpa_lp_frec_z wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transpa_lp_frec_z_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%set(handles.palp_frec_z,'String'," ")
global p1
set(handles.tfpa_lp_frec_z,'String'," ")
p1=0;

% --- Executes on button press in ftpa_lp_frec_z.
function ftpa_lp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to ftpa_lp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_paobp f_paobr syspmax_lp_f syspmin_lp_f palp_frec_z p1
p1=get(handles.ftpa_lp_frec_z,'Value');
palp_frec_z=handles.palp_frec_z;
%Wn_lp = 2*pi*palp_frec_z;
f_paobp=get(handles.fpa_opt_bp_real_tranz,'Value');
f_paobr=get(handles.fpa_opt_br_real_tranz,'Value');
if palp_frec_z<=0 || ~isnumeric(palp_frec_z) || ~isreal(palp_frec_z) || isnan(palp_frec_z)
warndlg('Enter Numerical Real Denormalization Impedance','Warning');
p1=0;
else
if f_paobp==1
syspmax_lp_frec_z=evalc('syspmax_lp_f');
set(handles.tfpa_lp_frec_z,'string',syspmax_lp_frec_z);
else
syspmin_lp_frec_z=evalc('syspmin_lp_f');
set(handles.tfpa_lp_frec_z,'string',syspmin_lp_frec_z);
end
end

function palp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to palp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of palp_frec_z as text
%        str2double(get(hObject,'String')) returns contents of palp_frec_z as a double
palp_frec_z=get(hObject,'String'); 
palp_frec_z=str2double(palp_frec_z);
handles.palp_frec_z=palp_frec_z;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function palp_frec_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to palp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finpa11.
function finpa11_Callback(hObject, eventdata, handles)
% hObject    handle to finpa11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfpalp_frec_z.
function rfpalp_frec_z_Callback(hObject, eventdata, handles)
% hObject    handle to rfpalp_frec_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs Lpabp_lp_t Cpabp_lp_t Cpabp_lp_pi Lpabp_lp_pi Lpabr_lp_t Cpabr_lp_t Cpabr_lp_pi Lpabr_lp_pi Wn_lp syspmax_lp_f syspmin_lp_f Lpabp_lp_t_f Cpabp_lp_t_f Lpabr_lp_t_f Cpabr_lp_t_f Cpabp_lp_pi_f Lpabp_lp_pi_f Cpabr_lp_pi_f Lpabr_lp_pi_f palp_frec_z p1
palp_frec_z=handles.palp_frec_z;
if palp_frec_z<=0 || ~isnumeric(palp_frec_z) || ~isreal(palp_frec_z) || isnan(palp_frec_z)
warndlg('Enter Numerical Real Denormalization Impedance','Warning');
else
    if p1==0
   warndlg('Calculate Transfer Function','Warning');
    else
set(gcf,'visible','off');
transpa_lp_frec_z_rf(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs,Lpabp_lp_t,Cpabp_lp_t,Cpabp_lp_pi,Lpabp_lp_pi,Lpabr_lp_t,Cpabr_lp_t,Cpabr_lp_pi,Lpabr_lp_pi,Wn_lp,syspmax_lp_f,syspmin_lp_f,Lpabp_lp_t_f,Cpabp_lp_t_f,Lpabr_lp_t_f,Cpabr_lp_t_f,Cpabp_lp_pi_f,Lpabp_lp_pi_f,Cpabr_lp_pi_f,Lpabr_lp_pi_f,palp_frec_z)
    end
end
