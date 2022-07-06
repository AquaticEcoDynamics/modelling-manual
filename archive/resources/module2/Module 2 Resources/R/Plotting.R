#
#Make a .png
#png(filename="Oxidants.png", width=160,height=120,res=500,units="mm")
#Plot the variables
plot(Time,O2/O2[1],col="red",ylab="Relative oxidant concentration")
points(Time,NO3/NO3[1],col="blue")
points(Time,Mn/Mn[1],col="green")
points(Time,OM/OM[1],col="purple")
#Close the .png 
#dev.off()