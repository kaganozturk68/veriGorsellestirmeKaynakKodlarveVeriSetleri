Dot Plot Ar-Ge

library(ggplot2)
library(dplyr)
library(scales)

data <- read.csv("oecd_2023_dataset.csv") %>%
  mutate(
    Highlight = ifelse(Country == "Turkiye", "Turkiye", "Diger"),
    R_D_spending = R_D_spending * 100  
  )

# Grafik
ggplot(data, aes(
  x = Income_per_capita,
  y = reorder(Country, Income_per_capita),
  size = R_D_spending,
  color = Highlight
)) +
  geom_point(alpha = 0.8) +
  scale_color_manual(
    values = c("Turkiye" = "#FF0000", "Diger" = "#333333"),
    labels = c("Diger Ulkeler", "Turkiye")
  ) +
  scale_size_continuous(
    range = c(2, 8),
    name = "Ar-Ge Harcamaları (%GSYİH)"
  ) +
  labs(
    title = "Ar-Ge Harcamaları ve Kisi Basina Gelir İliskisi (2023)",
    x = "Kişi Başına Gelir (USD)",
    y = "",
    color = ""
  ) +
  theme_minimal() +
  theme(
    panel.grid.major.y = element_line(color = "#F0F0F0"),
    axis.text.y = element_text(size = 10),
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14)
  ) +
  scale_x_continuous(labels = dollar_format())