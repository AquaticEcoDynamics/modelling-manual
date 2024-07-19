# Fixed values
CO2<- 3.5E-4
Ca2<-5E-4
pH<-c(4,5,6,7,8,9,10,11,12)

# Declare NULL for things in the for loop
# You need to declare all the looped variables as NULL
H<-NULL
OH<-NULL
pOH<-NULL  

# The for loop
for(i in 1:length(pH)){
  H[i]<-10^(-1*pH[i])
  OH[i]<-Kw/H[i]
  #   H2CO3[i]<-
  #   HCO3[i]<-
  #   CO3[i]<-
  
  logH[i] <- log10(H[i])
  logOH[i]<- log10(OH[i])
  # logH2CO3[i]<- log10(H2CO3[i])
  # logHCO3[i] <- log10(HCO3[i])  
  # logCO3[i]  <- log10(CO32[i])
}# End for i loop

#png(file="loglog.png")
plot(pH,logH
     ,col="white"
     ,ylab = "log of concentration"
     ,ylim=c(-12, 12)
)
lines(pH,logH,col="black")
text(11.5,11,"H+",col="black")
lines(pH,logOH,col="blue")
text(4.5,10.5,"OH-",col="blue")
#dev.off()

