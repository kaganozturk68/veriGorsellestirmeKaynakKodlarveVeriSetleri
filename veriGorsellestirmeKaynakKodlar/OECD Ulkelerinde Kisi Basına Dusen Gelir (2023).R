Bar Plot

library(ggplot2)
library(dplyr)
library(scales)  # Sayı formatı için 

# Veriyi yükleme ve gelire göre sıralama
data <- read.csv("oecd_2023_dataset.csv") %>%
  arrange(desc(Income_per_capita)) %>%
  mutate(Country = factor(Country, levels = Country))  # Sıralamayı sabitleme

# Grafik
ggplot(data, aes(
  x = reorder(Country, Income_per_capita),  # Gelire göre sıralama
  y = Income_per_capita,
  fill = Country == "Turkiye" 
)) +
  geom_col(width = 0.7) +
  geom_text(
    aes(label = paste0(round(Income_per_capita), " USD")),
    hjust = -0.1,  
    size = 3,
    color = "black"
  ) +
  coord_flip() +
  labs(
    title = "OECD Ulkelerinde Kisi Basına Dusen Gelir (2023)",
    x = "",
    y = "Kişi Başına Gelir (USD)",
    fill = ""
  ) +
  scale_fill_manual(
    values = c("#E0E0E0", "#FF6B6B"),  
    labels = c("Diger Ulkeler", "Turkiye")
  ) +
  scale_y_continuous(
    labels = scales::dollar_format(),  # USD formatı
    expand = expansion(mult = c(0, 0.2))  
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",  
    panel.grid.major.y = element_blank(), 
    axis.text.x = element_text(angle = 0, hjust = 1)
  )