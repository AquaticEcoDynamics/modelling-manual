precip
P=as.matrix(precip)
P
delete this line once you have seen what I did with precipitation and P





#START THE LOOP!
for(t in 2:which.max(time)){
#CLIMATE FORCING --------------- THIS IS A SIN WAVE TO MAKE SUMMER HOTTER THAN WINTER
ep[t]=(1+epamp*sin(angfreq*((30.44*(months[t]-1)+days[t])+epphase)))*epannual/365
#STORAGE ------------------------- I HAVE DONE STORAGE FOR YOU. YOU CAN THANK ME.
Susfc[t]=fc*(Smax-Ssat[t-1])
Stotprime[t]=Stot[t-1]+P[t]
if(Stotprime[t]<0){Stotprime[t]=1e-5} #SOMETIMES IT'S BETTER TO USE 1E-5 THAN 0, TO AVOID NUMERICAL PROBLEMS
Susprime[t]=Sus[t-1]+P[t]*Ac
Rp[t]=ifelse(Susprime[t]>Susfc[t],Susprime[t]-Susfc[t],1e-5)
#EVAPOTRANSPIRATION --------------- NOW YOU HAVE TO DO THE EQUATIONS FOR THESE THINGS.
#                   --------------- WATCH YOUR t INDICES
ev[t]=
ebs[t]=ifelse(
              Ssat[t-1]<phi*Debs
              ,
              ,
              )
eag[t]=
etot[t]=
#FLOWS
Qse[t]=ifelse(Stotprime[t]>Smax, , )
Qie[t]=ifelse(P[t]>Imax, , )
Qss[t]=ifelse(Ssat[t-1]>Susfc[t], , )
Qtot[t]=
#STORAGE
Ssat[t]= 
if(Ssat[t]<0){Ssat[t]=1e-5}
WT[t]=
Sus[t]=ifelse(Ssat[t]<Stotprime[t], , )
Stot[t]=
if(Stot[t]<0){ }
} #END THE FOR LOOP