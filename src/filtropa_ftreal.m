function varargout = filtropa_ftreal(varargin)
% FILTROPA_FTREAL MATLAB code for filtropa_ftreal.fig
%      FILTROPA_FTREAL, by itself, creates a new FILTROPA_FTREAL or raises the existing
%      singleton*.
%
%      H = FILTROPA_FTREAL returns the handle to a new FILTROPA_FTREAL or the handle to
%      the existing singleton*.
%
%      FILTROPA_FTREAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_FTREAL.M with the given input arguments.
%
%      FILTROPA_FTREAL('Property','Value',...) creates a new FILTROPA_FTREAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_ftreal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_ftreal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_ftreal

% Last Modified by GUIDE v2.5 06-Oct-2022 08:26:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_ftreal_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_ftreal_OutputFcn, ...
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


% --- Executes just before filtropa_ftreal is made visible.
function filtropa_ftreal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_ftreal (see VARARGIN)
global np wc ws wsp amax amin nch1
np=varargin{1};
wc=varargin{2};
ws=varargin{3};
wsp=varargin{4};
amax=varargin{5};
amin=varargin{6};
nch1=varargin{7};
% Choose default command line output for filtropa_ftreal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_ftreal wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global npx amax amin nch1 wsp
[npx]=pasord(amax,amin,nch1,wsp);

% --- Outputs from this function are returned to the command line.
function varargout = filtropa_ftreal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global p1 p2
p1=0;
p2=0;
set(handles.ftreal_pa_lp,'string'," ");
set(handles.amaxpa,'string'," ");
set(handles.aminpa,'string'," ");
set(handles.npascal,'string'," ");
set(handles.amaxpainicial,'string'," ");
set(handles.aminpainicial,'string'," ");
set(handles.nppainicial,'string'," ");

function valor_rs_Callback(hObject, eventdata, handles)
% hObject    handle to valor_rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valor_rs as text
%        str2double(get(hObject,'String')) returns contents of valor_rs as a double
valor_rs=get(hObject,'String'); 
valor_rs=str2double(valor_rs);
handles.valor_rs=valor_rs;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function valor_rs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor_rs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filtropareal_Opt_bp.
function filtropareal_Opt_bp_Callback(hObject, eventdata, handles)
% hObject    handle to filtropareal_Opt_bp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np amax amin ws valor_rs amax_new amin_new np_new sysprs syspminrs np denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min npx npa p1
p1=get(handles.filtropareal_Opt_bp,'Value');
valor_rs=handles.valor_rs;
if valor_rs<=0 || ~isnumeric(valor_rs) || ~isreal(valor_rs) || isnan(valor_rs)
warndlg('Enter the actual numeric Rs value','Warning');
p1=0;
else
[amax_new,amin_new,np_new,OmegaD,pmax] = rawsrsnp(amax,amin,ws,valor_rs,np);
[sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min]=tfrs(ws,amax,amin,np,valor_rs);
ftpa_lp_obp_real=evalc('sysprs');
set(handles.ftreal_pa_lp,'string',ftpa_lp_obp_real);
set(handles.amaxpa,'string',amax_new);
set(handles.aminpa,'string',amin_new);
set(handles.npascal,'string',np_new);
set(handles.amaxpainicial,'string',amax);
set(handles.aminpainicial,'string',amin);
set(handles.nppainicial,'string',npx);
end
% --- Executes on button press in filtropareal_Opt_br.
function filtropareal_Opt_br_Callback(hObject, eventdata, handles)
% hObject    handle to filtropareal_Opt_br (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global np amax amin ws valor_rs amax_new amin_new np_new sysprs syspminrs np denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min npx npa p2
p2=get(handles.filtropareal_Opt_br,'Value');
valor_rs=handles.valor_rs;
if valor_rs<=0 || ~isnumeric(valor_rs) || ~isreal(valor_rs) || isnan(valor_rs)
warndlg('Enter the actual numeric Rs value','Warning');
p2=0;
else
[amax_new,amin_new,np_new,OmegaD,pmax] = rawsrsnp(amax,amin,ws,valor_rs,np);
[sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min]=tfrs(ws,amax,amin,np,valor_rs);

ftpa_lp_obr_real=evalc('syspminrs');
set(handles.ftreal_pa_lp,'string',ftpa_lp_obr_real);
set(handles.amaxpa,'string',amax_new);
set(handles.aminpa,'string',amin_new);
set(handles.npascal,'string',np_new);
set(handles.amaxpainicial,'string',amax);
set(handles.aminpainicial,'string',amin);
set(handles.nppainicial,'string',npx);
end
% --- Executes on button press in finpa4.
function finpa4_Callback(hObject, eventdata, handles)
% hObject    handle to finpa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear,clc,close all

% --- Executes on button press in rfreal_palp.
function rfreal_palp_Callback(hObject, eventdata, handles)
% hObject    handle to rfreal_palp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sysprs syspminrs npa denparcial numerador denminparcial numin nump_max denp_max nump_min denp_min valor_rs p1 p2
valor_rs=handles.valor_rs;
if valor_rs<=0 || ~isnumeric(valor_rs) || ~isreal(valor_rs) || isnan(valor_rs)
warndlg('Enter the actual numeric Rs value','Warning');
else
if p1==0 && p2==0
    warndlg('Calculate Transfer Function','Warning');
else
set(gcf,'visible','off');
filtropa_rfreal(sysprs,syspminrs,npa,denparcial,numerador,denminparcial,numin,nump_max,denp_max,nump_min,denp_min,valor_rs)
end
end
function amaxpa_Callback(hObject, eventdata, handles)
% hObject    handle to amaxpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amaxpa as text
%        str2double(get(hObject,'String')) returns contents of amaxpa as a double


% --- Executes during object creation, after setting all properties.
function amaxpa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amaxpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aminpa_Callback(hObject, eventdata, handles)
% hObject    handle to aminpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aminpa as text
%        str2double(get(hObject,'String')) returns contents of aminpa as a double


% --- Executes during object creation, after setting all properties.
function aminpa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aminpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function npascal_Callback(hObject, eventdata, handles)
% hObject    handle to npascal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of npascal as text
%        str2double(get(hObject,'String')) returns contents of npascal as a double


% --- Executes during object creation, after setting all properties.
function npascal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to npascal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
