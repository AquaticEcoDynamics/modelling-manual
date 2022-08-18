# Constants
#K1 = [H][HCO3]/[H2CO3]; #K2 = [H][CO32]/[HCO3]
#Kw = [H][OH]/[H2O]; #KH = [H2CO3]/[CO2]
K1<-1*10^(-6.3); K2<-1*10^(-10.3); Kw<-1*10^-14; KH<- 1*10^(-1.47)
KSPCaCO3<-1*10^-8.4; Ca2<-5*10^-4

# Chemical reactions
#H2O <=> H + OH; CO2 + H2O <=> H2CO3
#H2CO3 <=> HCO3 + H; HCO3 <=> CO32 + H
#CO32 + Ca2 <=> CaCO3

# Equilibrium expressions
#H = 10^(-1*pH) ; pH = -log10(H)
#H2CO3 = KH*pCO2 
#HCO3 = K1*H2CO3 / H 
#CO32 = K2*HCO3 / H 
#omega = Ca2 * CO32 / KspCaCO3
#CT = HCO3 + CO32 + H2CO3
#Alkalinity = HCO3 + 2*CO32 + OH - H 


# Normal Calculations
pH<- 8.3
H<-    # mol L^-1
  OH<-   # mol L^-1  
  CO2<- 3.5E-4 #atm
H2CO3<-      # mol L^-1
  HCO3<-       # mol L^-1
  CO32<-       # mol L^-1
  Ca2<-5E-4    # mol L^-1
omega<-
  CT<-         # mol L^-1
  Alk<-        # mol L^-1
  
  