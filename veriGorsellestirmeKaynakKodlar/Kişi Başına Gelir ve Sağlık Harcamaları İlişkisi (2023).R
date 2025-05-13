Scatter Plot

library(ggplot2)
library(ggrepel)


data <- read.csv("oecd_2023_dataset.csv")
data$Highlight <- ifelse(data$Country == "Turkiye", "Turkiye", "Diger")

# Grafik
ggplot(data, aes(
  x = Income_per_capita,
  y = Health_spending,
  color = Highlight,
  label = Country
)) +
  geom_point(size = 4, alpha = 0.8) +  
  geom_text_repel(
    size = 3,
    box.padding = 0.5,
    max.overlaps = 20,
    show.legend = FALSE
  ) +
  scale_color_manual(
    values = c("Turkiye" = "red", "Diger" = "gray50"),
    labels = c("Diger Ulkeler", "Turkiye")
  ) +
  labs(
    title = "Kişi Başına Gelir ve Sağlık Harcamaları İlişkisi (2023)",
    x = "Kişi Başına Gelir (USD)",
    y = "Sağlık Harcamaları (%GSYİH)",
    color = ""
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    panel.grid.major = element_line(color = "lightgray")
  ) +
  scale_x_continuous(labels = scales::dollar_format())