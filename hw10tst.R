library(tidyr)
library(ggbeeswarm)
library(cowplot)
library(ggridges)
library(ggplot2)
library(tidyverse)
library(skimr)

rolling_stone <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/main/data/2024/2024-05-07/rolling_stone.csv')

str(rolling_stone)
head(rolling_stone)
skimr::skim(rolling_stone) 

colnames(rolling_stone)




rolling_stone_clean <- na.omit(rolling_stone)
geom_beeswarm(aes(color = genre), size = 2, alpha = 0.6)
scale_color_brewer(palette = "Set2")  # O elige otra paleta que prefieras
labs(
  title = "Puntuaciones de Álbumes por Artista (2020)",
  subtitle = "Visualización de datos de Rolling Stone",
  x = "Artista",
  y = "Ranking 2020",
  color = "Género"
)

rolling_stone_clean <- na.omit(rolling_stone)  # Limpiar el dataset

beeswarm_plot <- ggplot(rolling_stone_clean, aes(x = clean_name, y = rank_2020)) +  
  geom_beeswarm(aes(color = genre), size = 2, alpha = 0.6) +
  scale_color_brewer(palette = "Set2") +  # Personaliza la paleta de color
  theme_minimal() +   # Usa un tema limpio
  labs(
    title = "Puntuaciones de Álbumes por Artista (2020)",
    subtitle = "Visualización de datos de Rolling Stone",
    x = "Artista",
    y = "Ranking 2020",
    color = "Género"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(beeswarm_plot)




#################

boxplot_plot <- ggplot(rolling_stone_clean, aes(x = genre, y = rank_2020, fill = genre)) +
  geom_boxplot(outlier.colour = "red", outlier.size = 2, alpha = 0.6) +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  labs(title = "Ranking album (2020)",
       x = "Genre",
       y = "Ranking") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(boxplot_plot)

# Violin plot de rank_2020 por género
violin_plot <- ggplot(rolling_stone_clean, aes(x = genre, y = rank_2020, fill = genre)) +
  geom_violin(alpha = 0.6) +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  labs(title = "Ranking album (2020)",
       x = "Genre",
       y = "Ranking") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(violin_plot)

library(ggridges)

# Gráfico de densidad ridgeline de rank_2020 por género
ridgeline_plot <- ggplot(rolling_stone_clean, aes(y = genre, x = rank_2020, fill = genre)) +
  geom_density_ridges(alpha = 0.6) +
  scale_fill_brewer(palette = "Set2") +
  theme_minimal() +
  labs(title = "Ranking album (2020)",
       x = "Ranking",
       y = "Genre") +
  theme(axis.text.y = element_text(size = 8))

print(ridgeline_plot)




combined_plot <- plot_grid(boxplot_plot, violin_plot, labels = "AUTO")
print(combined_plot)



install.packages("waffle")

library(waffle)

# Contar la cantidad de álbumes por género
genre_counts <- table(rolling_stone_clean$genre)

# Crear el Waffle Plot
waffle_plot <- waffle(genre_counts, rows = 5, title = "Album distribution per muscial genre") +
  theme(plot.title = element_text(size = 16))

print(waffle_plot)
