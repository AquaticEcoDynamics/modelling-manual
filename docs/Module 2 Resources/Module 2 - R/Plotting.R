# Visualise the results using ggplot
ggplot() +
  geom_line(data = model, mapping = aes(x = time, y = O2, colour = 'Oxygen (O2)'))+
  geom_line(data = model, mapping = aes(x = time, y = OM, colour = 'Organic Matter (OM)'))+
  geom_line(data = model, mapping = aes(x = time, y = NO3, colour = 'Nitrate (NO3)'))+
  geom_line(data = model, mapping = aes(x = time, y = Mn , colour = 'Manganese (Mn)'))+
  labs(x = "Time", y = "Oxidant concentration (mM)", colour = NULL) +
  theme_light()

# Next, let's plot the relative concentrations
# First, we'll need to recalculate the results into a new data frame
relConc <- data.frame(
  time = model$time,
  OM = model$OM/model$OM[1],
  O2 = model$O2/model$O2[1],
  NO3 = model$NO3/model$NO3[1],
  Mn = model$Mn/model$Mn[1]
)

ggplot() +
  geom_line(data = relConc, mapping = aes(x = time, y = O2, colour = 'Oxygen (O2)'))+
  geom_line(data = relConc, mapping = aes(x = time, y = OM, colour = 'Organic Matter (OM)'))+
  geom_line(data = relConc, mapping = aes(x = time, y = NO3, colour = 'Nitrate (NO3)'))+
  geom_line(data = relConc, mapping = aes(x = time, y = Mn , colour = 'Manganese (Mn)'))+
  labs(x = "Time", y = "Relative oxidant concentration", colour = NULL) +
  theme_light()

# Save the graph using ggsave()
ggsave(
  filename = "relative_oxidant_concentration.jpeg", # change this to .png or .pdf if you prefer!
  width = 15,
  height = 10,
  scale = 1,
  units = "cm"
)