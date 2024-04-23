function varargout = rfallfilters(varargin)
% RFALLFILTERS MATLAB code for rfallfilters.fig
%      RFALLFILTERS, by itself, creates a new RFALLFILTERS or raises the existing
%      singleton*.
%
%      H = RFALLFILTERS returns the handle to a new RFALLFILTERS or the handle to
%      the existing singleton*.
%
%      RFALLFILTERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RFALLFILTERS.M with the given input arguments.
%
%      RFALLFILTERS('Property','Value',...) creates a new RFALLFILTERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rfallfilters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rfallfilters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rfallfilters

% Last Modified by GUIDE v2.5 21-Oct-2022 07:30:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rfallfilters_OpeningFcn, ...
                   'gui_OutputFcn',  @rfallfilters_OutputFcn, ...
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


% --- Executes just before rfallfilters is made visible.
function rfallfilters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rfallfilters (see VARARGIN)
global nb wsp amax amin nch1 nch2 ne np
nb=varargin{1};
wsp=varargin{2};
amax=varargin{3};
amin=varargin{4};
nch1=varargin{5};
nch2=varargin{6};
ne=varargin{7};
np=varargin{8};
%wc=varargin(9)
% Choose default command line output for rfallfilters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rfallfilters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rfallfilters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
cla(handles.rfall,'reset')

% --- Executes on button press in regmenu.
function regmenu_Callback(hObject, eventdata, handles)
% hObject    handle to regmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(gcf,'visible','off');
orden

% --- Executes on button press in genrfall.
function genrfall_Callback(hObject, eventdata, handles)
% hObject    handle to genrfall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amax amin wsp nb nch1 nch2 ne np
hold on
%Seleccionando Filtro
ft_but=get(handles.resfrecbutlp,'Value');
ft_elip=get(handles.resfreceliplp,'Value');
ft_cheby1=get(handles.resfrecchebyunolp,'Value');
ft_cheby2=get(handles.resfrecchebydoslp,'Value');
ft_paobr=get(handles.resfrecpasobrlp,'Value');
ft_paobp=get(handles.resfrecpasobplp,'Value');
%hold on
if ft_but == 1 && ft_cheby1==0 && ft_cheby2==0 && ft_elip==0 && ft_paobp==0 && ft_paobr==0
if nb<=0 || isnan(nb) || isinf(nb) || ~isnumeric(nb) || ~isreal(nb)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
else
[zb pb kb]=buttap(nb);
numb=poly(zb)*kb; denb=poly(pb);
sysbut_lp=tf(numb,denb);
Butterworth=sysbut_lp;
h=bodeoptions; 
 h.PhaseVisible='off';
  bodeplot(Butterworth,h,'c')
  set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
axes(handles.rfall);
end
elseif ft_but == 0 && ft_cheby1==1 && ft_cheby2==0 && ft_elip==0 && ft_paobp==0 && ft_paobr==0
if nch1<=0 || isnan(nch1) || isinf(nch1) || ~isnumeric(nch1) || ~isreal(nch1)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
else
[zc1 pc1 kc1]=cheb1ap(nch1,amax);
numch1=poly(zc1)*kc1; dench1=poly(pc1);
sysch1_lp=tf(numch1,dench1);
ChebyI=sysch1_lp;
 h=bodeoptions; 
 h.PhaseVisible='off';
 bodeplot(ChebyI,h,'red')
 set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
axes(handles.rfall);

end
elseif ft_but == 0 && ft_cheby1==0 && ft_cheby2==1 && ft_elip==0 && ft_paobp==0 && ft_paobr==0
if nch2<=0 || isnan(nch2) || isinf(nch2) || ~isnumeric(nch2) || ~isreal(nch2)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
else
[zc2 pc2 kc2]=cheb2ap(nch2,amin); %orden y atenuación amin
numch2=poly(zc2)*kc2; dench2=poly(pc2);
sysch2_lp=tf(numch2,dench2);
ChebyII=sysch2_lp;
 h=bodeoptions; 
 h.PhaseVisible='off';
 bodeplot(ChebyII,h,'k')
 set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
axes(handles.rfall);

end
elseif ft_but == 0 && ft_cheby1==0 && ft_cheby2==0 && ft_elip==1 && ft_paobp==0 && ft_paobr==0
if ne<=0 || isnan(ne) || isinf(ne) || ~isnumeric(ne) || ~isreal(ne)
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications','Warning');
else
[ze pe ke]=ellipap(ne,amax,amin); %orden, amax, amin
nume=poly(ze)*ke; dene=poly(pe);
syse_lp=tf(nume,dene);
Eliptico=syse_lp; 
h=bodeoptions; 
 h.PhaseVisible='off';
 bodeplot(Eliptico,h,'magenta')
 set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
axes(handles.rfall);


end
elseif ft_but == 0 && ft_cheby1==0 && ft_cheby2==0 && ft_elip==0 && ft_paobp==1 && ft_paobr==0
if np<=0 || isnan(np) || isinf(np) || ~isnumeric(np) || ~isreal(np) || np>=22
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications or place a filter order less than 21 in the main menu','Warning');
else
sysp=funpas_optbandstop(np,amax);
PascalOBR=sysp; 
h=bodeoptions; 
% %h.FreqUnits='Hz';
 h.PhaseVisible='off';
 bodeplot(PascalOBR,h,'green')
 set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
axes(handles.rfall);

end
else
if np<=0 || isnan(np) || isinf(np) || ~isnumeric(np) || ~isreal(np) || np>=22
    warndlg('Indeterminate Transfer Function, it is recommended to enter other design specifications or place a filter order less than 21 in the main menu','Warning');
else
[syspmin]=funpas_optbandpas(np,wsp,amin);
PascalOBP=syspmin; 
h=bodeoptions; 
% %h.FreqUnits='Hz';
 h.PhaseVisible='off';
 bodeplot(PascalOBP,h,'b') %'b'
 set(findall(gcf,'type','line'),'linewidth',1.3)
 grid on;
 axes(handles.rfall);
end
end
hold off

%axes(handles.rfall);
% --- Executes on button press in limpiarpan.
function limpiarpan_Callback(hObject, eventdata, handles)
% hObject    handle to limpiarpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.rfall,'reset')
