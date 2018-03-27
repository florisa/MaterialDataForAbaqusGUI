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

% Last Modified by GUIDE v2.5 20-Mar-2018 17:16:21

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
I = imread([pwd '\WZL_ABAQUS_no_logo.jpg']);
handles = guihandles;
handles.logo = newplot;
image(I);
axis off;

%%                        Material_Abaqus OutputFcn
% --- Outputs from this function are returned to the command line.
function varargout = Material_Abaqus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% ======================= BEGIN OF PANEL MATERIAL SELECTION ==============
%  ========================================================================

%%                       material_grade_checkbox
% --- Executes on button press in material_grade_checkbox.
function material_grade_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to material_grade_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of material_grade_checkbox
save_material_selection = 1;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.pure_ferrite_checkbox, 'Value', 0);
set(handles.pure_pearlite_checkbox, 'Value', 0);
set(handles.material_grade_checkbox, 'Value', 1);

%%                        Material_Grade_popup
% --- Executes on selection change in material_grade_popup.
function material_grade_popup_Callback(hObject, eventdata, handles)
% hObject    handle to material_grade_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns material_grade_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from material_grade_popup

% Reading the popup menu
% If the user don't choose any material, the default is 45CG
material_choice = get(hObject,'Value');
assignin('base', 'material_choice', material_choice);


% --- Executes during object creation, after setting all properties.
function material_grade_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to material_grade_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                Pure_Ferrite_Checkbox
% --- Executes on button press in pure_ferrite_checkbox.
function pure_ferrite_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to pure_ferrite_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pure_ferrite_checkbox

save_material_selection = 2;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.pure_ferrite_checkbox, 'Value', 1);
set(handles.pure_pearlite_checkbox, 'Value', 0);
set(handles.material_grade_checkbox, 'Value', 0);

%%                    S_text_box
function s_text_Callback(hObject, eventdata, handles)
% hObject    handle to s_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of s_text as text
%        str2double(get(hObject,'String')) returns contents of s_text as a double

s_text = str2double(get(hObject, 'String'));
if (isnan(s_text) || s_text <= 0)
    s_text = 0;
    assignin('base', 's_text', s_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 's_text', s_text);

% --- Executes during object creation, after setting all properties.
function s_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to s_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%                    Pure_Pearlite_Checkbox
% --- Executes on button press in pure_pearlite_checkbox.
function pure_pearlite_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to pure_pearlite_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pure_pearlite_checkbox

save_material_selection = 3;
assignin('base', 'save_material_selection', save_material_selection);

set(handles.pure_ferrite_checkbox, 'Value', 0);
set(handles.pure_pearlite_checkbox, 'Value', 1);
set(handles.material_grade_checkbox, 'Value', 0);

%%                      Dp_text_box
function dp_text_Callback(hObject, eventdata, handles)
% hObject    handle to dp_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dp_text as text
%        str2double(get(hObject,'String')) returns contents of dp_text as a double

dp_text = str2double(get(hObject, 'String'));
if (isnan(dp_text) || dp_text <= 0)
    dp_text = 0;
    assignin('base', 'dp_text', dp_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');   
end
assignin('base', 'dp_text', dp_text);

% --- Executes during object creation, after setting all properties.
function dp_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dp_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%%                   Df_text_box
function df_text_Callback(hObject, eventdata, handles)
% hObject    handle to df_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of df_text as text
%        str2double(get(hObject,'String')) returns contents of df_text as a double

df_text = str2double(get(hObject, 'String'));
if (isnan(df_text) || df_text <= 0)
    df_text = 0;
    assignin('base', 'df_text', df_text);
    set(hObject, 'String','');
    errordlg('Please enter the correct data','Error');    
end
assignin('base', 'df_text', df_text);

% --- Executes during object creation, after setting all properties.
function df_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to df_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%%             save_pure_ferrite_checkbox

function save_pure_ferrite_checkbox(hObject, eventdata, handles)

% Verify if the text values were added
df_text = evalin('base', 'df_text'); 
if df_text == 0
  errordlg('Fullfil all the fields', 'Error');
else
   msgbox('Clique to close the window','OK') 
   % Refresh all the other options
        set(handles.df_text, 'string', '');
        set(handles.dp_text, 'string', '');
        set(handles.s_text, 'string', '');
        s_text = 0;
        assignin('base', 's_text', s_text);
        dp_text = 0;
        assignin('base', 'dp_text', dp_text);
        set(handles.pure_ferrite_checkbox, 'Value', 0);
        set(handles.pure_pearlite_checkbox, 'Value', 0);
        set(handles.material_grade_checkbox, 'Value', 0);
        set(handles.material_grade_popup,'Value', 1);
        material_choice = 1; 
        assignin('base', 'material_choice',material_choice);
end    

% Control if the user saved the data
save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);
  
