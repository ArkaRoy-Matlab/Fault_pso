% ***************************************************************
% *** Matlab GUI for inversion of fault plane from gravity data
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Developed by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************

function varargout = FaultInvPSO(varargin)
% FAULTINVPSO MATLAB code for FaultInvPSO.fig
%      FAULTINVPSO, by itself, creates a new FAULTINVPSO or raises the existing
%      singleton*.
%
%      H = FAULTINVPSO returns the handle to a new FAULTINVPSO or the handle to
%      the existing singleton*.
%
%      FAULTINVPSO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FAULTINVPSO.M with the given input arguments.
%
%      FAULTINVPSO('Property','Value',...) creates a new FAULTINVPSO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FaultInvPSO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FaultInvPSO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FaultInvPSO

% Last Modified by GUIDE v2.5 28-Jul-2020 20:57:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FaultInvPSO_OpeningFcn, ...
                   'gui_OutputFcn',  @FaultInvPSO_OutputFcn, ...
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

% --- Executes just before FaultInvPSO is made visible.
function FaultInvPSO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FaultInvPSO (see VARARGIN)

% Choose default command line output for FaultInvPSO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FaultInvPSO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FaultInvPSO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function obs_path_Callback(hObject, eventdata, handles)
% hObject    handle to obs_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obs_path as text
%        str2double(get(hObject,'String')) returns contents of obs_path as a double
file_obs= get(hObject,'String');
x_obs=importdata(file_obs);


% --- Executes during object creation, after setting all properties.
function obs_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obs_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function grv_path_Callback(hObject, eventdata, handles)
% hObject    handle to grv_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of grv_path as text
%        str2double(get(hObject,'String')) returns contents of grv_path as a double



% --- Executes during object creation, after setting all properties.
function grv_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grv_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function density_fnc_Callback(hObject, eventdata, handles)
% hObject    handle to density_fnc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of density_fnc as text
%        str2double(get(hObject,'String')) returns contents of density_fnc as a double


% --- Executes during object creation, after setting all properties.
function density_fnc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to density_fnc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in obs_btn.
function obs_btn_Callback(hObject, eventdata, handles)
% hObject    handle to obs_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile({'*.*'},'File for Observation points');
fullname_obs=fullfile(filepath,filename);
set(handles.obs_path, 'string', fullname_obs);


% --- Executes on button press in grv_btn.
function grv_btn_Callback(hObject, eventdata, handles)
% hObject    handle to grv_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile({'*.*'},'File for Gravity Data');
fullname_fld=fullfile(filepath,filename);
set(handles.grv_path, 'string', fullname_fld);


