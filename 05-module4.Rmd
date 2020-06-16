# Module 4: Oceanic pH Calculation {-} 

### Objectives {-}

- Calculate the carbonate species distribution given pH and CO~2~ (gas)
- Build a double-log plot based on a range of pHs
- Calculate the pH change and CaCO~3~ solubility given an increased atmospheric CO~2~.
- Replot other published data for comparison with our data

### Overview {-}
In this exercise, we create a simple model of the ocean, with a limited number of state variables. We examine the chemical interactions that result from atmospheric CO~2~ gas dissolving in water, along with calcium salts in the ocean fed by erosion of minerals on the land. The key overall process is that dissolved CO~2~ and Ca^2+^ are in equilibrium with solid CaCO3 (limestone).

The major variables are given in Table 1. Given any two of the variables on the left hand column, the other four can be calculated. 

<center>
![CC BY 3.0, https://en.wikipedia.org/w/index.php?curid=32829631](images/05-module4/picture1.jpg){width=650px}
</center>


### Exercise 1 {-}
In the first exercise, we set pH to be 8.3 and atmospheric CO~2~ gas to be 3.5×10^-4^ atmospheres, and calculate the other variables based on these two. CO~2~ gas dissolves in water according to equation \@ref(eq:module4-1). The dissolved CO~2~ easily dissociates into carbonic acid according to equation \@ref(eq:module4-2). For simplicity, we will go straight from atmospheric CO~2~ to H~2~CO~3~*, which is the sum of dissolved CO~2~ and carbonic acid, using equation \@ref(eq:module4-3). 

<center>
<br>
\begin{equation}
{CO}_{2\ \left(\text{gas}\right)}\rightleftarrows{CO}_{2\ \left(\text{dissolved}\right)}		
(\#eq:module4-1)
\end{equation}
</center>

<center>
\begin{equation}
{CO}_{2\ \left(\text{dissolved}\right)}+H_2O\rightleftarrows H_2{CO}_3	
(\#eq:module4-2)
\end{equation}
</center>

<center>
\begin{equation}
{CO}_{2\ \left(gas\right)}+H_2O\rightleftarrows H_2CO_3^\ast \hspace{3em} KH = 3.39×10-2
(\#eq:module4-3)
\end{equation}
</center>

The carbonic acid dissociates into a hydrogen ion (H+, or proton) and a bicarbonate ion 
(HCO3-), according to equation (4). The bicarbonate further dissociates into carbonate (CO32-) and another hydrogen ion, as shown in equation (5). The release of these two hydrogen ions is what creates the acidity of the ocean.
H_2CO_3^\ast\rightleftarrows HCO_3^-+H^+	K1 = 5×10-7	(4)

HCO_3^-\rightleftarrows{CO}_3^{2-}+H^+	K2 = 5×10-11	(5)

Total carbon, CT, is defined as the sum of these carbonate species. Alkalinity is defined as the sum of the charged carbonate species and the balance of hydrogen ions and hydroxide (OH-), as shown in equations (6) and (7). (Remember that alkalinity is the opposite of acidity.)
C_T=\left[{HCO}_3^-\right]+\left[{CO}_3^{2-}\right]+\left[H_2{CO}_3^\ast\right]
		(6)

\left[Alk\right]=\left[{HCO}_3^-\right]+2\left[{CO}_3^{2-}\right]+\left[{OH}^-\right]-\left[H^+\right]		(7)

The concentration of hydroxide can be found by rearranging equation (8) to equation (9) and using the dissociation constant of water, KW, and the hydrogen ion concentration.
\left[{OH}^-\right][H^+]=Kw
KW = 1×10-14	(8)

\left[{OH}^-\right]=Kw[H+]
	(9)

Open the Excel spreadsheet or R project and examine the tab or script ‘Initial CO2’. The chemical equations and constants are given to you already. The variables that we are forcing to be constant in Excel are coloured grey. Enter the equations for Normal calculations into the yellow boxes.
If we assume that calcium ion concentration does not vary much in this system, we can force it to be 5×10-4 mol L-1. Calcium carbonate (CaCO3) precipitation or dissolution is governed by the ratio (\mathrm{\Omega}) of Ca2+ concentration and CO32- concentration to the solubility constant, Ksp, according to equations (10) and (11). If \mathrm{\Omega} is greater than 1, then precipitation is favourable, and conversely, if \mathrm{\Omega} is less than 1, dissolution is favourable. 
{CO}_3^{2-}+{Ca}^{2+}\rightleftarrows CaCO_3	Ksp = 1\times10-8.4	(10)

\mathrm{\Omega}=[Ca2+][CO32-][Ksp CaCO3]
	(11)


Have a good think about this: given these CO2 and pH, did your calculations lead to a system that favours CaCO3 dissolution or precipitation? 

















### Appendix – Equation list {-}

<center>
<br>
\begin{equation}
{CO}_{2\ \left(gas\right)}\rightleftarrows{CO}_{2\ \left(dissolved\right)}	\\

{CO}_{2\ \left(dissolved\right)}+H_2O\rightleftarrows H_2{CO}_3	\\

{CO}_{2\ \left(gas\right)}+H_2O\rightleftarrows H_2CO_3^\ast	KH = 3.39×10-2	\\

H_2CO_3^\ast\rightleftarrows HCO_3^-+H^+	K1 = 5×10-7	\\

HCO_3^-\rightleftarrows{CO}_3^{2-}+H^+	K2 = 5×10-11	\\

C_T=\left[{HCO}_3^-\right]+\left[{CO}_3^{2-}\right]+\left[H_2{CO}_3^\ast\right] \\
	

\left[Alk\right]=\left[{HCO}_3^-\right]+2\left[{CO}_3^{2-}\right]+\left[{OH}^-\right]-\left[H^+\right] \\		

\left[{OH}^-\right][H^+]=Kw KW = 1×10-14	\\

\left[{OH}^-\right]=Kw[H+]\\

{CO}_3^{2-}+{Ca}^{2+}\rightleftarrows CaCO_3	Ksp = 1\times10-8.4	\\

\mathrm{\Omega}=[Ca2+][CO32-][Ksp CaCO3]\\


{\left[H^+\right]^2C}_T=H_2{CO}_3^\ast\left(\left[H^+\right]^2+K_1\left[H^+\right]+K_1K_2\right)	\\

		
\left[H^+\right]=\sqrt[2]{\frac{H_2{CO}_3^\ast}{C_T}\left(\left[H^+\right]^2+K_1\left[H^+\right]+K_1K_2\right)}	\\

\end{equation}
</center>
<br>
	