% JC  Fixed Parameters
B_pure_ferrite = 405;
n_pure_ferrite = 0.15;
C_pure_ferrite = 0.037;
m_pure_ferrite = 0.900;

B = B_pure_ferrite;
assignin('base', 'B',B);
n = n_pure_ferrite;
assignin('base', 'n',n);
C = C_pure_ferrite;
assignin('base', 'C',C);
m = m_pure_ferrite;
assignin('base', 'm',m);

% Calculating A parameter
df_text = evalin('base', 'df_text'); % µm

% Unit Convertion
% µm to mm ------- 0.001×l[µm]=l[mm]
df_mm = 0.001 * df_text;

% Hall-Petch Relation
% Constants used in the equations
Af_0 = 28;
Af_d = 18;

% Equation for Af
Af = Af_0 + Af_d/nthroot(df_mm,2);

% Equation for Ac
%Ac = Af + fp_percent *(Ap - Af);
A_pure_ferrite = Af;
A = A_pure_ferrite;
assignin('base', 'A', A);

%%             save_pure_pearlite_checkbox

function save_pure_pearlite_checkbox(hObject, eventdata, handles)

% Verify if the text values were added
dp_text = evalin('base', 'dp_text'); 
s_text = evalin('base', 's_text'); 

if dp_text == 0 || s_text == 0
  errordlg('Fullfil all the fields', 'Error');
else
   msgbox('Clique to close the window','OK') 
   % Refresh all the other options
        set(handles.df_text, 'string', '');
        set(handles.dp_text, 'string', '');
        set(handles.s_text, 'string', '');
        df_text = 0;
        assignin('base', 'df_text', df_text);
        set(handles.pure_ferrite_checkbox, 'Value', 0);
        set(handles.pure_pearlite_checkbox, 'Value', 0);
        set(handles.material_grade_checkbox, 'Value', 0);
        set(handles.material_grade_popup,'Value', 1);
        material_choice = 1; 
        assignin('base', 'material_choice',material_choice);
end    

% Control if the user saved the data
save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);

% JC Fixed Parameters for Pure Ferrite
B_pure_pearlite = 432;
n_pure_pearlite = 0.25;
C_pure_pearlite = 0.037;
m_pure_pearlite = 0.950;

B = B_pure_pearlite;
assignin('base', 'B',B);
n = n_pure_pearlite;
assignin('base', 'n',n);
C = C_pure_pearlite;
assignin('base', 'C',C);
m = m_pure_pearlite;
assignin('base', 'm',m);

% Calculating A parameter
dp_text = evalin('base', 'dp_text'); % µm
s_text = evalin('base', 's_text');   % µm

% Unit Convertion
% µm to mm ------- 0.001×l[µm]= l[mm]
dp_mm = 0.001 * dp_text;

% nm to µm ------  0.001×1[nm]= l[µm]
s_um = 0.001 * s_text;

% Convert to percentual
fp_percent = 0.01 * 100;

% Hall-Petch Relation
% Constants used in the equations
Ap_0 = 576;
Ap_d = 18;
Ap_s = 36; 

% Equation for Af
Ap = Ap_0 + Ap_d/nthroot(dp_mm,2) + (Ap_s/s_um);

% Equation for Ac
Ac = fp_percent *(Ap);
A_pure_pearlite = Ac;
A = A_pure_pearlite;
assignin('base', 'A', A);

%%             save_material_grade_checkbox

function save_material_grade_checkbox(hObject, eventdata, handles)

material_choice = evalin('base', 'material_choice');

% Control if the user saved the data
save_material_panel = 1;
assignin('base', 'save_material_panel', save_material_panel);

% Refresh all the other options
set(handles.df_text, 'string', '');
set(handles.dp_text, 'string', '');
set(handles.s_text, 'string', '');
s_text = 0;
assignin('base', 's_text', s_text);
dp_text = 0;
assignin('base', 'dp_text', dp_text);
df_text = 0;
assignin('base', 'df_text', df_text);
set(handles.pure_ferrite_checkbox, 'Value', 0);
set(handles.pure_pearlite_checkbox, 'Value', 0);
set(handles.material_grade_checkbox, 'Value', 0);
set(handles.material_grade_popup,'Value', 1);

