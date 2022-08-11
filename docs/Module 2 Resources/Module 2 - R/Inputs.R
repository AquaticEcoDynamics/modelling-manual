# Load packages
# If you don't have the tidyverse packaged installed run: install.packages("tidyverse")
library(tidyverse)

# Create new variables for the time parameters
timeLength <- 1/365 
timeSteps <- 1000 # i.e. 1000 permutations

# Set the constants
kOM <- 1 # The kinetic rate constant of the reaction y^-1
KO2 <- 20 # Monod constant
KNO3 <- 10 # Monod constant
KMn <- 30 # Monod constant

# Create a new data frame of zeros
# Not sure what rep() does? Read it's documentation in RStudio' Help tab
model <- data.frame(
  time = rep(0,timeSteps),
  OM = rep(0,timeSteps),
  O2 = rep(0,timeSteps),
  NO3 = rep(0,timeSteps),
  Mn = rep(0,timeSteps),
  ROM = rep(0,timeSteps),
  RO2 = rep(0,timeSteps),
  RNO3 = rep(0,timeSteps),
  RMn = rep(0,timeSteps)
)

# Set the initial time. [1] means at the first record (i.e. timestep 1)
model$time[1] <- timeLength

# Set the initial concentrations
model$OM[1] <- 100 #mM
model$O2[1] <- 30 #mM
model$NO3[1] <- 35 #mM
model$Mn[1] <- 30 #mM

# Set the initial rates, which in this case is zero
model$ROM[1] <- 0 #mM y^-1
model$RO2[1] <- 0 #mM y^-1
model$RNO3[1] <- 0 #mM y^-1
model$RMn[1] <- 0 #mM y^-1

# Have a look at the now initalised data frame
# head() prints the 'head' of the data frame i.e. the first few rows
head(model)