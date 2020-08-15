% ***************************************************************
% *** Matlab function for inverting fault structure from given input data
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Developed by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************

%%Matlab Function for Fault inversion having given Density distribution
function [xl,yl,xh,yh,best_cost,error_energy]=Fault_Invert(data,x_obs,z_obs,density)

    %% Input Parameters
    %data  =  gravity anomaly in mGal
    %x_obs =  Horizontal location of oservation points 
    %z_obs =  Vertical location of oservation points
    %y_span=  span of y direction of the fault in meter
    
    %% Output Parameters
    %Location of Fault Plane
    %[xl,yl]  = %location of lower vertex of fault plane
    %[xh,yh]  = %location of  upper vertex of fault plane
    
    %% Problem Definition
    [t,c]=lgwt(10,0,1); 
    CostFunction =@(x) myCostFunction(x,data',x_obs',z_obs,density,t,c)+10000*constrained(x);
    %Legendre Gaussian quadrature integral points.
    c1=1.0; c2=1.2;
    nVar=4;                %Number of Unknown Variable including density
    MaxIt = 300;           %Maximum number of iterations
    nPoP =  40;            %Population size or swarm size
    %Optimization using PSO 
    [best_var, best_cost,iter_count,error_energy]  = WIPSO(CostFunction,nVar,MaxIt,nPoP,c1,c2);
     xx=best_var;
    %locations of Fault plane from parameters
    xl=xx(1); yl=xx(2);  %location of lower vertex of fault plane
    xh=xx(3); yh=xx(4);  %location of upper vertex of fault plane
       %% Cost function for optimization

        function val=myCostFunction(x,data,x_obs,z_obs,density,t,c)

        %Inputs
                %x       = parameters to be optimized in meter
                %          defines the location of Fault plane (vertices)
                %data    = Gravity anomaly data for optimization in mGal
                %x_obs   = Horizontal location of observation points in meter
                %z_obs   = Vartical location of observation point in meter
                %density = density distribution as a function of z;
                %           density=@(z) f(z) in kg/m^3
                %t       = Gauss legendre nodes for integration
                %c       = Gauss legendre weights for integration
         %Output
                %val= misfit functional value for optimized parameter

                %locations of Fault plane from parameters
                xll=x(1); yll=x(2);  %location of lower vertex of fault plane
                xhh=x(3); yhh=x(4);  %location of upper vertex of fault plane

                %checking for orientation of the fault
                dd1(1)=abs(data(1)); dd1(2)=abs(data(end));
                if dd1(1)>dd1(2)  
                    %Right side oriented fault
                    x1=[xhh xll -inf -inf];
                    y1=[yhh yll yll yhh];

                else
                    %Left side oriented fault
                    x1=[xll xhh inf inf];
                    y1=[yll yhh yhh yll];
                end

                %Gravity field of the basin for varying density
                yy1=poly_gravityrho(x_obs,z_obs,x1,y1,density,t,c);
                %misfit error
                val=norm(data-yy1);

        end

      %Depth Constraint for the optimization 
        function val=constrained(x)
        %Function constrained will provides the depth constraint for lower
        %limit of the depth for fault optimization
            %x       = parameters to be optimized in meter

            val=0;
            %implementing Penalty constraint for optimization
            for ii=1:4
                rr=x(ii);
                gg=(-rr);
                %value for penalty function
                val=val+(max(0,gg))^2;
            end
        end

end