% Msg Box for the user
msgbox('Clique to close the window','OK') 

% JC parameters constants
switch(material_choice)
    
    case 1 % 45CG 
        A_45CG = 644;
        B_45CG = 428;
        n_45CG = 0.24;
        C_45CG = 0.037;
        m_45CG = 0.949;
        % Set to Workspace
        A = A_45CG;
        assignin('base', 'A', A);
        B = B_45CG;
        assignin('base', 'B',B);
        n = n_45CG;
        assignin('base', 'n',n);
        C = C_45CG;
        assignin('base', 'C',C);
        m = m_45CG;
        assignin('base', 'm',m);
        
    case 2 % 45R 
        A_45R = 515;
        B_45R = 421;
        n_45R = 0.21;
        C_45R = 0.037;
        m_45R = 0.944;
        % Set to Workspace
        A = A_45R;
        assignin('base', 'A', A);
        B = B_45R;
        assignin('base', 'B',B);
        n = n_45R;
        assignin('base', 'n',n);
        C = C_45R;
        assignin('base', 'C',C);
        m = m_45R;
        assignin('base', 'm',m);
        
        
    case 3 % 45WB
        A_45WB = 474;
        B_45WB = 421;
        n_45WB = 0.21;
        C_45WB = 0.037;
        m_45WB = 0.944;
        % Set to Workspace
        A = A_45WB;
        assignin('base', 'A', A);
        B = B_45WB;
        assignin('base', 'B',B);
        n = n_45WB;
        assignin('base', 'n',n);
        C = C_45WB;
        assignin('base', 'C',C);
        m = m_45WB;
        assignin('base', 'm',m);
        
       
    case 4 % 45GP
        A_45GP = 397;
        B_45GP = 418;
        n_45GP = 0.20;
        C_45GP = 0.037;
        m_45GP = 0.943;
        % Set to Workspace
        A = A_45GP;
        assignin('base', 'A', A);
        B = B_45GP;
        assignin('base', 'B',B);
        n = n_45GP;
        assignin('base', 'n',n);
        C = C_45GP;
        assignin('base', 'C',C);
        m = m_45GP;
        assignin('base', 'm',m);
     
end

%%                       Save_Material_button
% --- Executes on button press in save_material_selection.
function save_material_selection_Callback(hObject, eventdata, handles)
% hObject    handle to save_material_selection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

save_material_selection = evalin('base', 'save_material_selection');

   switch(save_material_selection)
        case 1
            save_material_grade_checkbox(hObject, eventdata, handles);
        case 2
            save_pure_ferrite_checkbox(hObject, eventdata, handles);
        case 3
            save_pure_pearlite_checkbox(hObject, eventdata, handles);
       otherwise
            errordlg('Please enter the material input data','Error');
   end

%%                  Clear_Material_Selection_button
% --- Executes on button press in refresh_fields_button.
function refresh_fields_button_Callback(hObject, eventdata, handles)
% hObject    handle to refresh_fields_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of refresh_fields_button

% Refresh all fields
set(handles.df_text, 'string', '');
set(handles.dp_text, 'string', '');
set(handles.s_text, 'string', '');
s_text = 0;
assignin('base', 's_text', s_text);
dp_text = 0;
assignin('base', 'dp_text', dp_text);
df_text = 0;
assignin('base', 'df_text', df_text);
set(handles.pure_ferrite_checkbox, 'Value', 0);
set(handles.pure_pearlite_checkbox, 'Value', 0);
set(handles.material_grade_checkbox, 'Value', 0);
set(handles.material_grade_popup,'Value', 1);
material_choice = 1; 
assignin('base', 'material_choice',material_choice);
save_material_selection = 0;
assignin('base','save_material_selection',save_material_selection);
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
save_material_selection = 0;
assignin('base','save_material_selection',save_material_selection);
material_choice = 1; % Default is 45CG popup menu
assignin('base', 'material_choice',material_choice);
s_text = 0;
assignin('base', 's_text', s_text);
dp_text = 0;
assignin('base', 'dp_text', dp_text);
df_text = 0;
assignin('base', 'df_text', df_text);

