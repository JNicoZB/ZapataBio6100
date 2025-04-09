library(skimr)
library(tidyverse)
habit_id <- c("terrestrial", "climber", "reophytic")
leave_size <- c(round(rnorm(12, mean=20)))
print(leave_size)

lamina_width <- c(runif(12, min = 10, max = 16))
print(lamina_width)

number_of_pinnae <- c(round(runif(12, min = 1, max = 5)))
print(number_of_pinnae)

petiole_length <- c(round(rnorm(12, mean=9)))
print(petiole_length)

data.frame(habit_id,leave_size,petiole_length,lamina_width,number_of_pinnae) -> mickelia_spp

view(mickelia_spp)
skim(mickelia_spp)

library(ggplot2)
mickelia_data <- mickelia_spp %>%
  pivot_longer(cols = c(leave_size, petiole_length, lamina_width, number_of_pinnae),
               names_to = "variable",
               values_to = "value")
ggplot(mickelia_data, aes(x = habit_id, y = value, fill = habit_id)) + 
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") + 
  theme_minimal() +
  labs(title = "Morfological changes in Mickelia",
       x = "Habit",
       y = "Values",
       fill = "Habit")

ggplot(mickelia_data, aes(x = habit_id, y = value, color = variable)) + 
  geom_point(position = position_jitter(width = 0.2), size = 3) +  
  theme_minimal() +
  labs(title = "Morfological changes in leaves of Mickelia specimens",
       x = "Hábitat",
       y = "Valor") +
  scale_color_manual(values = c("leave_size" = "blue", 
                                "petiole_length" = "red", 
                                "lamina_width" = "green", 
                                "number_of_pinnae" = "orange"))

ggplot(mickelia_data, aes(x = habit_id, y = value, fill = habit_id)) + 
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") + # Facetas para cada variable
  theme_minimal() +
  labs(title = "Comparación de Variables por Hábitat",
       x = "Hábitat",
       y = "Valor")

ggplot(mickelia_data, aes(x = variable, y = value, fill = habit_id)) + 
  geom_boxplot(position = "dodge") +  # Posicionamiento dodged para evitar superposición
  theme_minimal() +
  labs(title = "Comparación de Variables por Hábitat",
       x = "Variables",
       y = "Valor") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rota las etiquetas del eje x para una mejor legibilidad

ggplot(mickelia_data, aes(x = value, fill = habit_id)) + 
  geom_histogram(position = "identity", bins = 10, alpha = 0.6, color = "black") +  # Histogramas
  facet_wrap(~ variable, scales = "free") +  # Facetas para cada variable
  theme_minimal() +
  labs(title = "Leaf morphology in Mickelia nicotianifolia complex",
       x = "Value",
       y = "Frequency")

manova_result <- manova(cbind(leave_size, petiole_length, lamina_width, number_of_pinnae) ~ habit_id, data = mickelia_spp)
summary(manova_result)



ggplot(mickelia_spp, aes(x = habit_id, y = leave_size)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Leave Size vs. Hábitat",
       x = "Habit",
       y = "Leaves size") +
  theme_minimal()


## 
results <- data.frame(sample_size = integer(),
                         p_valor = numeric(),
                         efecto_tamano = numeric())



for (sample_size in seq(5, 30, by = 5)) {
  # Crear datos simulados
  set.seed(123)  # Para reproducibilidad
  habit_id <- rep(c("terrestrial", "climber", "reophytic"), length.out = sample_size)
  leave_size <- rnorm(sample_size, mean = 20)
  
  # Crear un data frame
  mickelia_spp <- data.frame(habit_id, leave_size)
  
  # Realizar ANOVA
  anova_result <- aov(leave_size ~ habit_id, data = mickelia_spp)
  
  # Guardar el p-valor
  p_valor <- summary(anova_result)[[1]]$`Pr(>F)`[1]  # Extraer el p-valor
  
  # Estimar efecto tamaño (diferencia entre medias)
  size_efect <- abs(mean(leave_size[habit_id == "climber"]) - mean(leave_size[habit_id == "terrestrial"]))
  
  # Almacenar resultados
  results <- rbind(results, data.frame(sample_size, p_valor, size_efect))
}
 
print(results)
str(results)
head(results)





# Cargar librerías
library(tidyverse)

# Inicializar un data frame vacío para almacenar resultados
resultados <- data.frame(tamano_muestra = integer(),
                         p_valor = numeric(),
                         detectable = logical())

# Definir parámetros de la distribución gamma
alpha1 <- 2  # Parámetro de forma para grupo 1
beta1 <- 3   # Parámetro de escala para grupo 1
alpha2 <- 3  # Parámetro de forma para grupo 2
beta2 <- 2   # Parámetro de escala para grupo 2

# Establecer un rango de tamaños de muestra
num_simulaciones <- 100  # Número de simulaciones para cada tamaño de muestra

