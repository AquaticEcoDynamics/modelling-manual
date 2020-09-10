#Spatial terms - x
gridlength<-140 #m
length<-18 #sections
gridincrement<-seq(1:length)
riverposition<-gridincrement*gridlength
#Velocity - variable in each grid increment
u<-c(0.2,0.2,0.2,0.2,0.2 #velocity at each point in the river m s^-1
     ,0.2,0.2,0.2,0.2,0.2 #u at x=6 to 10
     ,0.2,0.2,0.2,0.2,0.2 #u at x=11 to 15
     ,0.2,0.2,0.2 #u at x=15 to 18
     )
#Time setup
timemax=100
timeseq<-seq(1:timemax)
timestep=30 #s 
time<-timeseq*timestep
#Chemical parameters
D=250 #O2 diffusivity in m^2 s^-1
kBOD=1e-3 # Biological oxgyen demand s^-1
ka=0.0015 # Atmospheric exchange mg L^-1 s^-1
Ca= 10 # Atmospheric O2 concentration 
UpBound=10 #Upstream boundary
DownBound=10 #Downstream boundary
S<-c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0) #Source term
#S<-c(0,0,0,0,0,0,0,0,0,-10,0,0,0,0,0,0,0,0) #Source term
C=matrix(nrow=timemax,ncol=length)