% --- Executes when entered data in editable cell(s) in data_table.
function data_table_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to data_table (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in data_load.
function data_load_Callback(hObject, eventdata, handles)
% hObject    handle to data_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file_obs= get(handles.obs_path,'String');
x_obs=importdata(file_obs);
file_data= get(handles.grv_path,'String');
data=importdata(file_data);
val=[x_obs data];
set(handles.data_table,'data',val)



function yspan_Callback(hObject, eventdata, handles)
% hObject    handle to yspan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yspan as text
%        str2double(get(hObject,'String')) returns contents of yspan as a double


% --- Executes during object creation, after setting all properties.
function yspan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yspan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    str=get(handles.density_fnc,'String');
    str = vectorize(str);
    density = str2func(['@(z)' str]);
    file_obs= get(handles.obs_path,'String');
    x_obs=importdata(file_obs);
    file_data= get(handles.grv_path,'String');
    data=importdata(file_data);
    y_span=(x_obs(end)-x_obs(1))/2;
    z_obs=0;
    ss='Model Started Running';
    drawnow;
    set(handles.md_run,'string', ss)
    %Run Model for 10 times and taking best model out of this 10 independent runs
    for i=1:5
        %running independent model
        [x_l,z_l,x_h,z_h,best_cost,error_energy]=Fault_Invert(data,x_obs,z_obs,density);
        %Saving data for all independent run
        xx_l(i)=x_l; xx_h(i)=x_h; zz_l(i)=z_l; zz_h(i)=z_h; bb_cost(i)=best_cost; err(i,:)=error_energy;
        ss=sprintf('%d independent run finished.',i);
        drawnow;
        set(handles.md_run,'string', ss)
    end
    ss='';
    set(handles.md_run,'string',ss);
    %finding minimum of cost function
    [mm,id]=min(bb_cost);
    %outputs for best Model
    x_l=xx_l(id);x_h=xx_h(id); 
    z_l=zz_l(id);z_h=zz_h(id); 
    bst_err=sqrt(squeeze(err(id,:)));
%% Plotting the estimated Fault structure   
                [t,c]=lgwt(10,0,1);
                %checking for orientation of the fault
                dd(1)=abs(data(1)); dd(2)=abs(data(end));
                if dd(1)>dd(2)  
                    %Left side oriented fault
                    x=[x_h x_l -inf -inf];
                    y=[z_h z_l z_l z_h];
                    tf=0;
                else
                    %Right side oriented fault
                    x=[x_l x_h inf inf];
                    y=[z_l z_h z_h z_l];
                    tf=1;
                end

                %Gravity field of the basin for varying density
                yy=poly_gravityrho(x_obs,z_obs,x,y,density,t,c);

        %Plotting the estimated gravity anomaly Fault structure
        axes(handles.axes1);
        plot(x_obs,data,'ro','Linewidth',2)
        hold on
        plot(x_obs,yy,'Linewidth',2)
        xlabel('Observation Points in Meter')
        ylabel('Gravity Anomaly in mGal')
        title('Gravity Anomaly plot')
        legend('Observed','Optimized','Location','best')
        box on
        
        
        %checking the orientation of the fault 
        if dd(1)>dd(2)  
            axes(handles.axes4);
            %Plotting Left side oriented fault
            plot([x_l x_h x_obs(1) x_obs(1) x_l],[z_l z_h z_h z_l z_l],'r','linewidth',2) 
            patch([x_l x_h x_obs(1) x_obs(1) x_l],[z_l z_h z_h z_l z_l],density([z_l z_h z_h z_l z_l]),'EdgeColor','red')
            colormap winter
            box on
            set(gca,'Ydir','reverse')
            xlim([x_obs(1) x_obs(end)])
        else
            axes(handles.axes4);
            %Plotting Right side oriented fault
            plot([x_l x_obs(end) x_obs(end) x_h x_l],[z_l z_l z_h z_h z_l])
            patch([x_l x_obs(end) x_obs(end) x_h x_l],[z_l z_l z_h z_h z_l],density([z_l z_l z_h z_h z_l]),'EdgeColor','red')
            colormap winter
            box on
            set(gca,'Ydir','reverse')
            xlim([x_obs(1) x_obs(end)])
        end
        xlabel('Horizontal Location in meter')
        ylabel('Depth in Meter')
        title('Fault Structure (2D view)')
        
    % tf    = represents the fault orientation 
    %       if tf=0 ; Fault is left side oriented
    %       if tf=1 ; Fault is right side oriented
    % For plotting the Fault we have required 6 planes each having 4 vertices
    
    x_min=x_obs(1);x_max=x_obs(end); 
    
    
    if tf==0  %left side oriented Fault
        %1st plane 
        x1= [x_min x_h x_l x_min];              %x vertices of 1st plane
        y1= [-y_span -y_span -y_span -y_span];  %y vertices of 1st plane
        z1= [z_h z_h z_l z_l];                  %z vertices of 1st plane

        %2nd plane 
        x2= [x_min x_h x_l x_min];              %x vertices of 2nd plane
        y2= [y_span y_span y_span y_span];      %y vertices of 2nd plane
        z2= [z_h z_h z_l z_l];                  %z vertices of 2nd plane

        %3rd plane 
        x3= [x_min x_l x_l x_min];              %x vertices of 3rd plane
        y3= [-y_span -y_span y_span y_span];    %y vertices of 3rd plane
        z3= [z_l z_l z_l z_l];                  %z vertices of 3rd plane

        %4th plane 
        x4= [x_min x_h x_h x_min];          %x vertices of 4th plane
        y4= [-y_span -y_span y_span y_span];    %y vertices of 4th plane
        z4= [z_h z_h z_h z_h];                  %z vertices of 4th plane

        %5th plane 
        x5= [x_min x_min x_min x_min];          %x vertices of 5th plane
        y5= [-y_span -y_span y_span y_span];    %y vertices of 5th plane
        z5= [z_h z_l z_l z_h];                  %z vertices of 5th plane

        %6th plane 
        x6= [x_l x_h x_h x_l];                  %x vertices of 6th plane
        y6= [-y_span -y_span y_span y_span];    %y vertices of 6th plane
        z6= [z_l z_h z_h z_l];                  %z vertices of 6th plane
        
    else  %right side oriented Fault
        %1st plane 
        x1= [x_max x_h x_l x_max];              %x vertices of 1st plane
        y1= [-y_span -y_span -y_span -y_span];  %y vertices of 1st plane
        z1= [z_h z_h z_l z_l];                  %z vertices of 1st plane

        %2nd plane 
        x2= [x_max x_h x_l x_max];              %x vertices of 2nd plane
        y2= [y_span y_span y_span y_span];      %y vertices of 2nd plane
        z2= [z_h z_h z_l z_l];                  %z vertices of 2nd plane

        %3rd plane 
        x3= [x_max x_l x_l x_max];              %x vertices of 3rd plane
        y3= [-y_span -y_span y_span y_span];    %y vertices of 3rd plane
        z3= [z_l z_l z_l z_l];                  %z vertices of 3rd plane

        %4th plane 
        x4= [x_max x_h x_h x_max];          %x vertices of 4th plane
        y4= [-y_span -y_span y_span y_span];    %y vertices of 4th plane
        z4= [z_h z_h z_h z_h];                  %z vertices of 4th plane

        %5th plane 
        x5= [x_max x_max x_max x_max];          %x vertices of 5th plane
        y5= [-y_span -y_span y_span y_span];    %y vertices of 5th plane
        z5= [z_h z_l z_l z_h];                  %z vertices of 5th plane

        %6th plane 
        x6= [x_l x_h x_h x_l];                  %x vertices of 6th plane
        y6= [-y_span -y_span y_span y_span];    %y vertices of 6th plane
        z6= [z_l z_h z_h z_l];                  %z vertices of 6th plane
    end
    axes(handles.axes2);
    %Plotting the fault
    hold on
    %1st plane
    patch(x1,y1,z1,density(z1),'EdgeColor','red','LineWidth',2)
    hold on
    %2nd plane
    patch(x2,y2,z2,density(z2),'EdgeColor','red','LineWidth',2)
    hold on
    %3rd plane
    patch(x3,y3,z3,density(z3),'EdgeColor','red','LineWidth',2)
    hold on
    %4th plane
    patch(x4,y4,z4,density(z4),'EdgeColor','red','LineWidth',2)
    hold on
    %5th plane
    patch(x5,y5,z5,density(z5),'EdgeColor','red','LineWidth',2)
    hold on
    %6th plane
    patch(x6,y6,z6,density(z6),'EdgeColor','red','LineWidth',2);
    xlim([x_min x_max])
    %Axis labelling
    xlabel('X Direction in m')
    ylabel('Y Direction in m')
    zlabel('Z Direction in m')
    title('Fault Structure (3D view)')
    %colormap of the density
    c = colorbar('location','southoutside');
    c.Label.String = 'Density in kg/m^3';
    colormap winter
    set(gca,'Zdir','reverse')
    %fixing viewing angle
    if tf==0
        view(45,45);
    else
        view(-45,45);
    end
    box on
    
    points_upper=sprintf('X = %f m and Z = %f m',x_h,z_h);
    set(handles.upper,'string', points_upper)
    
    points_lower=sprintf('X = %f m and Z = %f m',x_l,z_l);
    set(handles.lower,'string', points_lower)
    
    zz=linspace(0,z_h);
    den=density(zz)+0.*zz;
    axes(handles.axes3);
    plot(den,zz,'Linewidth',2)
    set(gca,'Ydir','reverse')
    set(gca,'Xdir','reverse')
    xlabel('Density in kg/m^3')
    ylabel('Depth in Meter')
    title('Depth Density plot')
    axes(handles.axes5);
    semilogy(1:length(bst_err),bst_err,'Linewidth',2)
    title('Error norm of gravity anomaly')
    ylabel('Error Norm in mGal')
    xlabel('Number of iterations')
