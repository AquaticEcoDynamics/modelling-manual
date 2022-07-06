#R needs you to call things NULL for its own strange reasons. Just do it.
ROM=NULL
OM=NULL
RO2=NULL
O2=NULL
RNO3=NULL
NO3=NULL
RMn=NULL
Mn=NULL
#Set an initial concentration. [1] means at timestep 1
OM[1]=100 #mM
O2[1]=30 #mM
NO3[1]=35 #mM
Mn[1]=30 #mM
#Set an initial rate, which in this case is zero.
ROM[1]=0 #mM y^-1
RO2[1]=0 #mM y^-1
RNO3[1]=0 #mM y^-1
RMn[1]=0 #mM y^-1
#Set the kinetic rate constant of the reaction
kOM=1 #y^-1
#Set the Monod constants
KO2=20
KNO3=10
KMn=30
#Set the time parameters
Timelength=1/365 #y 
Timemax=1000 #Timesteps
Timesteps=seq(1:Timemax)
Time=Timesteps*Timelength
