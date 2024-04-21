function varargout = filtropa_ft(varargin)
% FILTROPA_FT MATLAB code for filtropa_ft.fig
%      FILTROPA_FT, by itself, creates a new FILTROPA_FT or raises the existing
%      singleton*.
%
%      H = FILTROPA_FT returns the handle to a new FILTROPA_FT or the handle to
%      the existing singleton*.
%
%      FILTROPA_FT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROPA_FT.M with the given input arguments.
%
%      FILTROPA_FT('Property','Value',...) creates a new FILTROPA_FT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filtropa_ft_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filtropa_ft_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filtropa_ft

% Last Modified by GUIDE v2.5 06-Oct-2022 06:59:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filtropa_ft_OpeningFcn, ...
                   'gui_OutputFcn',  @filtropa_ft_OutputFcn, ...
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


% --- Executes just before filtropa_ft is made visible.
function filtropa_ft_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filtropa_ft (see VARARGIN)

% Choose default command line output for filtropa_ft
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filtropa_ft wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filtropa_ft_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in filtropa_Opt_bp.
function filtropa_Opt_bp_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_bp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in filtropa_Opt_br.
function filtropa_Opt_br_Callback(hObject, eventdata, handles)
% hObject    handle to filtropa_Opt_br (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in finpa1.
function finpa1_Callback(hObject, eventdata, handles)
% hObject    handle to finpa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rf_palp.
function rf_palp_Callback(hObject, eventdata, handles)
% hObject    handle to rf_palp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