% Initial var values for panel temperature
temperature_quantity = 0; % Quantity of temperature for popup menu
assignin('base', 'temperature_quantity', temperature_quantity);
temperature_array = 0; 
assignin('base', 'temperature_array', temperature_array);
temperature_text = 0; % Text box initialization
assignin('base', 'temperature_text', temperature_text);

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
% LOGARITHMIC
epsilon_dot_logarithmic_quantity = 0; % Quantity of logarithmic values for popup menu
assignin('base', 'epsilon_dot_logarithmic_quantity', epsilon_dot_logarithmic_quantity);
epsilon_dot_logarithmic_array = 0; 
assignin('base', 'epsilon_dot_logarithmic_array', epsilon_dot_logarithmic_array);
epsilon_dot_logarithmic_input = 0; % Text box initialization
assignin('base', 'epsilon_dot_logarithmic_input', epsilon_dot_logarithmic_input);

% LINEAR
epsilon_dot_step_linear_input = 0; 
assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);
epsilon_dot_min_linear_input = 0; 
assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
epsilon_dot_max_linear_input = 0; 
assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);
strain_rate_linear_quantity = 0;
assignin('base', 'strain_rate_linear_quantity', strain_rate_linear_quantity);

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

%% =================== BEGIN OF PANEL TEMPERATURE =========================
%  ========================================================================

%%                    Temperature
function temperature_text_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of temperature_text as text
%        str2double(get(hObject,'String')) returns contents of temperature_text as a double

% Reading the textbox fields
temperature_text = str2double(get(hObject, 'String'));
    if (isnan(temperature_text) || temperature_text <= 0)
        temperature_text = 0;
        assignin('base', 'temperature_text', temperature_text);
        set(hObject, 'String','');
        errordlg('Please enter the correct data','Error');
    end
    assignin('base', 'temperature_text', temperature_text);

% --- Executes during object creation, after setting all properties.
function temperature_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temperature_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in temperature_clear_button.
function temperature_clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of temperature_clear_button

% Refresh all fields
temperature_text = 0; 
assignin('base', 'temperature_text', temperature_text);

temperature_array = 0; 
assignin('base', 'temperature_array', temperature_array);

refresh_popup = {''};
set(handles.temperature_popup_menu,'String',refresh_popup);

temperature_quantity = 0; 
assignin('base', 'temperature_quantity', temperature_quantity);

save_temperature_panel = 0;
assignin('base', 'save_temperature_panel', save_temperature_panel);

% --- Executes on button press in temperature_save_button.
function temperature_save_button_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Verify if the temperatures were added
temperature_quantity = evalin('base', 'temperature_quantity'); 

if temperature_quantity == 0
    errordlg('Fullfil the temperature field', 'Error');
else
    msgbox('Clique to close the window','OK')
    refresh_popup = {''};
    set(handles.temperature_popup_menu,'String',refresh_popup);   
    % Control if the user saved the data
    save_temperature_panel = 1;
    assignin('base', 'save_temperature_panel', save_temperature_panel);
end


% --- Executes on button press in temperature_ADD_button.
function temperature_ADD_button_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_ADD_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on selection change in temperature_popup_menu.
function temperature_popup_menu_Callback(hObject, eventdata, handles)
% hObject    handle to temperature_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns temperature_popup_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from temperature_popup_menu


% --- Executes during object creation, after setting all properties.
function temperature_popup_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temperature_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% =================== BEGIN OF PANEL EPSILON DOT (STRAIN RATE) ===========
%  ========================================================================

% --- Executes on button press in epsilon_dot_linear_checkbox.
function epsilon_dot_linear_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_linear_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of epsilon_dot_linear_checkbox

% Control if the user selected the type of Strain Rate
save_epsilon_dot_strain_rate_type = 1;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);

% Refresh automatic the logarithmic fields
epsilon_dot_logarithmic_input = 0; 
assignin('base', 'epsilon_dot_logarithmic_input', epsilon_dot_logarithmic_input);
epsilon_dot_logarithmic_array = 0; 
assignin('base', 'epsilon_dot_logarithmic_array', epsilon_dot_logarithmic_array);
refresh_logarithmic_popup = {''};
set(handles.epsilon_dot_logarithmic_popup_menu,'String',refresh_logarithmic_popup);
epsilon_dot_logarithmic_quantity = 0; 
assignin('base', 'epsilon_dot_logarithmic_quantity', epsilon_dot_logarithmic_quantity);

