library("scales", lib.loc="~/R/win-library/2.15")
#NULL
Stot     =NULL
Ssat     =NULL
ep       =NULL
Susfc    =NULL
Stotprime=NULL
Susprime =NULL
Rp       =NULL
ev       =NULL
ebs      =NULL
eag      =NULL
etot     =NULL
Qse      =NULL
Qie      =NULL
Qss      =NULL
Qtot     =NULL
Ssat     =NULL
WT       =NULL
Sus      =NULL
Stot     =NULL
#CATCHMENT
D=10 # Catchment average depth (m)
Ac=100# Catchment area (m2)
#SOIL
phi     =0.35 #	Soil porosity (-)
Debs    =9	  #Depth limit of soil evap (m)
Deag    =8	  #Depth limit of ag crop ET (m)
Ks      =0.01	#Hyd conductivity (-)
alphas  =0.04	#Scaling for baseflow (-)
betas   =2	  #Scaling for baseflow (-)
thetapwp=0.01	#Permanent wilting point (-)
thetafc =0.1	#Field capacity (-)
Imax    =0.04	#Max infiltration capacity (m/day)
#VEGETATION
M= 0.5	#% deep-rooted (-)
C= 0.3	#% agricultural crop (-)
#STORAGE --------------------- INITIAL CONDITION ----------------------------
Stot[1]=324
Ssat[1]=0.90*Stot[1]
Sus[1] =Stot[1]-Ssat[1]
#TIME
time<-seq(as.Date("2007/1/1"),as.Date("2011/12/31"),by="day")
time[1:50]
Time<-as.POSIXlt(time)
Time[1:50]
days<-Time$mday
days[1:50]
months<-Time$mon+1
months[1:50]
Have a 
"Have a look at how I made the time sequence and try to understand it."
Delete this
"Delete this line once you have understood it."
#CLIMATE
alphaebs=0.5	#bare soil evap scaling (-)
alphaeag=0.5	#crop evap scaling (-)
kv      =0.95	#forest evap scaling (-)
epannual=1.5	#Potl evaporation (m)
epsilon =2	#Evap sensitivity to storage: ε
fc=(thetafc-thetapwp)/(phi-thetapwp) # Threshold storage (-)
Smax=D*(phi-thetapwp)*Ac # Maximum storage capacity (m3)
#CLIMATE FORCING 
#Add rainfall boundary condition here as text file and location
#for example H:/Documents/Precipitation.txt
precip<-read.table(file=" put the location of the text file here /with forward slashes/Precipitation.txt")
epamp  =0.9
#angfreq=8*atanh_trans(1)/365.25
angfreq=0.017202424
epphase=91
