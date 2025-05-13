Çevresel Sürdürülebilirlik Dot Plot

library(ggplot2)
library(dplyr)
library(ggrepel)  
library(scales)   


data <- read.csv("oecd_2023_dataset.csv") %>%
  mutate(
    Highlight = ifelse(Country == "Turkiye", "Turkiye", "Diger"),
    Environmental_spending = Environmental_spending * 100  
  )

# Grafik
ggplot(data, aes(
  x = Income_per_capita,
  y = Environmental_spending,
  color = Highlight,
  label = Country
)) +
  geom_point(size = 5, alpha = 0.8) +
  geom_text_repel(
    size = 3.5,
    box.padding = 0.5,
    max.overlaps = 20,
    show.legend = FALSE
  ) +
  scale_color_manual(
    values = c("Turkiye" = "#FF0000", "Diger" = "#333333"),
    labels = c("Diger Ulkeler", "Turkiye")
  ) +
  labs(
    title = "Cevresel Surdurulebilirlik Harcamaları ve Kisi Basına Gelir (2023)",
    x = "Kisi Basına Gelir (USD)",
    y = "Cevresel Harcamalar (%GSYİH)",
    color = "",
    caption = "Kaynak: OECD 2023 Veri Seti"
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    panel.grid.major = element_line(color = "#F0F0F0"),
    plot.title = element_text(face = "bold", size = 14)
  ) +
  scale_x_continuous(labels = dollar_format()) +
  scale_y_continuous(labels = function(x) paste0(x, "%"))