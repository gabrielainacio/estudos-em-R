
library(ggplot2)

amor = "Cheiro Cheiroso"

#data frame
k = seq(0, 2*pi, pi/60)
mydata = data.frame(
  x = 16*sin(k)^3 +25,
  y = 13*cos(k) - 5*cos(2*k) - 2*cos(3*k) - cos(4*k) +20
)

cheiro<- ggplot(data = mydata, aes(x, y)) +
  geom_polygon(aes(group = 1), fill = "#D81E5B") +
  geom_text(aes(x = 25, y = 20, label = "Feliz Aniversário!"),
            size = 8, colour = "white") +
  geom_text(aes(x = 15, y = 5, label = paste("To :", amor)),
            size = 5, colour = "#2A2D34")+
  theme_classic()
cheiro

ggsave("cartao.png", plot = cheiro, width = 10, height = 8, dpi = 300)
