% ***************************************************************
% *** Help file for running matlab gui FaultInvPSO
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Originated by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************
This is a help file for a description of all Data, Subroutine used for running gui named FaultInvPSO_GUI which is used in 
'FaultInvPSO: A Matlab based program for Gravity inversion of 2D Fault having variable density contrast using Particle Swarm Optimization.'  

Data files as example are stored as 'grv_Aswaraopet.dat', 'obs_Aswaraopet' and 'density_Aswaraopet.dat' , contains gravity anomaly, observation points and density distribution. User can use their own data for inverting any fault structure

Subroutines
		a. lgwt.m
		b. Fault_Invert
		c. poly_gravityrho.m
		d. WIPSO.m
		e. plot_fault

	a. lgwt.m - This script is for computing definite integrals using Legendre-Gauss 
 Quadrature. Computes the Legendre-Gauss nodes and weights  on an interval [a,b] with truncation order N. Suppose you have a continuous function f(x) which is defined on [a,b]
which you can evaluate at any x in [a,b]. Simply evaluate it at all of the values contained in the x vector to obtain a vector f. Then compute the definite integral using sum(f.*w);

	This code is written by Greg von Winckel - 02/25/2004. Here we have used it for our calculation and cited in main manuscript. 
	
	b. Fault_Invert.m - Main Matlab Function for Fault inversion having given Density distribution, observation points and corresponding gravity anomaly.
	
	c. poly_gravityrho.m - poly_gravityrho function calculates z component of gravity field for any polygon shape 2d body having depth varying density contrast. This program based on line integral in anticlockwise direction using Gauss Legendre quadrature
%integral formula. For more detail go through Zhou 2008. It is same as poly_gravity function but for depth varying density contrast. 

	d. WIPSO.m - WIPSO calculates the optimized parameters (best_var) for a given objective function (CostFunction) using Particle Swarm Optimization.
	
	e. plot_fault.m - Matlab function for plotting any fault for giving Fault plane locations in 3D as well as 2D view. 
	
	f. Fault_Invert.m is the main GUI file. 