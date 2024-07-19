CO2<-3.5E-4
CO2multiplier<-c(1,1.2,1.4,1.6,1.8,2)

verysmallnumber<-1e-1
n_iterations<-1000
K1<-1*10^(-6.3); K2<-1*10^(-10.3); Kw<-1*10^-14; KH<- 1*10^(-1.47)
pH<-NULL; H<-NULL; pHDiff<-NULL
final_H<-matrix(data=NA, nrow=1, ncol=length(CO2multiplier))
final_pH<-matrix(data=NA, nrow=1, ncol=length(CO2multiplier))

pH[1]<-8.3
H[1]<- 10^(-1*pH[1])
CT<-1.185955e-03 # From the first exercise

for(k in 1:6){
  CO2new<-CO2*CO2multiplier[k] # From the previous exercises * (for example) 1 or 2 
  H2CO3<-KH*CO2new
  for(j in 2:n_iterations){
    H[j]<- ( H2CO3/CT*((H[j-1]^2)+K1*H[j-1]+K1*K2) )^(1/2)
    pH[j]<- -log10(H[j])
    pHDiff<- pH[j]-pH[j-1]
    
  } # end loop j - iterations
  final_H[k] <-H[j] # Fill in the matrix with the last iterated value
  final_pH[k]<-pH[j]# Fill in the matrix with the last iterated value 
  
} # end loop k - CO2 multipliers
final_H
final_pH

