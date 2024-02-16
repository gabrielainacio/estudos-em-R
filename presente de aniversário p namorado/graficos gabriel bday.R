###### Análise por Mês#############
library(ggplot2)
if(!require(dplyr))
  install.packages("dplyr")
library(dplyr)

dados2 <- read.csv2('te amo.csv', stringsAsFactors = T,
                   fileEncoding = "latin1")
glimpse(dados2)
dados2$data <- as.Date(dados2$data, format = "%d/%m/%Y")

dados2$MesAno <- format(dados2$data, "%Y-%m")

dados2$dia_semana <- weekdays(dados2$data)

grafico_mes <- ggplot(dados2, aes(x = MesAno)) +
  geom_bar(fill = "#ACECF7") +
  labs(title = "Eu te amo no wpp por Mês", x = "Mês e Ano", y = "Quantidade") +
  theme_bw() +
  theme(axis.title.x = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(t = 10))) +
  theme(axis.title.y = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(r = 10)))
grafico_mes
ggsave("grafico_mes.png", plot = grafico_mes, width = 10, height = 8, dpi = 300)


###### Análise por dia da semana#############

dados2$dia_semana <- weekdays(dados2$data)

grafico_dia_semana <- ggplot(dados2, aes(x = dia_semana)) +
  geom_bar(fill = "#FFB7C3", color = "black") +
  labs(title = "Eu te amo no wpp por Dia da Semana", x = "Dia da Semana", y = "Quantidade") +
  theme_bw() +
  theme(axis.title.x = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(t = 10))) +
  theme(axis.title.y = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(r = 10)))

grafico_dia_semana
ggsave("grafico_dia.png", plot = grafico_dia_semana, width = 10, height = 8, dpi = 300)

###### média de eu te amo por dia###########

dados2$contagem_diaria <- 1

dados_diarios <- aggregate(contagem_diaria ~ data, data = dados2, sum)

media <- mean(dados_diarios$contagem_diaria)

cat("Média: ", media, "\n")

dados2$contagem_diaria <- 1

dados_diarios <- aggregate(contagem_diaria ~ data, data = dados2, sum)

grafico_diario <- ggplot(dados_diarios, aes(x = data, y = contagem_diaria)) +
  geom_bar(stat = "identity", fill = "#EAC435", color = "black") +
  labs(title = "Quantidade de 'Eu Te Amo' por Dia", x = "Data", y = "Quantidade Diária") +
  theme_bw() +
  theme(axis.title.x = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(t = 10))) +
  theme(axis.title.y = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(r = 10)))

grafico_diario
ggsave("grafico_diario.png", plot = grafico_diario, width = 10, height = 8, dpi = 300)

dados2$contagem_diaria <- 1
dados_diarios <- aggregate(contagem_diaria ~ data, data = dados2, sum)

#dia com a maior quantidade de 'eu te amo'
dia_maior_quantidade <- dados_diarios[which.max(dados_diarios$contagem_diaria), "data"]


dia_maior_quantidade