for (tamano_muestra in seq(5, 50, by = 5)) {
  exitos <- 0  # Contador para éxitos en detectar el efecto
  
  for (simulacion in 1:num_simulaciones) {
    set.seed(simulacion)  # Para reproducibilidad en cada simulación
    
    # Generar datos desde la distribución gamma para dos grupos
    grupo1 <- rgamma(tamano_muestra / 2, shape = alpha1, scale = beta1)
    grupo2 <- rgamma(tamano_muestra / 2, shape = alpha2, scale = beta2)
    
    # Crear un data frame
    habit_id <- rep(c("grupo1", "grupo2"), each = tamano_muestra / 2)
    leave_size <- c(grupo1, grupo2)
    mickelia_spp <- data.frame(habit_id, leave_size)
    
    # Realizar ANOVA
    anova_result <- aov(leave_size ~ habit_id, data = mickelia_spp)
    
    # Guardar el p-valor
    p_valor <- summary(anova_result)[[1]]$`Pr(>F)`[1]  # Extraer el p-valor
    
    # Verificar si el p-valor es significativo
    if (p_valor < 0.05) {
      exitos <- exitos + 1  # Contar ejercicio exitoso
    }
  }
  
  # Almacenar el resultado del tamaño de muestra y si se detectó el efecto
  detectable <- exitos > 0  # Al menos un éxito en detectar el efecto
  resultados <- rbind(resultados, data.frame(tamano_muestra, p_valor = NA, detectable))
}

# Ver los resultados
print(resultados)


#####
pairs(mickelia_spp[, c("leave_size", "petiole_length", "lamina_width", "number_of_pinnae")],
      col = as.numeric(factor(mickelia_spp$habit_id)))

head(mickelia_data)
str(mickelia_data)
anova_results <- mickelia_data %>% group_by(variable) %>% summarise(anova_summary = list(summary(aov(value ~ habit_id, data = cur_data()
print(anova_results)
anova_results   




mickelia_data$habit_id <- as.factor(mickelia_data$habit_id)
str(mickelia_data)
anova_results <- mickelia_data %>%
  group_by(variable) %>%
  summarise(anova_result = list(summary(aov(value ~ habit_id, data = cur_data()))))
print(anova_results)


# regresion
regression_model <- lm(leave_size ~ habit_id, data = mickelia_spp)
summary(regression_model)

ggplot(mickelia_spp, aes(x = habit_id, y = leave_size)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Leave size vs Habit",
       x = "Habit",
       y = "Leave size") +
  theme_minimal()

umbral <- mean(mickelia_spp$leave_size, na.rm = TRUE)
mickelia_spp <- mickelia_spp %>%
  mutate(leave_size_cat = ifelse(leave_size > umbral, "alta", "baja"))

modelo_logistica <- glm(leave_size_cat ~ habit_id, data = mickelia_spp, family = binomial)
summary(modelo_logistica)

tabla_contingencia <- table(mickelia_spp$habit_id, mickelia_spp$leave_size_cat)
prop.table(tabla_contingencia)

library(ggmosaic)
library(ggplot2)
umbral <- mean(mickelia_spp$leave_size, na.rm = TRUE)
mickelia_spp <- mickelia_spp %>%
  mutate(leave_size_cat = ifelse(leave_size > umbral, "alta", "baja"))

mickelia_spp$leave_size_cat <- as.factor(mickelia_spp$leave_size_cat)
ggplot(data = mickelia_spp, aes(x = product(habit_id, leave_size_cat))) +
  geom_mosaic() +
  labs(title = "Tabla de Contingencia entre Hábitat y Tamaño de Hojas Categórico",
       x = "Hábitat y Tamaño de Hojas",
       y = "Proporción") +
  theme_minimal()

set.seed(123)  # Asegúrate de que puedes reproducir los resultados
resultados <- replicate(100, {
  datos_simulados <- mickelia_spp[sample(nrow(mickelia_spp), size = nrow(mickelia_spp), replace = TRUE), ]
  modelo <- lm(leave_size ~ habit_id, data = datos_simulados)
  summary(modelo)$coefficients
})
set.seed(456)  # Para reproducibilidad
muestreo <- replicate(50, {
  muestra <- mickelia_spp[sample(nrow(mickelia_spp), size = 100, replace = TRUE), ]  
  modelo <- lm(leave_size ~ habit_id, data = muestra)
  summary(modelo)$coefficients
})

library(boot)
funcion_bootstrap <- function(data, indices) {
  d <- data[indices, ]  
  modelo <- lm(leave_size ~ habit_id, data = d)  
  return(coef(modelo))  
}  
set.seed(789)
resultado_bootstrap <- boot(data = mickelia_spp, statistic = funcion_bootstrap, R = 1000)
resultados_df <- as.data.frame(resultados)
print(resultados_df)
boxplot(resultados_df, main = "Varialidad de Coeficientes", xlab = "Variables", ylab = "Valores")
