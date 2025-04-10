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


# --- Obtener los parámetros de máxima verosimilitud para la normal ---
meanML <- normPars$estimate["mean"]  # Media estimada
sdML <- normPars$estimate["sd"]      # Desviación estándar estimada

# --- Crear una secuencia de valores para el eje x ---
xval <- seq(0, max(z$Leaf_size_cm, na.rm = TRUE), length.out = length(z$Leaf_size_cm))  # Cambié "myVar" a "Leaf_size_cm"

# --- Añadir la función de densidad al gráfico ---
stat <- stat_function(fun = dnorm, colour = "red", args = list(mean = meanML, sd = sdML))

# --- Agregar la función de densidad al histograma ---
p1 + stat


#####
# --- Obtener los parámetros de máxima verosimilitud para la normal ---
meanML <- normPars$estimate["mean"]  # Media estimada
sdML <- normPars$estimate["sd"]      # Desviación estándar estimada

# --- Crear una secuencia de valores para el eje x ---
xval <- seq(0, max(z$Leaf_size_cm, na.rm = TRUE), length.out = length(z$Leaf_size_cm))  # Cambié "myVar" a "Leaf_size_cm"

# --- Graficar el histograma y la curva de densidad normal ---
p1 <- ggplot(data=z, aes(x=Leaf_size_cm, y=..density..)) +  
  geom_histogram(color="grey60", fill="cornsilk", size=0.2, bins=30) +  # Puedes ajustar el número de bins aquí
  labs(title="Leaf morphology Mickelia nicotianifolia", 
       x="Leaf size (cm)", 
       y="Density") +  
  theme_minimal() + 
  geom_density(linetype="dotted", size=0.75) +  # Añadir la densidad empírica
  stat_function(fun = dnorm, 
                args = list(mean = meanML, sd = sdML), 
                colour = "red", 
                size = 1)

# --- Mostrar el gráfico ---
print(p1)

#22222
# --- Obtener los parámetros de máxima verosimilitud para la normal ---
meanML <- normPars$estimate["mean"]  # Media estimada
sdML <- normPars$estimate["sd"]      # Desviación estándar estimada

# --- Crear un gráfico con el histograma y añadir la curva de densidad normal ---
p1 <- ggplot(data=z, aes(x=Leaf_size_cm)) +  # Especificar solo la variable en aes() para el histogram
  geom_histogram(aes(y = ..density..), color="grey60", fill="cornsilk", 
                 size=0.2, bins=30) +  # Usar density aquí
  labs(title="Leaf morphology Mickelia nicotianifolia", 
       x="Leaf size (cm)", 
       y="Density") +  
  theme_minimal() + 
  geom_density(aes(y = ..density..), linetype="dotted", size=0.75) +  # Curva de densidad empírica
  stat_function(fun = dnorm, 
                args = list(mean = meanML, sd = sdML), 
                colour = "red", 
                size = 1)

# --- Mostrar el gráfico ---
print(p1)

# --- Ajustar una distribución exponencial ---
expoPars <- fitdistr(z$Leaf_size_cm, "exponential")  # Cambié "myVar" por "Leaf_size_cm"
rateML <- expoPars$estimate["rate"]  # Tasa estimada

# --- Crear una secuencia de valores para el eje x ---
xval <- seq(0, max(z$Leaf_size_cm, na.rm = TRUE), length.out = length(z$Leaf_size_cm))  # Cambié "myVar" por "Leaf_size_cm"

# --- Añadir la función de densidad exponencial al gráfico ---
stat2 <- stat_function(fun = dexp, 
                       args = list(rate = rateML), 
                       colour = "blue", 
                       size = 1)

# --- Graficar el histograma, la curva de densidad normal, y la curva de densidad exponencial ---
p_combined <- p1 + stat2  # Aquí p1 es el gráfico existente que ya tiene la curva normal
print(p_combined)

