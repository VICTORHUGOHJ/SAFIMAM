function varargout = ftbut(varargin)
% FTBUTT MATLAB code for ftbutt.fig
%      FTBUTT, by itself, creates a new FTBUTT or raises the existing
%      singleton*.
%
%      H = FTBUTT returns the handle to a new FTBUTT or the handle to
%      the existing singleton*.
%
%      FTBUTT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FTBUTT.M with the given input arguments.
%
%      FTBUTT('Property','Value',...) creates a new FTBUTT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ftbut_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ftbut_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ftbutt

% Last Modified by GUIDE v2.5 13-Sep-2022 09:40:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ftbut_OpeningFcn, ...
                   'gui_OutputFcn',  @ftbut_OutputFcn, ...
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


% --- Executes just before ftbutt is made visible.
function ftbut_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ftbutt (see VARARGIN)
global nb wc wsp amax amin nch1 f_but f_cheby1 f_cheby2 f_elip nch2 ne
nb=varargin{1};
wc=varargin{2};
wsp=varargin{3};
amax=varargin{4};
amin=varargin{5};
nch1=varargin{6};
f_but=varargin{7};
f_cheby1=varargin{8};
f_cheby2=varargin{9};
f_elip=varargin{10};
nch2=varargin{11};
ne=varargin{12};
% Choose default command line output for ftbutt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ftbutt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ftbut_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global nb sysbut_lp kb zb pb numb denb amax amin nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp
if f_but == 1 && f_cheby1==0 && f_cheby2==0 && f_elip==0
[zb pb kb]=buttap(nb);
numb=poly(zb)*kb; denb=poly(pb);
sysbut_lp=tf(numb,denb);
ftbut_lp=evalc('sysbut_lp');
set(handles.ftbutt,'string',ftbut_lp);
elseif f_but == 0 && f_cheby1==1 && f_cheby2==0 && f_elip==0
[zc1 pc1 kc1]=cheb1ap(nch1,amax);
numch1=poly(zc1)*kc1; dench1=poly(pc1);
sysch1_lp=tf(numch1,dench1);
ftch1_lp=evalc('sysch1_lp');
set(handles.ftbutt,'string',ftch1_lp);
elseif f_but == 0 && f_cheby1==0 && f_cheby2==1 && f_elip==0
%%cheby2
[zc2 pc2 kc2]=cheb2ap(nch2,amin); %orden y atenuación amin
numch2=poly(zc2)*kc2; dench2=poly(pc2);
sysch2_lp=tf(numch2,dench2);
ftch2_lp=evalc('sysch2_lp');
set(handles.ftbutt,'string',ftch2_lp);
else
%eliptico
[ze pe ke]=ellipap(ne,amax,amin); %orden, amax, amin
nume=poly(ze)*ke; dene=poly(pe);
syse_lp=tf(nume,dene);
fte_lp=evalc('syse_lp');
set(handles.ftbutt,'string',fte_lp);
end

% --- Executes during object creation, after setting all properties.
function ftbutt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ftbutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in rf1.
function rf1_Callback(hObject, eventdata, handles)
% hObject    handle to rf1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nb sysbut_lp kb zb pb numb denb amax amin nch1 f_but f_cheby1 zc1 pc1 kc1 numch1 dench1 sysch1_lp wc wsp f_cheby2 f_elip nch2 ne zc2 pc2 kc2 numch2 dench2 sysch2_lp ze pe ke nume dene syse_lp
set(gcf,'visible','off');
rfbut_lp(nb,sysbut_lp,kb,zb,pb,numb,denb,amax,amin,nch1,f_but,f_cheby1,zc1,pc1,kc1,numch1,dench1,sysch1_lp,wc,wsp,f_cheby2,f_elip,nch2,ne,zc2,pc2,kc2,numch2,dench2,sysch2_lp,ze,pe,ke,nume,dene,syse_lp)

% --- Executes on button press in fin2.
function fin2_Callback(hObject, eventdata, handles)
% hObject    handle to fin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all
