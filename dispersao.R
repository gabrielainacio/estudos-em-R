# Carregar pacotes
if(!require(pacman)){install.packages("pacman")}

pacman:: p_load(ggplot2, dplyr, scales, ggpubr)

#carregar dataset
dados <- read.csv2("LucroFilmes.csv", stringsAsFactors = T)

#visualizar tipo de variaveis
glimpse (dados)

#mudar variavel DataLancamento para data

dados$DataLancamento <- as.Date(dados$DataLancamento, format = "%m/%d/%Y")

View(dados)

#gráfico de dispersão

dispersao <- ggplot(data = dados, aes(x = LucroLocal, y = LucroMundial, color = LucroLocal)) +
  geom_point(size = 1.5) +
  geom_smooth(method = "lm", se = F, color = "black", 
              size = 0.7, linetype = "dashed") + #adicionar linha de tendencia
  labs(x = "Lucro Local (US$)", y = "Lucro Mundial (US$)") +
  scale_x_continuous(labels = number_format(accuracy = 1, big.mark = ".", 
                                            scale = 1e-6, suffix = " M")) + #altera o formato dos numeros nos eixos 
  scale_y_continuous(labels = number_format(accuracy = 1, big.mark = ".", 
                                            scale = 1e-6, suffix = " M")) +
  scale_color_gradient(low = "#D84797", high = "#FC2F00") +  
  theme_bw() +
  theme(axis.title.x = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(t = 10))) +
  theme(axis.title.y = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(r = 10)))+
  guides(color = FALSE) 

ggsave("dispersao.png", plot = dispersao, width = 10, height = 8, dpi = 300)