# --- Añadir la función de densidad uniforme al gráfico ---
# Usar los valores mínimos y máximos de tus datos como parámetros
min_val <- min(z$Leaf_size_cm)
max_val <- max(z$Leaf_size_cm)

# --- Crear la función de densidad uniforme ---
stat3 <- stat_function(fun = dunif, 
                       args = list(min = min_val, max = max_val), 
                       colour = "darkgreen", 
                       size = 1)

# --- Graficar el histograma, la curva de densidad normal, la exponencial y la uniforme ---
p_final <- p_combined + stat3  # Aquí p_combined es el gráfico con la normal y la exponencial
print(p_final)

# --- Ajustar la distribución gamma ---
gammaPars <- fitdistr(z$Leaf_size_cm, "gamma")  # Ajustando la gamma a la variable Leaf_size_cm
shapeML <- gammaPars$estimate["shape"]  # Parámetro de forma estimado
rateML <- gammaPars$estimate["rate"]    # Parámetro de tasa estimado

# --- Añadir la función de densidad gamma al gráfico ---
stat4 <- stat_function(fun = dgamma, 
                       args = list(shape = shapeML, rate = rateML), 
                       colour = "brown", 
                       size = 1)

# --- Graficar el histograma, las curvas de densidad normal, exponencial, uniforme y gamma ---
p_final <- p_final + stat4  # Aquí p_final es el gráfico con la normal, la exponencial y la uniforme
print(p_final)


# --- Ajustar y graficar la densidad beta ---

# 1. Crear un nuevo gráfico con datos escalados entre 0 y 1
pSpecial <- ggplot(data=z, aes(x=Leaf_size_cm/(max(Leaf_size_cm) + 0.1), y=..density..)) +  # Cambié "myVar" a "Leaf_size_cm"
  geom_histogram(color="grey60", fill="cornsilk", size=0.2, bins=30) +  # Histogram
  xlim(c(0,1)) +
  geom_density(size=0.75, linetype="dotted")  # Densidad empírica

# 2. Ajustar la distribución beta a los datos escalados
betaPars <- fitdistr(x=z$Leaf_size_cm/max(z$Leaf_size_cm + 0.1), start=list(shape1=1, shape2=2), "beta")  
shape1ML <- betaPars$estimate["shape1"]  # Parámetro de forma 1 estimado
shape2ML <- betaPars$estimate["shape2"]  # Parámetro de forma 2 estimado

# 3. Agregar la función de densidad beta al gráfico
statSpecial <- stat_function(fun = dbeta, 
                             args = list(shape1=shape1ML, shape2=shape2ML), 
                             colour = "orchid", 
                             size = 1)

# 4. Graficar la distribución beta sobre el histograma
pSpecial + statSpecial


# --- Ajustar y graficar la densidad beta ---

# 1. Crear un nuevo gráfico con datos escalados entre 0 y 1
pSpecial <- ggplot(data=z, 
                   aes(x=Leaf_size_cm/(max(Leaf_size_cm) + 0.1))) +  # Cambié "myVar" a "Leaf_size_cm"
  geom_histogram(aes(y = ..density..), color="grey60", fill="cornsilk", size=0.2, bins=30) +  # Histogram
  xlim(c(0,1)) +
  geom_density(size=0.75, linetype="dotted")  # Densidad empírica

# 2. Ajustar la distribución beta a los datos escalados
betaPars <- fitdistr(x=z$Leaf_size_cm/max(z$Leaf_size_cm + 0.1), start=list(shape1=1, shape2=2), "beta")  
shape1ML <- betaPars$estimate["shape1"]  # Parámetro de forma 1 estimado
shape2ML <- betaPars$estimate["shape2"]  # Parámetro de forma 2 estimado

# 3. Agregar la función de densidad beta al gráfico
statSpecial <- stat_function(fun = dbeta, 
                             args = list(shape1=shape1ML, shape2=shape2ML), 
                             colour = "orchid", 
                             size = 1)

# 4. Graficar la distribución beta sobre el histograma
pSpecial + statSpecial
##############
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
