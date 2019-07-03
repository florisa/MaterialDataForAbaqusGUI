function varargout = Material_Abaqus(varargin)
% MATERIAL_ABAQUS MATLAB code for Material_Abaqus.fig
%      MATERIAL_ABAQUS, by itself, creates a new MATERIAL_ABAQUS or raises the existing
%      singleton*.
%
%      H = MATERIAL_ABAQUS returns the handle to a new MATERIAL_ABAQUS or the handle to
%      the existing singleton*.
%
%      MATERIAL_ABAQUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATERIAL_ABAQUS.M with the given input arguments.
%
%      MATERIAL_ABAQUS('Property','Value',...) creates a new MATERIAL_ABAQUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Material_Abaqus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Material_Abaqus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Material_Abaqus

% Last Modified by GUIDE v2.5 29-Apr-2019 13:34:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Material_Abaqus_OpeningFcn, ...
                   'gui_OutputFcn',  @Material_Abaqus_OutputFcn, ...
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


% --- Executes just before Material_Abaqus is made visible.
function Material_Abaqus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Material_Abaqus (see VARARGIN)

% Choose default command line output for Material_Abaqus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Material_Abaqus wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%                       Initialization var values in workspace
initial(hObject, eventdata, handles)

%%                           WZL-LOGO 
% I = imread([pwd '\WZL_ABAQUS_no_logo.jpg']); % Windows path
I = imread([pwd '/WZL_ABAQUS_no_logo.jpg']);   % Mac path
handles = guihandles;
handles.logo = newplot;
image(I);
axis off;

%%                        Material_Abaqus OutputFcn
% --- Outputs from this function are returned to the command line.
function varargout = Material_Abaqus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future v ersion of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% ======================= BEGIN OF PANEL MATERIAL SELECTION ==============
%  ========================================================================

%%                         microstructure_material_law_checkbox
function microstructure_material_law_checkbox_Callback(hObject, eventdata, handles)
save_material_selection = 1;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.microstructure_material_law_checkbox, 'Value', 1);
set(handles.jc_general_checkbox, 'Value', 0);
set(handles.voce_general_checkbox, 'Value', 0)

%%                         fp_text_box
function fp_text_Callback(hObject, eventdata, handles)
fp_text = str2double(get(hObject, 'String'));
if (isnan(fp_text) || fp_text <= 0)
    fp_text = 0;
    assignin('base', 'fp_text', fp_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'fp_text', fp_text);

function fp_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                    S_text_box
function s_text_Callback(hObject, eventdata, handles)

s_text = str2double(get(hObject, 'String'));
if (isnan(s_text) || s_text <= 0)
    s_text = 0;
    assignin('base', 's_text', s_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 's_text', s_text);

function s_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%                      Dp_text_box
function dp_text_Callback(hObject, eventdata, handles)

dp_text = str2double(get(hObject, 'String'));
if (isnan(dp_text) || dp_text <= 0)
    dp_text = 0;
    assignin('base', 'dp_text', dp_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');   
end
assignin('base', 'dp_text', dp_text);

function dp_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%                   Df_text_box
function df_text_Callback(hObject, eventdata, handles)

df_text = str2double(get(hObject, 'String'));
if (isnan(df_text) || df_text <= 0)
    df_text = 0;
    assignin('base', 'df_text', df_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'df_text', df_text);

function df_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                jc_general_checkbox
function jc_general_checkbox_Callback(hObject, eventdata, handles)

save_material_selection = 2;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.microstructure_material_law_checkbox, 'Value', 0);
set(handles.jc_general_checkbox, 'Value', 1);
set(handles.voce_general_checkbox, 'Value', 0)

%%                 User_Defined_input_A
function user_defined_input_A_Callback(hObject, eventdata, handles)

user_defined_input_A = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_A) || user_defined_input_A <= 0)
    user_defined_input_A = 0;
    assignin('base', 'user_defined_input_A', user_defined_input_A);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_A', user_defined_input_A);

function user_defined_input_A_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                User_Defined_input_B
function user_defined_input_B_Callback(hObject, eventdata, handles)

user_defined_input_B = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_B) || user_defined_input_B <= 0)
    user_defined_input_B = 0;
    assignin('base', 'user_defined_input_B', user_defined_input_B);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_B', user_defined_input_B);

function user_defined_input_B_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                  User_Defined_input_C
function user_defined_input_C_Callback(hObject, eventdata, handles)

user_defined_input_C = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_C) || user_defined_input_C <= 0)
    user_defined_input_C = 0;
    assignin('base', 'user_defined_input_C', user_defined_input_C);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_C', user_defined_input_C);

function user_defined_input_C_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%               User_Defined_input_m
function user_defined_input_m_Callback(hObject, eventdata, handles)

user_defined_input_m = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_m) || user_defined_input_m <= 0)
    user_defined_input_m = 0;
    assignin('base', 'user_defined_input_m', user_defined_input_m);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_m', user_defined_input_m);

function user_defined_input_m_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                  User_defined_input_n
function user_defined_input_n_Callback(hObject, eventdata, handles)

user_defined_input_n = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_n) || user_defined_input_n <= 0)
    user_defined_input_n = 0;
    assignin('base', 'user_defined_input_n', user_defined_input_n);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_n', user_defined_input_n);

function user_defined_input_n_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                voce_general_checkbox
function voce_general_checkbox_Callback(hObject, eventdata, handles)

save_material_selection = 3;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.microstructure_material_law_checkbox, 'Value', 0);
set(handles.jc_general_checkbox, 'Value', 0);
set(handles.voce_general_checkbox, 'Value', 1)

%%                   User_defined_input_A2
function user_defined_input_A2_Callback(hObject, eventdata, handles)

user_defined_input_A2 = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_A2) || user_defined_input_A2 <= 0)
    user_defined_input_A2 = 0;
    assignin('base', 'user_defined_input_A2', user_defined_input_A2);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_A2', user_defined_input_A2);


function user_defined_input_A2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                    User_defined_input_C2
function user_defined_input_C2_Callback(hObject, eventdata, handles)
    user_defined_input_C2 = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_C2) || user_defined_input_C2 <= 0)
    user_defined_input_C2 = 0;
    assignin('base', 'user_defined_input_C2', user_defined_input_C2);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_C2', user_defined_input_C2);

function user_defined_input_C2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                      User_defined_input_Q
function user_defined_input_Q_Callback(hObject, eventdata, handles)

user_defined_input_Q = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_Q) || user_defined_input_Q <= 0)
    user_defined_input_Q = 0;
    assignin('base', 'user_defined_input_Q', user_defined_input_Q);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_Q', user_defined_input_Q);


function user_defined_input_Q_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                     User_defined_input_v
function user_defined_input_v_Callback(hObject, eventdata, handles)

user_defined_input_v = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_v) || user_defined_input_v <= 0)
    user_defined_input_v = 0;
    assignin('base', 'user_defined_input_v', user_defined_input_v);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_v', user_defined_input_v);

function user_defined_input_v_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   User_defined_input_Y0
function user_defined_input_Y0_Callback(hObject, eventdata, handles)

user_defined_input_Y0 = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_Y0) || user_defined_input_Y0 <= 0)
    user_defined_input_Y0 = 0;
    assignin('base', 'user_defined_input_Y0', user_defined_input_Y0);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_Y0', user_defined_input_Y0);

function user_defined_input_Y0_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   User_defined_input_d
function user_defined_input_d_Callback(hObject, eventdata, handles)

user_defined_input_d = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_d) || user_defined_input_d <= 0)
    user_defined_input_d = 0;
    assignin('base', 'user_defined_input_d', user_defined_input_d);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_d', user_defined_input_d);

function user_defined_input_d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%                   User_defined_input_m2
function user_defined_input_m2_Callback(hObject, eventdata, handles)

user_defined_input_m2 = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_m2) || user_defined_input_m2 <= 0)
    user_defined_input_m2 = 0;
    assignin('base', 'user_defined_input_m2', user_defined_input_m2);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_m2', user_defined_input_m2);

function user_defined_input_m2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   User_defined_input_H
function user_defined_input_H_Callback(hObject, eventdata, handles)
    
user_defined_input_H = str2double(get(hObject, 'String'));
if (isnan(user_defined_input_H) || user_defined_input_H <= 0)
    user_defined_input_H = 0;
    assignin('base', 'user_defined_input_H', user_defined_input_H);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'user_defined_input_H', user_defined_input_H);

function user_defined_input_H_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                     save_user_defined_checkbox
function save_user_defined_checkbox(hObject, eventdata, handles)

% Verify if the text values were added
user_defined_input_A = evalin('base', 'user_defined_input_A'); 
user_defined_input_B = evalin('base', 'user_defined_input_B'); 
user_defined_input_C = evalin('base', 'user_defined_input_C'); 
user_defined_input_m = evalin('base', 'user_defined_input_m'); 
user_defined_input_n = evalin('base', 'user_defined_input_n');

if user_defined_input_A == 0 || user_defined_input_B == 0 || user_defined_input_C == 0 || ...
        user_defined_input_m == 0 || user_defined_input_n == 0 
  errordlg('Fullfil all the fields', 'Error');
