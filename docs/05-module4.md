# Module 4: Oceanic pH Calculation {-} 



```r
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
#H2CO3 = KH*pCO2 = CT*alpha0
#HCO3 = K1*H2CO3 / H = CT*alpha1
#CO32 = K2*HCO3 / H = CT*alpha2
#omega = Ca2 * CO32 / KspCaCO3
#CT = HCO3 + CO32 + H2CO3
#Alkalinity = HCO3 + 2*CO32 + OH - H = CT*(alpha1 + 2*alpha2) + OH - H
#alpha0 = (1 + K1/H + K2*K2/H^2)^-1
#alpha1 = (H/K1 + 1 + K2/H)^-1
#alpha2 = ((H^2)/(K1*K2) + H/K2 + 1)^-1

# Normal Calculations
pH<- 8.3
H<-    # mol L^-1
OH<-   # mol L^-1  
CO2<- 3.5E-4 #atm
alpha0<-     # mol L^-1
alpha1<-     # mol L^-1
alpha2<-     # mol L^-1
H2CO3<-      # mol L^-1
HCO3<-       # mol L^-1
CO32<-       # mol L^-1
Ca2<-5E-4    # mol L^-1
omega<-
CT<-         # mol L^-1
Alk<-        # mol L^-1
```
