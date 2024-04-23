function varargout = orden(varargin)
% ORDEN MATLAB code for orden.fig
%      ORDEN, by itself, creates a new ORDEN or raises the existing
%      singleton
% *.

%
%      H = ORDEN returns the handle to a new ORDEN or the handle to
%      the existing singleton*.
%
%      ORDEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CAL ñkLBACK in ORDEN.M with the given input arguments.
%
%      ORDEN('Property','Value',...) creates a new ORDEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before orden_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to orden_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help orden

% Last Modified by GUIDE v2.5 21-Oct-2022 11:39:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @orden_OpeningFcn, ...
                   'gui_OutputFcn',  @orden_OutputFcn, ...
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


% --- Executes just before orden is made visible.
function orden_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to orden (see VARARGIN)

% Choose default command line output for orden
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes orden wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = orden_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function amax_Callback(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amax as text
%        str2double(get(hObject,'String')) returns contents of amax as a double
amax=get(hObject,'String'); 
amax=str2double(amax);
handles.amax=amax;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amin_Callback(hObject, eventdata, handles)
% hObject    handle to amin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amin as text
%        str2double(get(hObject,'String')) returns contents of amin as a double
amin=get(hObject,'String'); 
amin=str2double(amin); 
handles.amin=amin;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function amin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wswp_Callback(hObject, eventdata, handles)
% hObject    handle to wswp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wswp as text
%        str2double(get(hObject,'String')) returns contents of wswp as a double
wswp=get(hObject,'String'); 
wswp=str2double(wswp); 
handles.wswp=wswp;
guidata(hObject,handles); 

% --- Executes during object creation, after setting all properties.
function wswp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wswp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in orden.
function orden_Callback(hObject, eventdata, handles)
% hObject    handle to orden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amax amin ws wp wsp nb nch1 nch2 ne np wswp wc
amax=handles.amax;
amin=handles.amin;
wswp=handles.wswp;

%if wswp<=1 || ~isnumeric(amax) || ~isnumeric(amin) || ~isnumeric(wswp) || wswp>=10
if ~isnumeric(amax) || amax<=0 || ~isreal(amax) || ~isnumeric(amin) || amin<=0 || ~isreal(amin) || ~isnumeric(wswp) || wswp<=1 || wswp>=10 || ~isreal(wswp) || isnan(wswp)
warndlg('Please enter the necessary data or the transition ratio entered is less than unity','Warning');
else
ws=wswp/10;
wp=1/10;
wc=wp*10;
wsp=ws*10;

%Butterworth
[nb Wnb]=buttord(wp,ws,amax,amin);
set(handles.nb,'String',num2str(nb));
%Chebyshev I
[nch1 Wnch1]=cheb1ord(wp,ws,amax,amin);
set(handles.nch1,'String',num2str(nch1));
%Chebyshev II
[nch2 Wnch2]=cheb2ord(wp,ws,amax,amin);
set(handles.nch2,'String',num2str(nch2));
%Elíptico
[ne Wne]=ellipord(wp,ws,amax,amin);
set(handles.ne,'String',num2str(ne));
%Pascal
[np]=pasord(amax,amin,nch1,wsp);
set(handles.np,'String',num2str(np));
end

% --- Executes on button press in ftglob.
function ftglob_Callback(hObject, eventdata, handles)
% hObject    handle to ftglob (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%amax amin ws wp wsp nch1x nch2x nex npx
global nb ws wc wsp amax amin nch1 nch2 ne np wswp f_but f_cheby1 f_cheby2 f_elip f_pa

if ~isnumeric(amax) || amax<=0 || ~isreal(amax) || ~isnumeric(amin) || amin<=0 || ~isreal(amin) || ~isnumeric(wswp) || wswp<=1 || wswp>=10 || ~isreal(wswp) || nb<=0 || isnan(nb) || isinf(nb) || ~isnumeric(nb) || ~isreal(nb) || nch1<=0 || isnan(nch1) || isinf(nch1) || ~isnumeric(nch1) || ~isreal(nch1) || nch2<=0 || isnan(nch2) || isinf(nch2) || ~isnumeric(nch2) || ~isreal(nch2) || ne<=0 || isnan(ne) || isinf(ne) || ~isnumeric(ne) || ~isreal(ne)
     warndlg('Enter design specifications','Warning');
else
%%%%%%%%%%%%%%Filtro seleccionado
f_but=get(handles.but,'Value');
f_cheby1=get(handles.cheby1,'Value');
f_cheby2=get(handles.cheby2,'Value');
f_elip=get(handles.elip,'Value');
f_pa=get(handles.pa,'Value');
%%%%%%%%%%%%%%
if f_but == 1 || f_cheby1==1 || f_cheby2==1 || f_elip==1
 nb=get(handles.nb,'String'); 
 nb=str2double(nb);
 guidata(hObject,handles); 

 nch1=get(handles.nch1,'String'); 
 nch1=str2double(nch1);
 guidata(hObject,handles); 

 nch2=get(handles.nch2,'String'); 
 nch2=str2double(nch2);
 guidata(hObject,handles); 

 ne=get(handles.ne,'String'); 
 ne=str2double(ne);
 guidata(hObject,handles); 

if nb<=1 || isnan(nb) || isinf(nb) || ~isnumeric(nb) || ~isreal(nb)
    warndlg('Indeterminate transfer function or network synthesis not available, it is recommended to enter other design specifications','Warning');
elseif nch1<=1 || isnan(nch1) || isinf(nch1) || ~isnumeric(nch1) || ~isreal(nch1)
    warndlg('Indeterminate transfer function or network synthesis not available, it is recommended to enter other design specifications','Warning');
elseif nch2<=1 || isnan(nch2) || isinf(nch2) || ~isnumeric(nch2) || ~isreal(nch2)
    warndlg('Indeterminate transfer function or network synthesis not available, it is recommended to enter other design specifications','Warning');
elseif ne<=1 || isnan(ne) || isinf(ne) || ~isnumeric(ne) || ~isreal(ne)
    warndlg('Indeterminate transfer function or network synthesis not available, it is recommended to enter other design specifications','Warning');
else
orden('visible','off');
ftbut(nb,wc,wsp,amax,amin,nch1,f_but,f_cheby1,f_cheby2,f_elip,nch2,ne);
end
elseif f_pa==1
 np=get(handles.np,'String'); 
 np=str2double(np);
 guidata(hObject,handles);
if np<=1 || isnan(np) || isinf(np) || ~isnumeric(np) || ~isreal(np) || np>=22
    warndlg('Indeterminate Transfer Function or Network Synthesis Not Available, it is recommended to enter other design specifications or place a filter order less than 21','Warning');
else
    orden('visible','off');
    filtropa_ft_realideal(np,wc,ws,wsp,amax,amin,nch1);
end
else
    warndlg('Select an approximation method','Warning');
end
end

% --- Executes on button press in fin1.
function fin1_Callback(hObject, eventdata, handles)
% hObject    handle to fin1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

function nb_Callback(hObject, eventdata, handles)
% hObject    handle to nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nb as text
%        str2double(get(hObject,'String')) returns contents of nb as a double


% --- Executes during object creation, after setting all properties.
function nb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nch1_Callback(hObject, eventdata, handles)
% hObject    handle to nch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nch1 as text
%        str2double(get(hObject,'String')) returns contents of nch1 as a double


% --- Executes during object creation, after setting all properties.
function nch1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nch2_Callback(hObject, eventdata, handles)
% hObject    handle to nch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nch2 as text
%        str2double(get(hObject,'String')) returns contents of nch2 as a double


% --- Executes during object creation, after setting all properties.
function nch2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ne_Callback(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ne as text
%        str2double(get(hObject,'String')) returns contents of ne as a double


% --- Executes during object creation, after setting all properties.
function ne_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function np_Callback(hObject, eventdata, handles)
% hObject    handle to np (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of np as text
%        str2double(get(hObject,'String')) returns contents of np as a double


% --- Executes during object creation, after setting all properties.
function np_CreateFcn(hObject, eventdata, handles)
% hObject    handle to np (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bodeall.
function bodeall_Callback(hObject, eventdata, handles)
% hObject    handle to bodeall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global amax amin wsp nb nch1 nch2 ne np wswp
amax=handles.amax;
amin=handles.amin;
wswp=handles.wswp;
if ~isnumeric(amax) || amax<=0 || ~isreal(amax) || ~isnumeric(amin) || amin<=0 || ~isreal(amin) || ~isnumeric(wswp) || wswp<=1 || wswp>=10 || ~isreal(wswp) || isnan(wswp)
warndlg('Indeterminate Transfer Function or Network Synthesis Not Available, it is recommended to enter other design specifications or place a filter order less than 21','Warning');
else

 nb=get(handles.nb,'String'); 
 nb=str2double(nb);
 guidata(hObject,handles); 

 nch1=get(handles.nch1,'String'); 
 nch1=str2double(nch1);
 guidata(hObject,handles); 

 nch2=get(handles.nch2,'String'); 
 nch2=str2double(nch2);
 guidata(hObject,handles); 

 ne=get(handles.ne,'String'); 
 ne=str2double(ne);
 guidata(hObject,handles); 
    
 np=get(handles.np,'String'); 
 np=str2double(np);
 guidata(hObject,handles);
 
set(gcf,'visible','off');
rfallfilters(nb,wsp,amax,amin,nch1,nch2,ne,np)
end