else
   msgbox('Clique to close the window','OK') 
   % Refresh all the other options
        set(handles.df_text, 'string', '');
        set(handles.dp_text, 'string', '');
        set(handles.s_text, 'string', '');
        set(handles.user_defined_input_A, 'string', '');
        set(handles.user_defined_input_B, 'string', '');
        set(handles.user_defined_input_C, 'string', '');
        set(handles.user_defined_input_m, 'string', '');
        set(handles.user_defined_input_n, 'string', '');
        
        set(handles.user_defined_input_A2, 'string', '');
        set(handles.user_defined_input_C2, 'string', '');
        set(handles.user_defined_input_Q, 'string', '');
        set(handles.user_defined_input_v, 'string', '');
        set(handles.user_defined_input_Y0, 'string', '');
        set(handles.user_defined_input_d, 'string', '');
        set(handles.user_defined_input_m2, 'string', '');
        set(handles.user_defined_input_H, 'string', '');
        
        s_text = 0;
        assignin('base', 's_text', s_text);
        dp_text = 0;
        assignin('base', 'dp_text', dp_text);
        df_text = 0;
        assignin('base', 'df_text', df_text);
        fp_text = 0;
        assignin('base', 'fp_text', fp_text);

        set(handles.jc_general_checkbox, 'Value', 0);
        set(handles.microstructure_material_law_checkbox,'Value', 0);
        set(handles.voce_general_checkbox, 'Value', 0);
        
end

% Control if the user saved the data
save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);

% User-Defined JC 
A = user_defined_input_A;
assignin('base', 'A', A);
B = user_defined_input_B;
assignin('base', 'B',B);
C = user_defined_input_C;
assignin('base', 'C',C);
m = user_defined_input_m;
assignin('base', 'm',m);
n = user_defined_input_n;
assignin('base', 'n',n);


%%            save_microstructure_material_law_checkbox
function save_microstructure_material_law_checkbox(hObject, eventdata, handles)
% Verify if the text values were added
dp_text = evalin('base', 'dp_text'); % �m
s_text = evalin('base', 's_text');   % �m
df_text = evalin('base', 'df_text'); % �m
fp_text = evalin('base', 'fp_text'); 

if dp_text == 0 || s_text == 0 || df_text == 0 || ...
        fp_text == 0 
  errordlg('Fullfil all the fields', 'Error');
else
   msgbox('Clique to close the window','OK') 
   % Refresh all the other options
        set(handles.df_text, 'string', '');
        set(handles.dp_text, 'string', '');
        set(handles.s_text, 'string', '');
        set(handles.fp_text, 'string', '');
        
        set(handles.user_defined_input_A, 'string', '');
        set(handles.user_defined_input_B, 'string', '');
        set(handles.user_defined_input_C, 'string', '');
        set(handles.user_defined_input_m, 'string', '');
        set(handles.user_defined_input_n, 'string', '');
        
        set(handles.user_defined_input_A2, 'string', '');
        set(handles.user_defined_input_C2, 'string', '');
        set(handles.user_defined_input_Q, 'string', '');
        set(handles.user_defined_input_v, 'string', '');
        set(handles.user_defined_input_Y0, 'string', '');
        set(handles.user_defined_input_d, 'string', '');
        set(handles.user_defined_input_m2, 'string', '');
        set(handles.user_defined_input_H, 'string', '');
        
        user_defined_input_A = 0;
        assignin('base', 'user_defined_input_A', user_defined_input_A);
        user_defined_input_B = 0;
        assignin('base', 'user_defined_input_B', user_defined_input_B);
        user_defined_input_C = 0;
        assignin('base', 'user_defined_input_C', user_defined_input_C);
        user_defined_input_m = 0;
        assignin('base', 'user_defined_input_m', user_defined_input_m);
        user_defined_input_n = 0;
        assignin('base', 'user_defined_input_n', user_defined_input_n);
        
        set(handles.jc_general_checkbox, 'Value', 0);
        set(handles.microstructure_material_law_checkbox, 'Value', 0);
        set(handles.voce_general_checkbox, 'Value', 0);
end

        
% Calculating A parameter

% Unit Convertion
% �m to mm ------- 0.001�l[�m]= l[mm]
dp_mm = 0.001 * dp_text;
df_mm = 0.001 * df_text;

% nm to �m ------  0.001�1[nm]= l[�m]
s_um = 0.001 * s_text;

% Convert to percentual
fp_percent = 0.01 * fp_text;

% Hall-Petch Relation
% Constants used in the equations
Ap_0 = 576;
Ap_d = 18;
Ap_s = 36; 
Af_0 = 28;
Af_d = 18;

% Equation for Ap
Ap = Ap_0 + Ap_d/nthroot(dp_mm,2) + (Ap_s/s_um);

% Equation for Af
Af = Af_0 + Af_d/nthroot(df_mm,2);

% Equation for Ac
Ac = Af + fp_percent *(Ap - Af);
A = Ac;
assignin('base', 'A', A);

% Other parameters contants
Bf = 405;
Bp = 432;
nf = 0.15;
np = 0.25;
Cf = 0.037;
Cp = 0.037;
mf = 0.900;
mp = 0.950;

% Calculating B Parameter
Bc = Bf + fp_percent *(Bp - Bf);
B = Bc;
assignin('base', 'B', B);

% Calculating n Parameter
nc = (nf * Bf + fp_percent *(np * Bp - nf * Bf))/Bc;
n = nc;
assignin('base', 'n', n);

% Calculating C Parameter
Cc = (Cf * Af + fp_percent *(Cp * Ap - Cf * Af))/Ac;
C = Cc;
assignin('base', 'C', C);

% Calculating m Parameter
mc = (mf * Af + fp_percent *(mp * Ap - mf * Af))/Ac;
m = mc;
assignin('base', 'm', m);

% Control if the user saved the data
save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);


%%              save_voce_checkbox
    function save_voce_checkbox(hObject, eventdata, handles)
user_defined_input_A2 = evalin('base', 'user_defined_input_A2'); 
user_defined_input_C2 = evalin('base', 'user_defined_input_C2'); 
user_defined_input_Q = evalin('base', 'user_defined_input_Q'); 
user_defined_input_v = evalin('base', 'user_defined_input_v'); 
user_defined_input_Y0 = evalin('base', 'user_defined_input_Y0');
user_defined_input_d = evalin('base', 'user_defined_input_d');
user_defined_input_m2 = evalin('base', 'user_defined_input_m2'); 
user_defined_input_H = evalin('base', 'user_defined_input_H'); 

if user_defined_input_A2 == 0 || user_defined_input_Q == 0 || user_defined_input_v == 0 || ...
        user_defined_input_Y0 == 0 || user_defined_input_d == 0 || user_defined_input_m2 == 0 || ...
        user_defined_input_C2 == 0 || user_defined_input_H == 0
  errordlg('Fullfil all the fields', 'Error');
else
   msgbox('Clique to close the window','OK') 
   % Refresh all the other options
        set(handles.df_text, 'string', '');
        set(handles.dp_text, 'string', '');
        set(handles.s_text, 'string', '');
        set(handles.user_defined_input_A, 'string', '');
        set(handles.user_defined_input_B, 'string', '');
        set(handles.user_defined_input_C, 'string', '');
        set(handles.user_defined_input_m, 'string', '');
        set(handles.user_defined_input_n, 'string', '');
        
        set(handles.user_defined_input_A2, 'string', '');
        set(handles.user_defined_input_C2, 'string', '');
        set(handles.user_defined_input_Q, 'string', '');
        set(handles.user_defined_input_v, 'string', '');
        set(handles.user_defined_input_Y0, 'string', '');
        set(handles.user_defined_input_d, 'string', '');
        set(handles.user_defined_input_m2, 'string', '');
        set(handles.user_defined_input_H, 'string', '');
        
        user_defined_input_A = 0;
        assignin('base', 'user_defined_input_A', user_defined_input_A);
        user_defined_input_B = 0;
        assignin('base', 'user_defined_input_B', user_defined_input_B);
        user_defined_input_C = 0;
        assignin('base', 'user_defined_input_C', user_defined_input_C);
        user_defined_input_m = 0;
        assignin('base', 'user_defined_input_m', user_defined_input_m);
        user_defined_input_n = 0;
        assignin('base', 'user_defined_input_n', user_defined_input_n);
      

        set(handles.jc_general_checkbox, 'Value', 0);
        set(handles.microstructure_material_law_checkbox,'Value', 0);
        set(handles.voce_general_checkbox, 'Value', 0);
end

save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);

% User-Defined voce
A2 = user_defined_input_A2;
assignin('base', 'A2', A2);
C2 = user_defined_input_C2;
assignin('base', 'C2', C2);
Q = user_defined_input_Q;
assignin('base', 'Q',Q);
v = user_defined_input_v;
assignin('base', 'v',v);
Y0 = user_defined_input_Y0;
assignin('base', 'Y0',Y0);
d = user_defined_input_d;
assignin('base', 'd',d);
m2 = user_defined_input_m2;
assignin('base', 'm2',m2);
H = user_defined_input_H;
assignin('base', 'H', H);


