#This script is for the actual eqautions themselves
#Make a for loop
for (t in 2:Timemax){
  #The oxygen equations
  RO2[t]=kOM*OM[t-1]*(O2[t-1]/(O2[t-1]+KO2))
  O2[t]=O2[t-1]-RO2[t]*Timelength
  #The nitrate equations
  RNO3[t]=kOM*OM[t-1]*(NO3[t-1]/(NO3[t-1]+KNO3))*(KO2/(KO2+O2[t-1]))
  NO3[t]=NO3[t-1]-RNO3[t]*Timelength
  #The manganese equations
  RMn[t]=kOM*OM[t-1]*(Mn[t-1]/(Mn[t-1]+KMn))*(KNO3/(KNO3+NO3[t-1]))*(KO2/(KO2+O2[t-1]))
  Mn[t]=Mn[t-1]-RMn[t]*Timelength
  #The iron equations
  
  #The sulfate equations
  
  #The methanogenesis equations
  
  #The organic matter equations
  ROM[t]=RO2[t]+RNO3[t]+RMn[t]
  OM[t]=OM[t-1]-ROM[t]*Timelength
  
}