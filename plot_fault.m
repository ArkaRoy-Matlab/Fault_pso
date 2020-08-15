% ***************************************************************
% *** Matlab function for plotting fault planes
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Developed by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************

%%Matlab code for plotting any fault for giving Fault plane location

function grv_cal=plot_fault(x_l,z_l,x_h,z_h,x_obs,grv_obs,density)

    % [x_l,z_l] and [x_h,z_h] are the vertex points of the Fault plane
    % x_obs     = horizontal locations of Observation points
    % grv_obs   = Gravity anomaly at observation points
    % density   =density distribution as a function of z; density=@(z) f(z)
    % For plotting the Fault we have required 6 planes each having 4 vertices
    %strike length for plotting
    y_span=(x_obs(end)-x_obs(1))/2; 
    %vertical location of observation points
    z_obs=0;
    %minimum and maximum location of observation points
    x_min=x_obs(1);x_max=x_obs(end); 
    %checking for orientation of the fault
                dd(1)=abs(grv_obs(1)); dd(2)=abs(grv_obs(end));
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
     %Gravity field of the fault for varying density
     [t,c]=lgwt(10,0,1); %Gauss Legendre quadrature
     grv_cal=poly_gravityrho(x_obs,z_obs,x,y,density,t,c);
     
     figure(1)
     %plotting for observed and inverted gravity profile 
     subplot(3,1,1)
     %observed gravity anomaly
     plot(x_obs,grv_obs,'ro','Linewidth',2)
     hold on
     %inverted gravity anomaly
     plot(x_obs,grv_cal,'Linewidth',2)
     %axis lebeling
     xlabel('Observation Points in Meter')
     ylabel('Gravity Anomaly in mGal')
     title('Gravity Anomaly plot')
     legend('Observed','Optimized','Location','best')
     box on
     
     %checking the orientation of the fault 
        if dd(1)>dd(2)  
            %Plotting Left side oriented fault
            figure(1)
            subplot(3,1,2)
            plot([x_l x_h x_obs(1) x_obs(1) x_l],[z_l z_h z_h z_l z_l],'r','linewidth',2) 
            patch([x_l x_h x_obs(1) x_obs(1) x_l],[z_l z_h z_h z_l z_l],density([z_l z_h z_h z_l z_l]),'EdgeColor','red')
            colormap winter
            box on
            set(gca,'Ydir','reverse')
            xlim([x_obs(1) x_obs(end)])
        else
            %Plotting Right side oriented fault
            figure(1)
            subplot(3,1,2)
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
        
    %All vertex location for the given fault    
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
    figure(1)
    subplot(3,1,3)
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
    c = colorbar('location','eastoutside');
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
end