%%                       Save_Material_button
function save_material_selection_Callback(hObject, eventdata, handles)

save_material_selection = evalin('base', 'save_material_selection');

   switch(save_material_selection)
        case 1
            save_microstructure_material_law_checkbox(hObject, eventdata, handles);
        case 2 
            save_user_defined_checkbox(hObject, eventdata, handles);
        case 3
            save_voce_checkbox(hObject, eventdata, handles);
       otherwise
            errordlg('Please enter the material input data','Error');
   end

%%                    Clear_Material_Selection_button
function refresh_fields_button_Callback(hObject, eventdata, handles)

% Refresh all fields
set(handles.df_text, 'string', '');
set(handles.dp_text, 'string', '');
set(handles.s_text, 'string', '');
set(handles.fp_text, 'string', '');
set(handles.user_defined_input_A, 'string', '');
set(handles.user_defined_input_B, 'string', '');
set(handles.user_defined_input_C, 'string', '');
set(handles.user_defined_input_m, 'string', '');
set(handles.user_defined_input_n, 'string', '');
set(handles.user_defined_input_A2, 'string', '');
set(handles.user_defined_input_C2, 'string', '');
set(handles.user_defined_input_Q, 'string', '');
set(handles.user_defined_input_v, 'string', '');
set(handles.user_defined_input_Y0, 'string', '');
set(handles.user_defined_input_d, 'string', '');
set(handles.user_defined_input_m2, 'string', '');
set(handles.user_defined_input_H, 'string', '');
s_text = 0;
assignin('base', 's_text', s_text);
dp_text = 0;
assignin('base', 'dp_text', dp_text);
df_text = 0;
assignin('base', 'df_text', df_text);
fp_text = 0;
assignin('base', 'fp_text', fp_text);
user_defined_input_A = 0;
assignin('base', 'user_defined_input_A', user_defined_input_A);
user_defined_input_B = 0;
assignin('base', 'user_defined_input_B', user_defined_input_B);
user_defined_input_C = 0;
assignin('base', 'user_defined_input_C', user_defined_input_C);
user_defined_input_m = 0;
assignin('base', 'user_defined_input_m', user_defined_input_m);
user_defined_input_n = 0;
assignin('base', 'user_defined_input_n', user_defined_input_n);
user_defined_input_A2 = 0;
assignin('base', 'user_defined_input_A2', user_defined_input_A2);
user_defined_input_C2 = 0;
assignin('base', 'user_defined_input_C2', user_defined_input_C2);
user_defined_input_Q = 0;
assignin('base', 'user_defined_input_Q', user_defined_input_Q);
user_defined_input_v = 0;
assignin('base', 'user_defined_input_v', user_defined_input_v);
user_defined_input_Y0 = 0;
assignin('base', 'user_defined_input_Y0', user_defined_input_Y0);
user_defined_input_d = 0;
assignin('base', 'user_defined_input_d', user_defined_input_d);
user_defined_input_m2 = 0;
assignin('base', 'user_defined_input_m2', user_defined_input_m2);
user_defined_input_H = 0;
assignin('base', 'user_defined_input_H', user_defined_input_H);

set(handles.microstructure_material_law_checkbox, 'Value', 0);
set(handles.jc_general_checkbox, 'Value', 0);
set(handles.voce_general_checkbox, 'Value', 0);

save_material_panel = 0;
assignin('base', 'save_material_panel', save_material_panel);

%%                Initial Conditions - VAR initialization
function initial(hObject, eventdata, handles)

% Control if user saved the data in all panels
save_material_panel = 0;
assignin('base', 'save_material_panel', save_material_panel);
save_temperature_panel = 0;
assignin('base', 'save_temperature_panel', save_temperature_panel);
save_epsilon_panel = 0;
assignin('base', 'save_epsilon_panel', save_epsilon_panel);
save_epsilon_dot_strain_rate_panel = 0;
assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);

% Initial var values for panel material selection
s_text = 0;
assignin('base', 's_text', s_text);
dp_text = 0;
assignin('base', 'dp_text', dp_text);
df_text = 0;
assignin('base', 'df_text', df_text);
fp_text = 0;
assignin('base', 'fp_text', fp_text);
user_defined_input_A = 0;
assignin('base', 'user_defined_input_A', user_defined_input_A);
user_defined_input_B = 0;
assignin('base', 'user_defined_input_B', user_defined_input_B);
user_defined_input_C = 0;
assignin('base', 'user_defined_input_C', user_defined_input_C);
user_defined_input_m = 0;
assignin('base', 'user_defined_input_m', user_defined_input_m);
user_defined_input_n = 0;
assignin('base', 'user_defined_input_n', user_defined_input_n);
user_defined_input_A2 = 0;
assignin('base', 'user_defined_input_A2', user_defined_input_A2);
user_defined_input_C2 = 0;
assignin('base', 'user_defined_input_C2', user_defined_input_C2);
user_defined_input_Q = 0;
assignin('base', 'user_defined_input_Q', user_defined_input_Q);
user_defined_input_v = 0;
assignin('base', 'user_defined_input_v', user_defined_input_v);
user_defined_input_Y0 = 0;
assignin('base', 'user_defined_input_Y0', user_defined_input_Y0);
user_defined_input_d = 0;
assignin('base', 'user_defined_input_d', user_defined_input_d);
user_defined_input_m2 = 0;
assignin('base', 'user_defined_input_m2', user_defined_input_m2);
user_defined_input_H = 0;
assignin('base', 'user_defined_input_H', user_defined_input_H);


% Initial var values for panel temperature
save_temperature_type = 0;
assignin('base', 'save_temperature_type', save_temperature_type)
% Manual ==================================================================
temperature_quantity = 0; % Quantity of temperature for popup menu
assignin('base', 'temperature_quantity', temperature_quantity);
temperature_array = 0; 
assignin('base', 'temperature_array', temperature_array);
temperature_text = 0; % Text box initialization
assignin('base', 'temperature_text', temperature_text);
% Automatic ===============================================================
temperature_automatic_max_input = 0; 
assignin('base', 'temperature_automatic_max_input', temperature_automatic_max_input);
temperature_automatic_min_input = 0; 
assignin('base', 'temperature_automatic_min_input', temperature_automatic_min_input);
temperature_automatic_step_input = 0; 
assignin('base', 'temperature_automatic_step_input', temperature_automatic_step_input);

% Initial var values for epsilon dot zero panel
epsilon_step_input = 0; 
assignin('base', 'epsilon_step_input', epsilon_step_input);
epsilon_min_input = 0; 
assignin('base', 'epsilon_min_input', epsilon_min_input);
epsilon_max_input = 0; 
assignin('base', 'epsilon_max_input', epsilon_max_input);

% Initial var values for epsilon_dot_strain_rate panel
save_epsilon_dot_strain_rate_type = 0;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);
% Manual ==================================================================
epsilon_dot_manual_quantity = 0; % Quantity of logarithmic values for popup menu
assignin('base', 'epsilon_dot_manual_quantity', epsilon_dot_manual_quantity);
epsilon_dot_manual_array = 0; 
assignin('base', 'epsilon_dot_manual_array', epsilon_dot_manual_array);
epsilon_dot_manual_input = 0; % Text box initialization
assignin('base', 'epsilon_dot_manual_input', epsilon_dot_manual_input);
% Automatic ===============================================================
epsilon_dot_step_automatic_input = 0; 
assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);
epsilon_dot_min_automatic_input = 0; 
assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
epsilon_dot_max_automatic_input = 0; 
assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);
strain_rate_automatic_quantity = 0;
assignin('base', 'strain_rate_automatic_quantity', strain_rate_automatic_quantity);

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)

delete(hObject);

%% =================== BEGIN OF PANEL TEMPERATURE =========================
%  ========================================================================

function temperature_automatic_checkbox_Callback(hObject, eventdata, handles)

% Control if the user selected the type of Temperature
save_temperature_type = 1;
assignin('base', 'save_temperature_type', save_temperature_type);

% Refresh the manual fields
temperature_text = 0; 
assignin('base', 'temperature_text', temperature_text);
temperature_array = 0; 
assignin('base', 'temperature_array', temperature_array);
temperature_popup_menu = {''};
set(handles.temperature_popup_menu,'String',temperature_popup_menu);
temperature_quantity = 0; 
assignin('base', 'temperature_quantity', temperature_quantity);

set(handles.temperature_automatic_checkbox, 'Value', 1);
set(handles.temperature_manual_checkbox, 'Value', 0);

%%            temperature_automatic_max_input
function temperature_automatic_max_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
temperature_automatic_max_input = str2double(get(hObject, 'String'));
    if (isnan(temperature_automatic_max_input) || temperature_automatic_max_input <= 0)
        temperature_automatic_max_input = 0;
        assignin('base', 'temperature_automatic_max_input', temperature_automatic_max_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'temperature_automatic_max_input', temperature_automatic_max_input);

function temperature_automatic_max_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%            temperature_automatic_min_input
function temperature_automatic_min_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
temperature_automatic_min_input = str2double(get(hObject, 'String'));
    if (isnan(temperature_automatic_min_input) || temperature_automatic_min_input <= 0)
        temperature_automatic_min_input = 0;
        assignin('base', 'temperature_automatic_min_input', temperature_automatic_min_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'temperature_automatic_min_input', temperature_automatic_min_input);
    
function temperature_automatic_min_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%           temperature_automatic_step_input
function temperature_automatic_step_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
temperature_automatic_step_input = str2double(get(hObject, 'String'));
    if (isnan(temperature_automatic_step_input) || temperature_automatic_step_input <= 0)
        temperature_automatic_step_input = 0;
        assignin('base', 'temperature_automatic_step_input', temperature_automatic_step_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'temperature_automatic_step_input', temperature_automatic_step_input);
function temperature_automatic_step_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%            temperature_manual_checkbox
function temperature_manual_checkbox_Callback(hObject, eventdata, handles)

% Control if the user selected the type of Temperature
save_temperature_type = 2;
assignin('base', 'save_temperature_type', save_temperature_type);

% Refresh the automatic fields
set(handles.temperature_automatic_max_input, 'string', '');
set(handles.temperature_automatic_min_input, 'string', '');
set(handles.temperature_automatic_step_input, 'string', '');
temperature_automatic_step_input = 0; 
assignin('base', 'temperature_automatic_step_input', temperature_automatic_step_input);
temperature_automatic_min_input = 0; 
assignin('base', 'temperature_automatic_min_input', temperature_automatic_min_input);
temperature_automatic_max_input = 0; 
assignin('base', 'temperature_automatic_max_input', temperature_automatic_max_input);

set(handles.temperature_manual_checkbox, 'Value', 1);
set(handles.temperature_automatic_checkbox, 'Value', 0);


%%                    Temperature manual fields
function temperature_text_Callback(hObject, eventdata, handles)

% Reading the textbox fields
temperature_text = str2double(get(hObject, 'String'));
    if (isnan(temperature_text) || temperature_text <= 0)
        temperature_text = 0;
        assignin('base', 'temperature_text', temperature_text);
        set(hObject, 'String','');
        errordlg('Please enter the correct data','Error');
    end
    assignin('base', 'temperature_text', temperature_text);

function temperature_text_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%              temperature_clear_button
function temperature_clear_button_Callback(hObject, eventdata, handles)
% Refresh all fields
save_temperature_type = 0;
assignin('base','save_temperature_type',save_temperature_type);
save_temperature_panel = 0;
assignin('base', 'save_temperature_panel', save_temperature_panel);

% Manual 
temperature_text = 0; 
assignin('base', 'temperature_text', temperature_text);
temperature_array = 0; 
assignin('base', 'temperature_array', temperature_array);
refresh_popup = {''};
set(handles.temperature_popup_menu,'String',refresh_popup);
temperature_quantity = 0; 
assignin('base', 'temperature_quantity', temperature_quantity);
set(handles.temperature_manual_checkbox, 'Value', 0);

% Automatic
set(handles.temperature_automatic_max_input, 'string', '');
set(handles.temperature_automatic_min_input, 'string', '');
set(handles.temperature_automatic_step_input, 'string', '');
temperature_automatic_step_input = 0; 
assignin('base', 'temperature_automatic_step_input', temperature_automatic_step_input);
temperature_automatic_min_input = 0; 
assignin('base', 'temperature_automatic_min_input', temperature_automatic_min_input);
temperature_automatic_max_input = 0; 
assignin('base', 'temperature_automatic_max_input', temperature_automatic_max_input);
set(handles.temperature_automatic_checkbox, 'Value', 0);


%%                  temperature_ADD_button
function temperature_ADD_button_Callback(hObject, eventdata, handles)

temperature_quantity = evalin('base', 'temperature_quantity');  
temperature_array = evalin('base', 'temperature_array');
temperature_text = evalin('base', 'temperature_text');

% prevent to add null values to the popupmenu
if temperature_text == 0 
    return;
end
    
% Test if the temperature value was already added
i_temperature = 1;
while i_temperature <= temperature_quantity
    
    if temperature_array(i_temperature,1) == temperature_text 
        % Warning and interrupt the loop
        % Variable i is used to recognize the error
        errordlg('This value is already used', 'Error');
         % To refresh the temperature textbox
        temperature_text = '';
        set(handles.temperature_text,'String',temperature_text)
        i_temperature = 0;
        break;
    end
    i_temperature = i_temperature + 1;   
end

% If i ~= 0, add the temperature, else do nothing 
if i_temperature ~= 0
    temperature_quantity = temperature_quantity + 1;
    temperature_array(temperature_quantity,1) = temperature_text;
    set(handles.temperature_popup_menu,'String',temperature_array);
    % To refresh the temperature textbox
    temperature_text = '';
    set(handles.temperature_text,'String',temperature_text)
end    

assignin('base', 'temperature_array', temperature_array);
assignin('base', 'temperature_quantity', temperature_quantity);

function temperature_popup_menu_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%               save_temperature_manual_checkbox
function save_temperature_manual_checkbox(hObject, eventdata, handles)
% Verify if the manual values were added
temperature_quantity = evalin('base', 'temperature_quantity'); 

if temperature_quantity == 0
    errordlg('Fullfil the temperature field', 'Error');
else
    msgbox('Clique to close the window','OK')
    refresh_popup = {''};
    set(handles.temperature_popup_menu,'String',refresh_popup); 
    set(handles.temperature_manual_checkbox, 'Value', 0);
    % Control if the user saved the data
    save_temperature_panel = 1;
    assignin('base', 'save_temperature_panel', save_temperature_panel);
end


%%                  save_temperature_automatic_checkbox
function save_temperature_automatic_checkbox(hObject, eventdata, handles)
% Verify if the values were added
temperature_automatic_step_input = evalin('base','temperature_automatic_step_input'); 
temperature_automatic_min_input = evalin('base','temperature_automatic_min_input'); 
temperature_automatic_max_input = evalin('base','temperature_automatic_max_input');

if temperature_automatic_step_input == 0 || temperature_automatic_min_input == 0 || temperature_automatic_max_input == 0
    errordlg('Fullfil all the fields', 'Error');
    set(handles.temperature_automatic_max_input, 'string', '');
    set(handles.temperature_automatic_min_input, 'string', '');
    set(handles.temperature_automatic_step_input, 'string', '');
    temperature_automatic_step_input = 0; 
    assignin('base','temperature_automatic_step_input',temperature_automatic_step_input);
    temperature_automatic_min_input = 0; 
    assignin('base','temperature_automatic_min_input',temperature_automatic_min_input);
    temperature_automatic_max_input = 0; 
    assignin('base','temperature_automatic_max_input',temperature_automatic_max_input);
else
    msgbox('Clique to close the window','OK')
    refresh_temperature_automatic_max_input = '';
    set(handles.temperature_automatic_max_input,'String',refresh_temperature_automatic_max_input);
    refresh_temperature_automatic_min_input = '';
    set(handles.temperature_automatic_min_input,'String',refresh_temperature_automatic_min_input);
    refresh_temperature_automatic_step_input = '';
    set(handles.temperature_automatic_step_input,'String',refresh_temperature_automatic_step_input);
    set(handles.temperature_automatic_checkbox, 'Value', 0);
   
    % Control if the user saved the data
    save_temperature_panel = 1;
    assignin('base', 'save_temperature_panel', save_temperature_panel);
end    

%%                temperature_save_button
function temperature_save_button_Callback(hObject, eventdata, handles)
save_temperature_type = evalin('base', 'save_temperature_type');

switch(save_temperature_type)
    case 1
        save_temperature_automatic_checkbox(hObject, eventdata, handles);
   
    case 2
        save_temperature_manual_checkbox(hObject, eventdata, handles);
    
    otherwise
        errordlg('Choose between Automatic or Manual','Error');
end
 

%% =================== BEGIN OF PANEL EPSILON DOT (STRAIN RATE) ===========
%  ========================================================================

function epsilon_dot_automatic_checkbox_Callback(hObject, eventdata, handles)

% Control if the user selected the type of Strain Rate
save_epsilon_dot_strain_rate_type = 1;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);

% Refresh automatic the manual fields
epsilon_dot_manual_input = 0; 
assignin('base', 'epsilon_dot_manual_input', epsilon_dot_manual_input);
epsilon_dot_manual_array = 0; 
assignin('base', 'epsilon_dot_manual_array', epsilon_dot_manual_array);
refresh_manual_popup = {''};
set(handles.epsilon_dot_manual_popup_menu,'String',refresh_manual_popup);
epsilon_dot_manual_quantity = 0; 
assignin('base', 'epsilon_dot_manual_quantity', epsilon_dot_manual_quantity);

set(handles.epsilon_dot_automatic_checkbox, 'Value', 1);
set(handles.epsilon_dot_manual_checkbox, 'Value', 0);

%%                   epsilon_dot_step_automatic_input
function epsilon_dot_step_automatic_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
epsilon_dot_step_automatic_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_step_automatic_input) || epsilon_dot_step_automatic_input <= 0)
        epsilon_dot_step_automatic_input = 0;
        assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);

function epsilon_dot_step_automatic_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   epsilon_dot_min_automatic_input
function epsilon_dot_min_automatic_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
epsilon_dot_min_automatic_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_min_automatic_input) || epsilon_dot_min_automatic_input <= 0)
        epsilon_dot_min_automatic_input = 0;
        assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
    
function epsilon_dot_min_automatic_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   epsilon_dot_max_automatic_input
function epsilon_dot_max_automatic_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
epsilon_dot_max_automatic_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_max_automatic_input) || epsilon_dot_max_automatic_input <= 0)
        epsilon_dot_max_automatic_input = 0;
        assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);

function epsilon_dot_max_automatic_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                   epsilon_dot_manual_checkbox
function epsilon_dot_manual_checkbox_Callback(hObject, eventdata, handles)

% Control if the user selected the type of Strain Rate
save_epsilon_dot_strain_rate_type = 2;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);

% Refresh automatic the linear fields
set(handles.epsilon_dot_max_automatic_input, 'string', '');
set(handles.epsilon_dot_min_automatic_input, 'string', '');
set(handles.epsilon_dot_step_automatic_input, 'string', '');
epsilon_dot_step_automatic_input = 0; 
assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);
epsilon_dot_min_automatic_input = 0; 
assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
epsilon_dot_max_automatic_input = 0; 
assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);

set(handles.epsilon_dot_manual_checkbox, 'Value', 1);
set(handles.epsilon_dot_automatic_checkbox, 'Value', 0);

%%               epsilon_dot_manual_input
function epsilon_dot_manual_input_Callback(hObject, eventdata, handles)

% Reading the textbox fields
epsilon_dot_manual_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_manual_input) || epsilon_dot_manual_input <= 0)
        epsilon_dot_manual_input = 0;
        assignin('base', 'epsilon_dot_manual_input', epsilon_dot_manual_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_manual_input', epsilon_dot_manual_input);

function epsilon_dot_manual_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%               epsilon_dot_manual_ADD_button
function epsilon_dot_manual_ADD_button_Callback(hObject, eventdata, handles)

epsilon_dot_manual_quantity = evalin('base', 'epsilon_dot_manual_quantity');  
epsilon_dot_manual_array = evalin('base', 'epsilon_dot_manual_array');
epsilon_dot_manual_input = evalin('base', 'epsilon_dot_manual_input');

% prevent to add null values to the popupmenu
if epsilon_dot_manual_input == 0 
    return;
end

% Test if the value was already added
i_logarithmic = 1;
while i_logarithmic <= epsilon_dot_manual_quantity
    
    if epsilon_dot_manual_array(i_logarithmic,1) == epsilon_dot_manual_input 
        % Warning and interrupt the loop
        % Variable i is used to recognize the error
        errordlg('This value is already used', 'Error');
         % To refresh the temperature textbox
        epsilon_dot_manual_input = '';
        set(handles.epsilon_dot_manual_input,'String',epsilon_dot_manual_input)
        i_logarithmic = 0;
        break;
    end
    i_logarithmic = i_logarithmic + 1;   
end

% If i ~= 0, add the value, else do nothing 
if i_logarithmic ~= 0
    epsilon_dot_manual_quantity = epsilon_dot_manual_quantity + 1;
    epsilon_dot_manual_array(epsilon_dot_manual_quantity,1) = epsilon_dot_manual_input;
    set(handles.epsilon_dot_manual_popup_menu,'String',epsilon_dot_manual_array);
    % To refresh the logarithmic textbox
    epsilon_dot_manual_input = '';
    set(handles.epsilon_dot_manual_input,'String',epsilon_dot_manual_input)
end    

assignin('base', 'epsilon_dot_manual_array', epsilon_dot_manual_array);
assignin('base', 'epsilon_dot_manual_quantity', epsilon_dot_manual_quantity);


%%               epsilon_dot_manual_popup_menu
function epsilon_dot_manual_popup_menu_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%               epsilon_dot_clear_button
function epsilon_dot_clear_button_Callback(hObject, eventdata, handles)

% Refresh all fields
save_epsilon_dot_strain_rate_type = 0;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);
save_epsilon_dot_strain_rate_panel = 0;
assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);

% MANUAL
epsilon_dot_manual_input = 0; 
assignin('base', 'epsilon_dot_manual_input', epsilon_dot_manual_input);
epsilon_dot_manual_array = 0; 
assignin('base', 'epsilon_dot_manual_array', epsilon_dot_manual_array);
refresh_manual_popup = {''};
set(handles.epsilon_dot_manual_popup_menu,'String',refresh_manual_popup);
epsilon_dot_manual_quantity = 0; 
assignin('base', 'epsilon_dot_manual_quantity', epsilon_dot_manual_quantity);
set(handles.epsilon_dot_manual_checkbox, 'Value', 0);

% AUTOMATIC
set(handles.epsilon_dot_max_automatic_input, 'string', '');
set(handles.epsilon_dot_min_automatic_input, 'string', '');
set(handles.epsilon_dot_step_automatic_input, 'string', '');
epsilon_dot_step_automatic_input = 0; 
assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);
epsilon_dot_min_automatic_input = 0; 
assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
epsilon_dot_max_automatic_input = 0; 
assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);
set(handles.epsilon_dot_automatic_checkbox, 'Value', 0);


%%               save_epsilon_dot_strain_rate_automatic_checkbox
function save_epsilon_dot_strain_rate_automatic_checkbox(hObject, eventdata, handles);
% Verify if the values were added
epsilon_dot_step_automatic_input = evalin('base', 'epsilon_dot_step_automatic_input'); 
epsilon_dot_min_automatic_input = evalin('base', 'epsilon_dot_min_automatic_input'); 
epsilon_dot_max_automatic_input = evalin('base', 'epsilon_dot_max_automatic_input');

if epsilon_dot_step_automatic_input == 0 || epsilon_dot_min_automatic_input == 0 || epsilon_dot_max_automatic_input == 0
    errordlg('Fullfil all the fields', 'Error');
    set(handles.epsilon_dot_max_automatic_input, 'string', '');
    set(handles.epsilon_dot_min_automatic_input, 'string', '');
    set(handles.epsilon_dot_step_automatic_input, 'string', '');
    epsilon_dot_step_automatic_input = 0; 
    assignin('base', 'epsilon_dot_step_automatic_input', epsilon_dot_step_automatic_input);
    epsilon_dot_min_automatic_input = 0; 
    assignin('base', 'epsilon_dot_min_automatic_input', epsilon_dot_min_automatic_input);
    epsilon_dot_max_automatic_input = 0; 
    assignin('base', 'epsilon_dot_max_automatic_input', epsilon_dot_max_automatic_input);
else
    msgbox('Clique to close the window','OK')
    refresh_epsilon_dot_max_automatic_input = '';
    set(handles.epsilon_dot_max_automatic_input,'String',refresh_epsilon_dot_max_automatic_input);
    refresh_epsilon_dot_min_automatic_input = '';
    set(handles.epsilon_dot_min_automatic_input,'String',refresh_epsilon_dot_min_automatic_input);
    refresh_epsilon_dot_step_automatic_input = '';
    set(handles.epsilon_dot_step_automatic_input,'String',refresh_epsilon_dot_step_automatic_input);
    set(handles.epsilon_dot_automatic_checkbox, 'Value', 0);
   
    % Control if the user saved the data
    save_epsilon_dot_strain_rate_panel = 1;
    assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);
end
     
%%               save_epsilon_dot_strain_rate_manual_checkbox
function save_epsilon_dot_strain_rate_manual_checkbox(hObject, eventdata, handles);

% Verify if the manual values were added
epsilon_dot_manual_quantity = evalin('base', 'epsilon_dot_manual_quantity'); 

if epsilon_dot_manual_quantity == 0
    errordlg('Fullfil the manual field', 'Error');
else
    msgbox('Clique to close the window','OK')
    refresh_manual_popup = {''};
    set(handles.epsilon_dot_manual_popup_menu,'String',refresh_manual_popup); 
    set(handles.epsilon_dot_manual_checkbox, 'Value', 0);
    % Control if the user saved the data
    save_epsilon_dot_strain_rate_panel = 1;
    assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);
end


%%               epsilon_dot_save_button
function epsilon_dot_save_button_Callback(hObject, eventdata, handles)

save_epsilon_dot_strain_rate_type = evalin('base', 'save_epsilon_dot_strain_rate_type');

switch (save_epsilon_dot_strain_rate_type)
    case 1
        save_epsilon_dot_strain_rate_automatic_checkbox(hObject, eventdata, handles);
 
    case 2
        save_epsilon_dot_strain_rate_manual_checkbox(hObject, eventdata, handles);
            
    otherwise
        errordlg('Choose between Automatic or Manual','Error');
end

%% =================== BEGIN OF PANEL EPSILON =============================
%  ========================================================================

%%                    epsilon_step_input
 function epsilon_step_input_Callback(hObject, eventdata, handles)
% Reading the textbox fields
epsilon_step_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_step_input) || epsilon_step_input < 0)
        epsilon_step_input = 0;
        assignin('base', 'epsilon_step_input', epsilon_step_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_step_input', epsilon_step_input);

function epsilon_step_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                    epsilon_min_input
function epsilon_min_input_Callback(hObject, eventdata, handles)

% Reading the textbox fields
epsilon_min_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_min_input) || epsilon_min_input < 0)
        epsilon_min_input = 0;
        assignin('base', 'epsilon_min_input', epsilon_min_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error'); %zero should be possible here
    end
    assignin('base', 'epsilon_min_input', epsilon_min_input);

function epsilon_min_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                    epsilon_max_input
function epsilon_max_input_Callback(hObject, eventdata, handles)

% Reading the textbox fields
epsilon_max_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_max_input) || epsilon_max_input <= 0)
        epsilon_max_input = 0;
        assignin('base', 'epsilon_max_input', epsilon_max_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_max_input', epsilon_max_input);
    
function epsilon_max_input_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%                    epsilon_clear_button
function epsilon_clear_button_Callback(hObject, eventdata, handles)

% Refresh all fields
set(handles.epsilon_max_input, 'string', '');
set(handles.epsilon_min_input, 'string', '');
set(handles.epsilon_step_input, 'string', '');
epsilon_step_input = 0; 
assignin('base', 'epsilon_step_input', epsilon_step_input);
epsilon_min_input = 0; 
assignin('base', 'epsilon_min_input', epsilon_min_input);
epsilon_max_input = 0; 
assignin('base', 'epsilon_max_input', epsilon_max_input);

save_epsilon_panel = 0;
assignin('base', 'save_epsilon_panel', save_epsilon_panel);

%%                    epsilon_save_button
function epsilon_save_button_Callback(hObject, eventdata, handles)

% Verify if the values were added
epsilon_step_input = evalin('base', 'epsilon_step_input'); 
epsilon_min_input = evalin('base', 'epsilon_min_input'); 
epsilon_max_input = evalin('base', 'epsilon_max_input');

if epsilon_min_input < 0 || epsilon_max_input == 0
    errordlg('Fullfil all the fields', 'Error');
    set(handles.epsilon_max_input, 'string', '');
    set(handles.epsilon_min_input, 'string', '');
    set(handles.epsilon_step_input, 'string', '');
    epsilon_step_input = 0; 
    assignin('base', 'epsilon_step_input', epsilon_step_input);
    epsilon_min_input = 0; 
    assignin('base', 'epsilon_min_input', epsilon_min_input);
    epsilon_max_input = 0; 
    assignin('base', 'epsilon_max_input', epsilon_max_input);
else
    msgbox('Clique to close the window','OK')
    refresh_epsilon_max_input = '';
    set(handles.epsilon_max_input,'String',refresh_epsilon_max_input);
    refresh_epsilon_min_input = '';
    set(handles.epsilon_min_input,'String',refresh_epsilon_min_input);
    refresh_epsilon_step_input = '';
    set(handles.epsilon_step_input,'String',refresh_epsilon_step_input);
    % Control if the user saved the data
    save_epsilon_panel = 1;
    assignin('base', 'save_epsilon_panel', save_epsilon_panel);
end

%% =================== BEGIN OF SAVE FILE BUTTON ==========================
%  ========================================================================

function save_file_button_Callback(hObject, eventdata, handles)

% This block creates the .txt file *************************************
% Creates the dialog box
prompt = {'Save as:'};             % open a dialog box for saving the file
dlg_title = 'Save';                % window title
num_lines = 1;                     % text field
defaultans = {''};                 % default file name
PathName = 'output\';              % default path

fid = inputdlg(prompt,dlg_title,num_lines,defaultans);

% Action if the cancel button is pressed
cancel = {};
cancel_string = char(cancel);
fid_string = char(fid);
if strcmp(fid_string,cancel_string)
    return;
end  

% adds the .txt extension and saves the path
 complete_name = strcat(fid, '.txt');              
 complete_name = char(complete_name);             
 exp_name = strcat(PathName,complete_name);
 
% Prevent to save empty name file 
void_name = '.txt';
same_name_entry = '';
if strcmp(complete_name,void_name) 
   msgbox('The file name cannot be empty', 'Warning', 'error');
          return;
end

% Prevent to overwrite files
Allfiles = dir(fullfile('temp','*.txt'));
if ~isempty (Allfiles)
    for k = 1:length(Allfiles) 
        if(strcmp(Allfiles(k).name, complete_name))
            same_name_entry = Allfiles(k).name;
            break;
        end       
    end
end
    
if strcmp(same_name_entry,complete_name)
    msgbox('This file already exists', 'Warning', 'error');
    return;
else
    msgbox('Saved', 'Ok');
    assignin('base', 'exp_name', exp_name);
end   

%%                    Calculate Automatic Temperature Array 
function calculate_automatic_temperature_array(hObject, eventdata, handles)

temperature_automatic_step_input = evalin('base','temperature_automatic_step_input'); 
temperature_automatic_min_input = evalin('base','temperature_automatic_min_input'); 
temperature_automatic_max_input = evalin('base','temperature_automatic_max_input');

%Get the temperature array size
temperature_automatic_quantity = round((temperature_automatic_max_input - temperature_automatic_min_input)...
/ temperature_automatic_step_input)+ 1;


%Append the temperature values
valueOfArrayTemperatureAutomatic = temperature_automatic_min_input:temperature_automatic_step_input:temperature_automatic_max_input;

%Assign the values
temperature_quantity = temperature_automatic_quantity;
temperature_array = transpose(valueOfArrayTemperatureAutomatic);

assignin('base', 'temperature_quantity', temperature_quantity);
assignin('base', 'temperature_array', temperature_array);

%% =================== BEGIN OF CALCULATE BUTTON ==========================
%  ========================================================================

function calculate_button_Callback(hObject, eventdata, handles)

% Check the values of all panels
save_material_panel = evalin('base','save_material_panel');
save_temperature_panel = evalin('base','save_temperature_panel');
save_epsilon_panel = evalin('base','save_epsilon_panel');
save_epsilon_dot_strain_rate_panel = evalin('base','save_epsilon_dot_strain_rate_panel');
save_material_selection = evalin('base','save_material_selection');
save_epsilon_dot_strain_rate_type = evalin('base','save_epsilon_dot_strain_rate_type');

if (save_material_selection < 3 )
% control if all the panels are filled
      if save_material_panel == 0 || save_temperature_panel == 0 || ...
        save_epsilon_panel == 0 || save_epsilon_dot_strain_rate_panel == 0
        errordlg('Please fullfil the all data fields','Error');
        else
        switch(save_epsilon_dot_strain_rate_type)
            case 1
                calculate_strain_rate_automatic(hObject, eventdata, handles);
            case 2
                calculate_strain_rate_manual(hObject, eventdata, handles);
        end  
      end
else
          if save_material_panel == 0 || save_temperature_panel == 0 || ...
            save_epsilon_panel == 0 || save_epsilon_dot_strain_rate_panel == 0
            errordlg('Please fullfil the all data fields','Error');
        else
        switch(save_epsilon_dot_strain_rate_type)
            case 1
                calculate_voce_strain_rate_automatic(hObject, eventdata, handles);
            case 2
                calculate_voce_strain_rate_manual(hObject, eventdata, handles);
        end
          end
end
        
%%       calculate_voce_strain_rate_automatic
function calculate_voce_strain_rate_automatic(hObject, eventdata, handles)
A2 = evalin('base','A2');
C2 = evalin('base','C2');
Q = evalin('base','Q');
v = evalin('base','v');
Y0 = evalin('base','Y0');
d = evalin('base','d');
m2 = evalin('base','m2');
H = evalin('base','H');
% Epsilon ===============================================
epsilon_step_input = evalin('base','epsilon_step_input');
epsilon_min_input = evalin('base','epsilon_min_input');
epsilon_max_input = evalin('base','epsilon_max_input');
% Epsilon Dot ===========================================
epsilon_dot_step_automatic_input = evalin('base','epsilon_dot_step_automatic_input');
epsilon_dot_min_automatic_input = evalin('base','epsilon_dot_min_automatic_input');
epsilon_dot_max_automatic_input = evalin('base','epsilon_dot_max_automatic_input');
% Temperature ===========================================
save_temperature_type = evalin('base','save_teperature_type');

switch(save_temperature_type)
    case 1 
        calculate_automatic_temperature_array(hObject, eventdata, handles);
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
    case 2
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
end
 
% txt file ==============================================
exp_name = evalin('base','exp_name');

% Constants
% JC Fixed Parameters for all 
sigma = 0;              % Flow stress
T_0 = 20;               % Reference temperature
T_m = 1500;             % Melting temperature
eps_dot_0 = 0.002;      % Reference plastic strain

% file open
fid = fopen(exp_name, 'wt+' );

% Calculate the quantity of epsilons and epsilons_dot
if epsilon_step_input > 0
    epsilon_quantity = round((epsilon_max_input-epsilon_min_input)/epsilon_step_input)+1;
else
    epsilon_quantity = 1;
end
strain_rate_automatic_quantity = log10(epsilon_dot_max_automatic_input / epsilon_dot_min_automatic_input) +1;
%strain_rate_automatic_quantity = round((epsilon_dot_max_automatic_input - epsilon_dot_min_automatic_input)/ epsilon_dot_step_automatic_input) +1;
assignin('base', 'strain_rate_automatic_quantity', strain_rate_automatic_quantity);

% First and second line of the file
%  fprintf(fid,'Flow STRESS \n');
%  fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
a = 1; % counter for the plot matrix
epsilon = epsilon_min_input; % gets the initial value from epsilon
strain_rate_automatic = epsilon_dot_min_automatic_input;

% Write the Sigmas in the file
while i <= temperature_quantity 
            while j <= strain_rate_automatic_quantity
                while k <= epsilon_quantity 
                        sigma = ((A2+H*epsilon+Q*(1-exp(-v*epsilon))-(A2-Y0)/(1+epsilon)^d)*(1+C2*log(strain_rate_automatic/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m2));
                  % if(epsilon >= 1)                        
                    %    sigma = (A+B)*(1+C*log(strain_rate_automatic/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                   %end                
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon strain_rate_automatic temperature_array(i,1)]);            
                        matAuxPlot(a,1) = sigma;
                        matAuxPlot(a,2) = epsilon;
                        matAuxPlot(a,3) = strain_rate_automatic;
                        matAuxPlot(a,4) = temperature_array(i,1);
                        a = a + 1;
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                       
                        
                end
                    if j < strain_rate_automatic_quantity
                        lastStrainRateValue = strain_rate_automatic * epsilon_dot_step_automatic_input;
                        lastButOneStrainRateValue = strain_rate_automatic;
                        %numberOfExtraPoints = epsilon_dot_step_automatic_input ^(j-1);
                        numberOfExtraPoints = 100;
                        delta = (lastStrainRateValue - lastButOneStrainRateValue)/numberOfExtraPoints;
                        for w = 1:numberOfExtraPoints
                            strain_rate_automatic_plot(w) = lastButOneStrainRateValue + delta * w;                           
                                while k <= epsilon_quantity 
                                    sigma = ((A2+Q*(1-exp(-v*epsilon))-(A2-Y0)/(1+epsilon)^d)*(1+C2*log(strain_rate_automatic_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m2));
                                        %if(epsilon >= 1)                        
                                        %    sigma = (A+B)*(1+C*log(strain_rate_automatic_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                                        %end                        
                                            matAuxPlot(a,1) = sigma;
                                            matAuxPlot(a,2) = epsilon;
                                            matAuxPlot(a,3) = strain_rate_automatic_plot(w);
                                            matAuxPlot(a,4) = temperature_array(i,1);
                                            a = a + 1;
                                            k = k + 1;
                                            epsilon = epsilon + epsilon_step_input;
                                end
                                    k = 1;
                                    epsilon = epsilon_min_input;
                        end
                    end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
                    strain_rate_automatic = strain_rate_automatic * epsilon_dot_step_automatic_input;

            end
                k = 1;
                j = 1;
                epsilon = epsilon_min_input;
                strain_rate_automatic = epsilon_dot_min_automatic_input;
                i = i + 1;
                assignin('base', 'matAuxPlot', matAuxPlot);
end
fclose(fid);
msgbox('Saved', 'Ok');

%%                 calculate_voce_strain_rate_manual
function calculate_voce_strain_rate_manual(hObject, eventdata, handles);
% Load the vars from Workspace
% JC Parameters
A2 = evalin('base','A2');
C2 = evalin('base','C2');
Q = evalin('base','Q');
v = evalin('base','v');
Y0 = evalin('base','Y0');
d = evalin('base','d');
m2 = evalin('base','m2');
H = evalin('base','H');
% Epsilon
epsilon_step_input = evalin('base','epsilon_step_input');
epsilon_min_input = evalin('base','epsilon_min_input');
epsilon_max_input = evalin('base','epsilon_max_input');
% Epsilon Dot
epsilon_dot_manual_quantity = evalin('base','epsilon_dot_manual_quantity');
epsilon_dot_manual_array = evalin('base','epsilon_dot_manual_array');
% Temperature
save_temperature_type = evalin('base','save_teperature_type');
switch(save_temperature_type)
    case 1 
        calculate_automatic_temperature_array(hObject, eventdata, handles);
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
    case 2
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
end

% txt file
exp_name = evalin('base','exp_name');

% Constants
% JC Fixed Parameters for all 
sigma = 0;              % Flow stress
T_0 = 20;               % Reference temperature
T_m = 1500;             % Melting temperature
eps_dot_0 = 0.002;       % Reference plastic strain

% File open
fid = fopen(exp_name, 'wt+' );

% Calculate the quantity of epsilons
if epsilon_step_input > 0
    epsilon_quantity = ((epsilon_max_input-epsilon_min_input)/epsilon_step_input)+1;
else
    epsilon_quantity = 1;
end

% First and second line of the file
%  fprintf(fid,'Flow STRESS \n');
%  fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
a = 1; % counter for the plot matrix
epsilon = epsilon_min_input; % gets the initial value from epsilon

% Write the sigmas in the file
while i <= temperature_quantity 
            while j <= epsilon_dot_manual_quantity
                while k <= epsilon_quantity 
                    sigma = ((A2+H*epsilon+Q*(1-exp(-v*epsilon))-(A2-Y0)/(1+epsilon)^d)*(1+C2*log(epsilon_dot_manual_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m2));
                  % if(epsilon >= 1)                        
                  %     sigma = (A+B)*(1+C*log(epsilon_dot_manual_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                  % end
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon epsilon_dot_manual_array(j,1) temperature_array(i,1)]); 
                        matAuxPlot(a,1) = sigma;
                        matAuxPlot(a,2) = epsilon;
                        matAuxPlot(a,3) = epsilon_dot_manual_array(j,1);
                        matAuxPlot(a,4) = temperature_array(i,1);
                        a = a + 1;
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                end
                    if j < epsilon_dot_manual_quantity
                            
                            lastStrainRateValue = epsilon_dot_manual_array(j,1);
                            lastButOneStrainRateValue = epsilon_dot_manual_array(j+1,1);
                            numberOfExtraPoints = 100;
                            
                            delta = (lastButOneStrainRateValue - lastStrainRateValue)/numberOfExtraPoints;
                            for w = 1:numberOfExtraPoints
                                    strain_rate_manual_plot(w) = lastStrainRateValue + delta * w;
                                        while k <= epsilon_quantity
                                                sigma = ((A2+H*epsilon+Q*(1-exp(-v*epsilon))-(A2-Y0)/(1+epsilon)^d)*(1+C2*log(strain_rate_manual_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m2));
                                                
                                            %if(epsilon >= 1)                        
                                            %    sigma = (A+B)*(1+C*log(strain_rate_manual_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                                            %end  
                                            matAuxPlot(a,1) = sigma;
                                            matAuxPlot(a,2) = epsilon;
                                            matAuxPlot(a,3) = strain_rate_manual_plot(w);
                                            matAuxPlot(a,4) = temperature_array(i,1);
                                            a = a + 1;
                                            k = k + 1;
                                            epsilon = epsilon + epsilon_step_input;
                                        end
                                        k = 1;
                                        epsilon = epsilon_min_input;
                            end
                    end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
            end
                k = 1;
                j = 1;
                epsilon = epsilon_min_input;
                i = i + 1;
                assignin('base', 'matAuxPlot', matAuxPlot);
end
fclose(fid);
msgbox('Saved', 'Ok');

%%                  calculate_epsilon_dot_strain_rate_automatic     
function calculate_strain_rate_automatic(hObject, eventdata, handles);

% Load the vars from Workspace
% JC Parameters
A = evalin('base','A');
B = evalin('base','B');
n = evalin('base','n');
C = evalin('base','C');
m = evalin('base','m');
% Epsilon
epsilon_step_input = evalin('base','epsilon_step_input');
epsilon_min_input = evalin('base','epsilon_min_input');
epsilon_max_input = evalin('base','epsilon_max_input');
% Epsilon Dot
epsilon_dot_step_automatic_input = evalin('base','epsilon_dot_step_automatic_input');
epsilon_dot_min_automatic_input = evalin('base','epsilon_dot_min_automatic_input');
epsilon_dot_max_automatic_input = evalin('base','epsilon_dot_max_automatic_input');
% Temperature
save_temperature_type = evalin('base','save_temperature_type');

switch(save_temperature_type)
    case 1 
        calculate_automatic_temperature_array(hObject, eventdata, handles);
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
    case 2
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
end

% txt file
exp_name = evalin('base','exp_name');

% Constants
% JC Fixed Parameters for all 
sigma = 0;              % Flow stress
T_0 = 20;               % Reference temperature
T_m = 1500;             % Melting temperature
eps_dot_0 = 0.002;      % Reference plastic strain

% file open
fid = fopen(exp_name, 'wt+' );

% Calculate the quantity of epsilons and epsilons_dot
if epsilon_step_input > 0
    epsilon_quantity = round((epsilon_max_input-epsilon_min_input)/epsilon_step_input)+1;
else
    epsilon_quantity = 1;
end
strain_rate_automatic_quantity = log10(epsilon_dot_max_automatic_input / epsilon_dot_min_automatic_input) +1;
%strain_rate_automatic_quantity = round((epsilon_dot_max_automatic_input - epsilon_dot_min_automatic_input)/ epsilon_dot_step_automatic_input) +1;
assignin('base', 'strain_rate_automatic_quantity', strain_rate_automatic_quantity);

% First and second line of the file
%  fprintf(fid,'Flow STRESS \n');
%  fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
a = 1; % counter for the plot matrix
epsilon = epsilon_min_input; % gets the initial value from epsilon
strain_rate_automatic = epsilon_dot_min_automatic_input;

% Write the Sigmas in the file
while i <= temperature_quantity 
            while j <= strain_rate_automatic_quantity
                while k <= epsilon_quantity 
                        sigma = (A+B*epsilon^n)*(1+C*log(strain_rate_automatic/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   if(epsilon >= 1)                        
                        sigma = (A+B)*(1+C*log(strain_rate_automatic/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                   end                
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon strain_rate_automatic temperature_array(i,1)]);            
                        matAuxPlot(a,1) = sigma;
                        matAuxPlot(a,2) = epsilon;
                        matAuxPlot(a,3) = strain_rate_automatic;
                        matAuxPlot(a,4) = temperature_array(i,1);
                        a = a + 1;
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                       
                        
                end
                    if j < strain_rate_automatic_quantity
                        lastStrainRateValue = strain_rate_automatic * epsilon_dot_step_automatic_input;
                        lastButOneStrainRateValue = strain_rate_automatic;
                        %numberOfExtraPoints = epsilon_dot_step_automatic_input ^(j-1);
                        numberOfExtraPoints = 100;
                        delta = (lastStrainRateValue - lastButOneStrainRateValue)/numberOfExtraPoints;
                        for w = 1:numberOfExtraPoints
                            strain_rate_automatic_plot(w) = lastButOneStrainRateValue + delta * w;                           
                                while k <= epsilon_quantity 
                                    sigma = (A+B*epsilon^n)*(1+C*log(strain_rate_automatic_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                                        if(epsilon >= 1)                        
                                            sigma = (A+B)*(1+C*log(strain_rate_automatic_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                                        end                        
                                            matAuxPlot(a,1) = sigma;
                                            matAuxPlot(a,2) = epsilon;
                                            matAuxPlot(a,3) = strain_rate_automatic_plot(w);
                                            matAuxPlot(a,4) = temperature_array(i,1);
                                            a = a + 1;
                                            k = k + 1;
                                            epsilon = epsilon + epsilon_step_input;
                                end
                                    k = 1;
                                    epsilon = epsilon_min_input;
                        end
                    end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
                    strain_rate_automatic = strain_rate_automatic * epsilon_dot_step_automatic_input;

            end
                k = 1;
                j = 1;
                epsilon = epsilon_min_input;
                strain_rate_automatic = epsilon_dot_min_automatic_input;
                i = i + 1;
                assignin('base', 'matAuxPlot', matAuxPlot);
end
fclose(fid);
msgbox('Saved', 'Ok');

%%              calculate_strain_rate_manual
function calculate_strain_rate_manual(hObject, eventdata, handles);

% Load the vars from Workspace
% JC Parameters
A = evalin('base','A');
B = evalin('base','B');
n = evalin('base','n');
C = evalin('base','C');
m = evalin('base','m');
% Epsilon
epsilon_step_input = evalin('base','epsilon_step_input');
epsilon_min_input = evalin('base','epsilon_min_input');
epsilon_max_input = evalin('base','epsilon_max_input');
% Epsilon Dot
epsilon_dot_manual_quantity = evalin('base','epsilon_dot_manual_quantity');
epsilon_dot_manual_array = evalin('base','epsilon_dot_manual_array');
% Temperature
save_temperature_type = evalin('base','save_teperature_type');
switch(save_temperature_type)
    case 1 
        calculate_automatic_temperature_array(hObject, eventdata, handles);
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
    case 2
        temperature_quantity = evalin('base','temperature_quantity');
        temperature_array = evalin('base','temperature_array');
end

% txt file
exp_name = evalin('base','exp_name');

% Constants
% JC Fixed Parameters for all 
sigma = 0;              % Flow stress
T_0 = 20;               % Reference temperature
T_m = 1500;             % Melting temperature
eps_dot_0 = 0.002;       % Reference plastic strain

% File open
fid = fopen(exp_name, 'wt+' );

% Calculate the quantity of epsilons
if epsilon_step_input > 0
    epsilon_quantity = ((epsilon_max_input-epsilon_min_input)/epsilon_step_input)+1;
else
    epsilon_quantity = 1;
end

% First and second line of the file
%  fprintf(fid,'Flow STRESS \n');
%  fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
a = 1; % counter for the plot matrix
epsilon = epsilon_min_input; % gets the initial value from epsilon

% Write the sigmas in the file
while i <= temperature_quantity 
            while j <= epsilon_dot_manual_quantity
                while k <= epsilon_quantity 
                    sigma = (A+B*epsilon^n)*(1+C*log(epsilon_dot_manual_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   if(epsilon >= 1)                        
                       sigma = (A+B)*(1+C*log(epsilon_dot_manual_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   end
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon epsilon_dot_manual_array(j,1) temperature_array(i,1)]); 
                        matAuxPlot(a,1) = sigma;
                        matAuxPlot(a,2) = epsilon;
                        matAuxPlot(a,3) = epsilon_dot_manual_array(j,1);
                        matAuxPlot(a,4) = temperature_array(i,1);
                        a = a + 1;
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                end
                    if j < epsilon_dot_manual_quantity
                            
                            lastStrainRateValue = epsilon_dot_manual_array(j,1);
                            lastButOneStrainRateValue = epsilon_dot_manual_array(j+1,1);
                            numberOfExtraPoints = 100;
                            
                            delta = (lastButOneStrainRateValue - lastStrainRateValue)/numberOfExtraPoints;
                            for w = 1:numberOfExtraPoints
                                    strain_rate_manual_plot(w) = lastStrainRateValue + delta * w;
                                        while k <= epsilon_quantity
                                                sigma = (A+B*epsilon^n)*(1+C*log(strain_rate_manual_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                                            if(epsilon >= 1)                        
                                                sigma = (A+B)*(1+C*log(strain_rate_manual_plot(w)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                                            end  
                                            matAuxPlot(a,1) = sigma;
                                            matAuxPlot(a,2) = epsilon;
                                            matAuxPlot(a,3) = strain_rate_manual_plot(w);
                                            matAuxPlot(a,4) = temperature_array(i,1);
                                            a = a + 1;
                                            k = k + 1;
                                            epsilon = epsilon + epsilon_step_input;
                                        end
                                        k = 1;
                                        epsilon = epsilon_min_input;
                            end
                    end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
            end
                k = 1;
                j = 1;
                epsilon = epsilon_min_input;
                i = i + 1;
                assignin('base', 'matAuxPlot', matAuxPlot);
end
fclose(fid);
msgbox('Saved', 'Ok');

%% =======================BEGIN OF PLOT BUTTON =======================
%  ========================================================================

function plot_button_Callback(hObject, eventdata, handles)

temperature_quantity = evalin('base','temperature_quantity');
strain_rate_automatic_quantity = evalin('base','strain_rate_automatic_quantity');
epsilon_dot_manual_quantity = evalin('base','epsilon_dot_manual_quantity');
temperature_array = evalin('base','temperature_array');
epsilon_dot_manual_array = evalin('base','epsilon_dot_manual_array');
matAuxPlot = evalin('base','matAuxPlot');

%It should be setted according to linear or log scales
save_epsilon_dot_strain_rate_type = evalin('base', 'save_epsilon_dot_strain_rate_type');
switch (save_epsilon_dot_strain_rate_type)
    case 1
        numEpsilon = size(matAuxPlot,1)/(temperature_quantity*(strain_rate_automatic_quantity+((99)*(strain_rate_automatic_quantity-1))));
    case 2
        numEpsilon = size(matAuxPlot,1)/(temperature_quantity*(epsilon_dot_manual_quantity+((99)*(epsilon_dot_manual_quantity-1))));
                
end

figure;

for i=1:temperature_quantity
    subplot(1,temperature_quantity,i)
    hold on;
    for j=1:numEpsilon
        plot(matAuxPlot(j:numEpsilon:end/temperature_quantity,3),matAuxPlot(j:numEpsilon:end/temperature_quantity,1))
        xlabel('Strain Rate');
        ylabel('Sigma');
        dataLegend = num2str(matAuxPlot(j,2));
        leg{1,j} = dataLegend; 
    end
    if (numEpsilon > 6)
        legend(leg,'Location','northwestoutside','Orientation','vertical','FontSize',12,'TextColor','black')
        temp = int2str(temperature_array(i));
        title(strcat(' Temperature =','',temp,' �C'))
  
    else
        legend(leg,'Location','northwest','Orientation','vertical','FontSize',12,'TextColor','black')
        temp = int2str(temperature_array(i));
        title(strcat(' Temperature =','',temp,' �C'))
    end
end

% refresh the workpspace for a new file
evalin( 'base', 'clearvars *' ) 
initial(hObject, eventdata, handles) 
