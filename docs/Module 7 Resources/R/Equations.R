options(digits=3)             #This is just a formatting thing. It sets the number of digits. 
for(t in 2:timemax)           #First for loop (time)
{
  for(x in 2:(length-1)){     #Second for loop (space)
    #ifelse(t<(12*2*60),UpBound<-0,UpBound<-10)
    C[t,1]=UpBound #Upstream boundary condition x=1 for all t
    C[t,length]=DownBound #Downstream boundary for all t
    C[1,]<- c(UpBound,10,10,10,10 #Initial condition x=1 to 5
              ,10,10,10,10,10 #Initial condition x=6 to 10
              ,10,10,10,10,10 #Initial condition x=11 to 15
              ,10,10,DownBound) #mg L^-1 Initial condition x=16 to 18 for t=1 (initial)
    C[t,x]<-C[ , ]+                                              #C at x, t-1
       ( D*((                                )/  ^2)-            #Diffusion
         u[x]*((                     )/(            ))+          #Advection   
         k *(           )-                                       #Atmospheric input    
         k *                                                     #Biological oxygen demand
       )*timestep+                                               #Oxygen consumption
       S[x]                                                      #Source term
  if(C[t,x]<0){C[t,x]=0}                                         #Prevents negative concentrations
  } #End second for loop (space)
}   #End first for loop (time)

#Uncomment and run this line if you would like to save the resuls as a csv
#write(C,file="O2.csv",ncolumns=length,sep="\t ")