set(handles.epsilon_dot_linear_checkbox, 'Value', 1);
set(handles.epsilon_dot_logarithmic_checkbox, 'Value', 0);


function epsilon_dot_step_linear_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_step_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_dot_step_linear_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_dot_step_linear_input as a double

% Reading the textbox fields
epsilon_dot_step_linear_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_step_linear_input) || epsilon_dot_step_linear_input <= 0)
        epsilon_dot_step_linear_input = 0;
        assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);

% --- Executes during object creation, after setting all properties.
function epsilon_dot_step_linear_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_step_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function epsilon_dot_min_linear_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_min_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_dot_min_linear_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_dot_min_linear_input as a double

% Reading the textbox fields
epsilon_dot_min_linear_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_min_linear_input) || epsilon_dot_min_linear_input <= 0)
        epsilon_dot_min_linear_input = 0;
        assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
    
    
% --- Executes during object creation, after setting all properties.
function epsilon_dot_min_linear_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_min_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function epsilon_dot_max_linear_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_max_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_dot_max_linear_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_dot_max_linear_input as a double

% Reading the textbox fields
epsilon_dot_max_linear_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_max_linear_input) || epsilon_dot_max_linear_input <= 0)
        epsilon_dot_max_linear_input = 0;
        assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);

% --- Executes during object creation, after setting all properties.
function epsilon_dot_max_linear_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_max_linear_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in epsilon_dot_logarithmic_checkbox.
function epsilon_dot_logarithmic_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of epsilon_dot_logarithmic_checkbox

% Control if the user selected the type of Strain Rate
save_epsilon_dot_strain_rate_type = 2;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);

% Refresh automatic the linear fields
set(handles.epsilon_dot_max_linear_input, 'string', '');
set(handles.epsilon_dot_min_linear_input, 'string', '');
set(handles.epsilon_dot_step_linear_input, 'string', '');
epsilon_dot_step_linear_input = 0; 
assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);
epsilon_dot_min_linear_input = 0; 
assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
epsilon_dot_max_linear_input = 0; 
assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);

set(handles.epsilon_dot_logarithmic_checkbox, 'Value', 1);
set(handles.epsilon_dot_linear_checkbox, 'Value', 0);


function epsilon_dot_logarithmic_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_dot_logarithmic_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_dot_logarithmic_input as a double

% Reading the textbox fields
epsilon_dot_logarithmic_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_dot_logarithmic_input) || epsilon_dot_logarithmic_input <= 0)
        epsilon_dot_logarithmic_input = 0;
        assignin('base', 'epsilon_dot_logarithmic_input', epsilon_dot_logarithmic_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_dot_logarithmic_input', epsilon_dot_logarithmic_input);

% --- Executes during object creation, after setting all properties.
function epsilon_dot_logarithmic_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in epsilon_dot_logarithmic_ADD_button.
function epsilon_dot_logarithmic_ADD_button_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_ADD_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

epsilon_dot_logarithmic_quantity = evalin('base', 'epsilon_dot_logarithmic_quantity');  
epsilon_dot_logarithmic_array = evalin('base', 'epsilon_dot_logarithmic_array');
epsilon_dot_logarithmic_input = evalin('base', 'epsilon_dot_logarithmic_input');

% prevent to add null values to the popupmenu
if epsilon_dot_logarithmic_input == 0 
    return;
end

% Test if the value was already added
i_logarithmic = 1;
while i_logarithmic <= epsilon_dot_logarithmic_quantity
    
    if epsilon_dot_logarithmic_array(i_logarithmic,1) == epsilon_dot_logarithmic_input 
        % Warning and interrupt the loop
        % Variable i is used to recognize the error
        errordlg('This value is already used', 'Error');
         % To refresh the temperature textbox
        epsilon_dot_logarithmic_input = '';
        set(handles.epsilon_dot_logarithmic_input,'String',epsilon_dot_logarithmic_input)
        i_logarithmic = 0;
        break;
    end
    i_logarithmic = i_logarithmic + 1;   
end

% If i ~= 0, add the value, else do nothing 
if i_logarithmic ~= 0
    epsilon_dot_logarithmic_quantity = epsilon_dot_logarithmic_quantity + 1;
    epsilon_dot_logarithmic_array(epsilon_dot_logarithmic_quantity,1) = epsilon_dot_logarithmic_input;
    set(handles.epsilon_dot_logarithmic_popup_menu,'String',epsilon_dot_logarithmic_array);
    % To refresh the logarithmic textbox
    epsilon_dot_logarithmic_input = '';
    set(handles.epsilon_dot_logarithmic_input,'String',epsilon_dot_logarithmic_input)
end    

assignin('base', 'epsilon_dot_logarithmic_array', epsilon_dot_logarithmic_array);
assignin('base', 'epsilon_dot_logarithmic_quantity', epsilon_dot_logarithmic_quantity);


% --- Executes on selection change in epsilon_dot_logarithmic_popup_menu.
function epsilon_dot_logarithmic_popup_menu_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns epsilon_dot_logarithmic_popup_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from epsilon_dot_logarithmic_popup_menu


% --- Executes during object creation, after setting all properties.
function epsilon_dot_logarithmic_popup_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_logarithmic_popup_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in epsilon_dot_clear_button.
function epsilon_dot_clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of epsilon_dot_clear_button

% Refresh all fields
save_epsilon_dot_strain_rate_type = 0;
assignin('base', 'save_epsilon_dot_strain_rate_type', save_epsilon_dot_strain_rate_type);
save_epsilon_dot_strain_rate_panel = 0;
assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);

