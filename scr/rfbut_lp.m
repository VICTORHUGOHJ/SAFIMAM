function varargout = rfbut_lp(varargin)
% RFBUT_LP MATLAB code for rfbut_lp.fig
%      RFBUT_LP, by itself, creates a new RFBUT_LP or raises the existing
%      singleton*.
%
%      H = RFBUT_LP returns the handle to a new RFBUT_LP or the handle to
%      the existing singleton*.
%
%      RFBUT_LP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RFBUT_LP.M with the given input arguments.
%
%      RFBUT_LP('Property','Value',...) creates a new RFBUT_LP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rfbut_lp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rfbut_lp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rfbut_lp

% Last Modified by GUIDE v2.5 14-Sep-2022 14:44:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rfbut_lp_OpeningFcn, ...
                   'gui_OutputFcn',  @rfbut_lp_OutputFcn, ...
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


% --- Executes just before rfbut_lp is made visible.
function rfbut_lp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rfbut_lp (see VARARGIN)
global nb sysbut_lp kb zb pb numb denb amax amin nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp wc wsp f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp
nb=varargin{1};
sysbut_lp=varargin{2};
kb=varargin{3};
zb=varargin{4};
pb=varargin{5};
numb=varargin{6};
denb=varargin{7};
amax=varargin{8};
amin=varargin{9};
nch1=varargin{10};
f_but=varargin{11};
f_cheby1=varargin{12};
zc1=varargin{13};
pc1=varargin{14};
kc1=varargin{15};
numch1=varargin{16};
dench1=varargin{17};
sysch1_lp=varargin{18};
wc=varargin{19};
wsp=varargin{20};
f_cheby2=varargin{21};
f_elip=varargin{22};
nch2=varargin{23};
ne=varargin{24};
zc2=varargin{25};
pc2=varargin{26};
kc2=varargin{27};
numch2=varargin{28};
dench2=varargin{29};
sysch2_lp=varargin{30};
ze=varargin{31};
pe=varargin{32};
ke=varargin{33};
nume=varargin{34};
dene=varargin{35};
syse_lp=varargin{36};
%
% Choose default command line output for rfbut_lp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rfbut_lp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rfbut_lp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%
global sysbut_lp sysch1_lp f_but f_cheby1 f_cheby2 f_elip sysch2_lp syse_lp
cla(handles.rfbut,'reset')
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysbut_lp,h,'c')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbut);
legend('Butterworth LP')

elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysch1_lp,h,'red')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbut);
legend('Chebyshev I LP')

elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(sysch2_lp,h,'k')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbut);
legend('Chebyshev II LP')

else
h=bodeoptions; 
%h.FreqUnits='Hz';
h.PhaseVisible='off';
bodeplot(syse_lp,h,'magenta')
set(findall(gcf,'type','line'),'linewidth',1.3)
grid on;
axes(handles.rfbut);
legend('Elliptic LP')
end



% --- Executes on button press in fin4.
function fin4_Callback(hObject, eventdata, handles)
% hObject    handle to fin4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all


% --- Executes on button press in redbut_lp.
function redbut_lp_Callback(hObject, eventdata, handles)
% hObject    handle to redbut_lp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nb sysbut_lp kb zb pb numb denb amax amin nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp wc wsp f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp

set(gcf,'visible','off');
redbut_lp(nb,sysbut_lp,kb,zb,pb,numb,denb,amax,amin,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,wc,wsp,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp)

% --- Executes on button press in r2.
function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden
