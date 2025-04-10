z <- read.table("TRICHOMANES_PUNCTATUM_SSP.csv",header=TRUE,sep=",")
str(z)
summary(z)

print(z)

is.na(z)

library(skimr)
z <- na.omit(z)
skim(z)

str(z)
head(z)
library(ggplot2)
library(MASS)
p1 <- ggplot(data=z, aes(x=ibi)) + 
  geom_histogram(aes(y=...density..), color="grey60", fill="cornsilk", size=0.2)
print(p1)

z <- read.table("TRICHOMANES_PUNCTATUM_SSP.csv", header=TRUE, sep=",", skip=5)

getwd()
list.files()
setwd("/Users/jnzapata/Desktop/2projects rstudio comp bio/Test1/TRICHOMANES_PUNCTATUM_SPP.csv")

library(ggplot2)

p2 <- ggplot(data=z, aes(x=Longitude, y=Latitude)) +
  geom_point(color="cornsilk", size=1) +
  labs(title="Puntos de muestreo",
       x="Longitud",
       y="Latitud") +
  theme_minimal()

print(p2)

# Paso 1: Cargar los datos (ajusta "skip" según sea necesario para tu archivo)
z <- read.table("TRICHOMANES_PUNCTATUM_SSP.csv", header=TRUE, sep=",", skip=5)

# Paso 2: Echar un vistazo a los datos
str(z)

# Paso 3: Crear un histograma de la variable 'Latitude'
p1 <- ggplot(data=z, aes(x=Latitude)) +
  geom_histogram(binwidth=0.01, color="grey60", fill="cornsilk", size=0.2) +
  labs(title="Histograma de Latitud",
       x="Latitud",
       y="Frecuencia") +
  theme_minimal()

# Imprimir el histograma
print(p1)

sum(is.na(z$Latitude))
z_clean <- na.omit(z)  # Eliminando filas con NA
# O también puedes usar dplyr
library(dplyr)
z_clean <- z %>% filter(!is.na(Latitude))

p1 <- ggplot(data=z_clean, aes(x=Latitude)) +
  geom_histogram(binwidth=0.01, color="grey60", fill="cornsilk", size=0.2) +
  labs(title="Histograma de Latitud",
       x="Latitud",
       y="Frecuencia") +
  theme_minimal()

# Imprimir el histograma
print(p1)

p1 <- ggplot(data=z_clean, aes(x=Latitude)) +
  geom_histogram(aes(y=after_stat(density)), 
                 binwidth=0.01, 
                 color="grey60", 
                 fill="cornsilk", 
                 size=0.2) +
  geom_density(linetype="dotted", size=0.75) +  # Añadir la curva de densidad
  labs(title="Histograma de Latitud con Curva de Densidad",
       x="Latitud",
       y="Densidad") +
  theme_minimal()
print(p1)