% LOGARITHMIC
epsilon_dot_logarithmic_input = 0; 
assignin('base', 'epsilon_dot_logarithmic_input', epsilon_dot_logarithmic_input);
epsilon_dot_logarithmic_array = 0; 
assignin('base', 'epsilon_dot_logarithmic_array', epsilon_dot_logarithmic_array);
refresh_logarithmic_popup = {''};
set(handles.epsilon_dot_logarithmic_popup_menu,'String',refresh_logarithmic_popup);
epsilon_dot_logarithmic_quantity = 0; 
assignin('base', 'epsilon_dot_logarithmic_quantity', epsilon_dot_logarithmic_quantity);
set(handles.epsilon_dot_logarithmic_checkbox, 'Value', 0);

% LINEAR
set(handles.epsilon_dot_max_linear_input, 'string', '');
set(handles.epsilon_dot_min_linear_input, 'string', '');
set(handles.epsilon_dot_step_linear_input, 'string', '');
epsilon_dot_step_linear_input = 0; 
assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);
epsilon_dot_min_linear_input = 0; 
assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
epsilon_dot_max_linear_input = 0; 
assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);
set(handles.epsilon_dot_linear_checkbox, 'Value', 0);

%%               save_epsilon_dot_strain_rate_linear_checkbox

function save_epsilon_dot_strain_rate_linear_checkbox(hObject, eventdata, handles);
% Verify if the values were added
epsilon_dot_step_linear_input = evalin('base', 'epsilon_dot_step_linear_input'); 
epsilon_dot_min_linear_input = evalin('base', 'epsilon_dot_min_linear_input'); 
epsilon_dot_max_linear_input = evalin('base', 'epsilon_dot_max_linear_input');

if epsilon_dot_step_linear_input == 0 || epsilon_dot_min_linear_input == 0 || epsilon_dot_max_linear_input == 0
    errordlg('Fullfil all the fields', 'Error');
    set(handles.epsilon_dot_max_linear_input, 'string', '');
    set(handles.epsilon_dot_min_linear_input, 'string', '');
    set(handles.epsilon_dot_step_linear_input, 'string', '');
    epsilon_dot_step_linear_input = 0; 
    assignin('base', 'epsilon_dot_step_linear_input', epsilon_dot_step_linear_input);
    epsilon_dot_min_linear_input = 0; 
    assignin('base', 'epsilon_dot_min_linear_input', epsilon_dot_min_linear_input);
    epsilon_dot_max_linear_input = 0; 
    assignin('base', 'epsilon_dot_max_linear_input', epsilon_dot_max_linear_input);
else
    msgbox('Clique to close the window','OK')
    refresh_epsilon_dot_max_linear_input = '';
    set(handles.epsilon_dot_max_linear_input,'String',refresh_epsilon_dot_max_linear_input);
    refresh_epsilon_dot_min_linear_input = '';
    set(handles.epsilon_dot_min_linear_input,'String',refresh_epsilon_dot_min_linear_input);
    refresh_epsilon_dot_step_linear_input = '';
    set(handles.epsilon_dot_step_linear_input,'String',refresh_epsilon_dot_step_linear_input);
    set(handles.epsilon_dot_linear_checkbox, 'Value', 0);
   
    % Control if the user saved the data
    save_epsilon_dot_strain_rate_panel = 1;
    assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);
end
     
%%               save_epsilon_dot_strain_rate_logarithmic_checkbox

function save_epsilon_dot_strain_rate_logarithmic_checkbox(hObject, eventdata, handles);

% Verify if the logarithmic values were added
epsilon_dot_logarithmic_quantity = evalin('base', 'epsilon_dot_logarithmic_quantity'); 

if epsilon_dot_logarithmic_quantity == 0
    errordlg('Fullfil the logarithmic field', 'Error');
else
    msgbox('Clique to close the window','OK')
    refresh_logarithmic_popup = {''};
    set(handles.epsilon_dot_logarithmic_popup_menu,'String',refresh_logarithmic_popup); 
    set(handles.epsilon_dot_logarithmic_checkbox, 'Value', 0);
    % Control if the user saved the data
    save_epsilon_dot_strain_rate_panel = 1;
    assignin('base', 'save_epsilon_dot_strain_rate_panel', save_epsilon_dot_strain_rate_panel);
end

% --- Executes on button press in epsilon_dot_save_button.
function epsilon_dot_save_button_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_dot_save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_epsilon_dot_strain_rate_type = evalin('base', 'save_epsilon_dot_strain_rate_type');

switch (save_epsilon_dot_strain_rate_type)
    case 1
        save_epsilon_dot_strain_rate_linear_checkbox(hObject, eventdata, handles);
 
    case 2
        save_epsilon_dot_strain_rate_logarithmic_checkbox(hObject, eventdata, handles);
            
    otherwise
        errordlg('Choose between Linear or Logarithmic','Error');
end

%% =================== BEGIN OF PANEL EPSILON =============================
%  ========================================================================

function epsilon_step_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_step_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_step_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_step_input as a double

% Reading the textbox fields
epsilon_step_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_step_input) || epsilon_step_input < 0)
        epsilon_step_input = 0;
        assignin('base', 'epsilon_step_input', epsilon_step_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_step_input', epsilon_step_input);

% --- Executes during object creation, after setting all properties.
function epsilon_step_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_step_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function epsilon_min_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_min_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_min_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_min_input as a double

% Reading the textbox fields
epsilon_min_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_min_input) || epsilon_min_input < 0)
        epsilon_min_input = 0;
        assignin('base', 'epsilon_min_input', epsilon_min_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error'); %zero should be possible here
    end
    assignin('base', 'epsilon_min_input', epsilon_min_input);

% --- Executes during object creation, after setting all properties.
function epsilon_min_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_min_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function epsilon_max_input_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_max_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon_max_input as text
%        str2double(get(hObject,'String')) returns contents of epsilon_max_input as a double

% Reading the textbox fields
epsilon_max_input = str2double(get(hObject, 'String'));
    if (isnan(epsilon_max_input) || epsilon_max_input <= 0)
        epsilon_max_input = 0;
        assignin('base', 'epsilon_max_input', epsilon_max_input);
        set(hObject, 'String', '');
        errordlg('Enter the correct data','Error');
    end
    assignin('base', 'epsilon_max_input', epsilon_max_input);
    

% --- Executes during object creation, after setting all properties.
function epsilon_max_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon_max_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in epsilon_clear_button.
function epsilon_clear_button_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_clear_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of epsilon_clear_button

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


% --- Executes on button press in epsilon_save_button.
function epsilon_save_button_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon_save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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
% --- Executes on button press in save_file_button.
function save_file_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_file_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This block creates the .txt file *************************************
% Creates the dialog box
prompt = {'Save as:'};             % open a dialog box for saving the file
dlg_title = 'Save';                % window title
num_lines = 1;                     % text field
defaultans = {''};                 % default file name
PathName = 'output\';                % default path

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

%% =================== BEGIN OF CALCULATE BUTTON ==========================
%  ========================================================================
% --- Executes on button press in calculate_button.
function calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check the values of all panels
save_material_panel = evalin('base','save_material_panel');
save_temperature_panel = evalin('base','save_temperature_panel');
save_epsilon_panel = evalin('base','save_epsilon_panel');
save_epsilon_dot_strain_rate_panel = evalin('base','save_epsilon_dot_strain_rate_panel');

save_epsilon_dot_strain_rate_type = evalin('base','save_epsilon_dot_strain_rate_type');

% control if all the panels are filled
if save_material_panel == 0 || save_temperature_panel == 0 || ...
        save_epsilon_panel == 0 || save_epsilon_dot_strain_rate_panel == 0
    errordlg('Please fullfil the all data fields','Error');
else
        switch(save_epsilon_dot_strain_rate_type)
            case 1
                calculate_strain_rate_linear(hObject, eventdata, handles);
            case 2
                calculate_strain_rate_logarithmic(hObject, eventdata, handles);
        end
end
%%              calculate_epsilon_dot_strain_rate_linear
function calculate_strain_rate_linear(hObject, eventdata, handles);

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
epsilon_dot_step_linear_input = evalin('base','epsilon_dot_step_linear_input');
epsilon_dot_min_linear_input = evalin('base','epsilon_dot_min_linear_input');
epsilon_dot_max_linear_input = evalin('base','epsilon_dot_max_linear_input');
% Temperature
temperature_quantity = evalin('base','temperature_quantity');
temperature_array = evalin('base','temperature_array');
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
strain_rate_linear_quantity = log10(epsilon_dot_max_linear_input / epsilon_dot_min_linear_input) +1;
assignin('base', 'strain_rate_linear_quantity', strain_rate_linear_quantity);

% First and second line of the file
 fprintf(fid,'Flow STRESS \n');
 fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
epsilon = epsilon_min_input; % gets the initial value from epsilon
strain_rate_linear = epsilon_dot_min_linear_input;

% Write the Sigmas in the file
while i <= temperature_quantity 
            while j <= strain_rate_linear_quantity
                while k <= epsilon_quantity 
                        sigma = (A+B*epsilon^n)*(1+C*log(strain_rate_linear/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   if(epsilon >= 1)                        
                        sigma = (A+B)*(1+C*log(strain_rate_linear/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);                     
                   end                
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon strain_rate_linear temperature_array(i,1)]);            
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
                    strain_rate_linear = strain_rate_linear * epsilon_dot_step_linear_input;
            end
                k = 1;
                j = 1;
                epsilon = epsilon_min_input;
                strain_rate_linear = epsilon_dot_min_linear_input;
                i = i + 1;
end
fclose(fid);
msgbox('Saved', 'Ok');

% refresh the workpspace for a new file
evalin( 'base', 'clearvars *' ) 
initial(hObject, eventdata, handles) 
%%              calculate_strain_rate_logarithmic
function calculate_strain_rate_logarithmic(hObject, eventdata, handles);

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
epsilon_dot_logarithmic_quantity = evalin('base','epsilon_dot_logarithmic_quantity');
epsilon_dot_logarithmic_array = evalin('base','epsilon_dot_logarithmic_array');
% Temperature
temperature_quantity = evalin('base','temperature_quantity');
temperature_array = evalin('base','temperature_array');
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
 fprintf(fid,'Flow STRESS \n');
 fprintf(fid,'Sigma \t   Epsilon \t  strain_rate \t  Temperature \n');

% Initial values for sigma
i = 1; % counter for Temperature
j = 1; % counter for epsilon dot
k = 1; % counter for epsilon 
epsilon = epsilon_min_input; % gets the initial value from epsilon

% Write the sigmas in the file
while i <= temperature_quantity 
            while j <= epsilon_dot_logarithmic_quantity
                while k <= epsilon_quantity 
                    sigma = (A+B*epsilon^n)*(1+C*log(epsilon_dot_logarithmic_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   if(epsilon >= 1)                        
                       sigma = (A+B)*(1+C*log(epsilon_dot_logarithmic_array(j,1)/eps_dot_0))*(1-((temperature_array(i,1)-T_0)/(T_m-T_0))^m);
                   end
                        fprintf(fid,'%E\t%E\t%E\t%E\n', [sigma epsilon epsilon_dot_logarithmic_array(j,1) temperature_array(i,1)]);     
                        k = k + 1;
                        epsilon = epsilon + epsilon_step_input;
                end
                    k = 1;
                    epsilon = epsilon_min_input;
                    j = j + 1;
            end
                k = 1;
                j = 1;
                i = i + 1;
end
fclose(fid);
msgbox('Saved', 'Ok');

% refresh the workpspace for a new file
evalin( 'base', 'clearvars *' ) 
initial(hObject, eventdata, handles) 

%% =======================BEGIN OF PLOT BUTTON =======================
%  ========================================================================
% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

