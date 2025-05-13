Lollipop Chart

library(ggplot2)
library(dplyr)
library(ggalt)  

data <- read.csv("oecd_2023_dataset.csv") %>%
  arrange(desc(Elderly_percent)) %>%
  mutate(Country = factor(Country, levels = Country))

# Grafik
ggplot(data, aes(x = Country, y = Elderly_percent)) +
  geom_segment(aes(xend = Country, yend = 0), color = "gray70", linewidth = 1) +  
  geom_point(aes(size = Income_per_capita, color = Income_per_capita), alpha = 0.8) + 
  geom_text(aes(label = paste0(Elderly_percent, "%")), 
            hjust = -0.3, 
            size = 3.5, 
            color = "black") +  # Yaşlı nüfus yüzdesi
  coord_flip() +  # X ve Y eksenlerini ters çevir
  scale_color_gradient(low = "#FFA07A", high = "#CD5C5C", name = "Kişi Başına Gelir (USD)") + 
  scale_size_continuous(range = c(2, 8), name = "Kişi Başına Gelir (USD)") +
  labs(
    title = "Yaşlı Nufus Oranı ve Kisi Basına Gelir İliskisi (2023)",
    x = "",
    y = "Yaşlı Nufus Oranı (%)",
    caption = "Nokta boyutu ve rengi kişi başına geliri temsil eder."
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_text(size = 10),
    panel.grid.major.y = element_blank(),
    legend.position = "bottom",
    plot.title = element_text(face = "bold")
  )