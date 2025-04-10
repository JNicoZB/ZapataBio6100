z <- read.table("Mickelia_nicot_datos.csv", header=TRUE, sep=",")
str(z)         # Muestra la estructura del conjunto de datos
summary(z)    # Muestra un resumen estadístico

library(ggplot2)



p1 <- ggplot(data=z, aes(x=Leaf_size_cm, y=..density..)) +  # Reemplaza con la variable deseada
  geom_histogram(color="grey60", fill="cornsilk", size=0.2) +
  labs(title="Leaf morphology Mickelia nicotianifolia", 
       x="Leaf size(cm)", 
       y="Density") +  # Etiquetar el eje y como Densidad
  theme_minimal()  # Aplicar un tema minimalista
print(p1)  # Imprimir el gráfico


  
p1 <-  p1 +  geom_density(linetype="dotted",size=0.75)
print(p1)


library(MASS)

# Ajustar una distribución normal a los datos
normPars <- fitdistr(z$Leaf_size_cm, "normal")  # Reemplaza Leaf_size_cm si es necesario

# Imprimir los parámetros ajustados
print(normPars)

# Ver la estructura de los resultados
str(normPars)

# Obtener la media
mean_estimate <- normPars$estimate["mean"]
print(mean_estimate)  # Mostrar la media


meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]

xval <- seq(0, max(z$Leaf_size_cm), len = 100)

normPars <- fitdistr(z$Leaf_size_cm, "normal")
meanML <- normPars$estimate["mean"]
sdML <- normPars$estimate["sd"]
xval <- seq(0, max(z$Leaf_size_cm), len = 100)


######
p1 <- p1 + stat_function(fun = dnorm, 
                         args = list(mean = meanML, sd = sdML), 
                         colour = "red", 
                         size = 1) 
print(p1)
