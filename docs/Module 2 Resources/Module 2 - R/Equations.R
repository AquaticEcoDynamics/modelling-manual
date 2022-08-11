# Run the model
# Not sure how this loop works? Ask us!
for (t in 2:timeSteps){
  
  # Calculate the time
  model$time[t] <- t*timeLength
  
  #The oxygen equations
  model$RO2[t] <- kOM*model$OM[t-1]*(model$O2[t-1]/(model$O2[t-1]+KO2))
  model$O2[t] <-  model$O2[t-1]-model$RO2[t]*timeLength
  
  #The nitrate equations
  model$RNO3[t] <- kOM*model$OM[t-1]*(model$NO3[t-1]/(model$NO3[t-1]+KNO3))*(KO2/(KO2+model$O2[t-1]))
  model$NO3[t] <- model$NO3[t-1]-model$RNO3[t]*timeLength
  
  #The manganese equations
  model$RMn[t] <- kOM*model$OM[t-1]*(model$Mn[t-1]/(model$Mn[t-1]+KMn))*(KNO3/(KNO3+model$NO3[t-1]))*(KO2/(KO2+model$O2[t-1]))
  model$Mn[t] <- model$Mn[t-1]-model$RMn[t]*timeLength
  
  #The iron equations - add your equations here and update the data frame
  
  
  #The sulfate equations 
  
  
  #The methanogenesis equations
  
  
  #The organic matter equations
  model$ROM[t] <-  model$RO2[t]+model$RNO3[t]+model$RMn[t]
  model$OM[t] <-  model$OM[t-1]-model$ROM[t]*timeLength
  
}