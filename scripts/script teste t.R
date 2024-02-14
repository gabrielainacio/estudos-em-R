#pacotes
if(!require(dplyr)) install.packages("dplyr") 
library(dplyr) 

if(!require(RVAideMemoire)) install.packages("RVAideMemoire") 
library(RVAideMemoire)                                        

if(!require(car)) install.packages("car") 
library(car) 

if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

if(!require(ggrastr)) install.packages("ggrastr")
library(ggrastr)


if(!require(gridExtra))install.packages("gridExtra")
library(gridExtra)

#data frame
dados <- read.csv('Banco de Dados 3.csv', sep = ';', dec = ',',
                  stringsAsFactors = T, fileEncoding = "latin1") 

glimpse (dados)
View (dados)

###############teste de normalidade########################

#Shapiro por grupo
byf.shapiro(Nota_Biol ~ Posicao_Sala, dados)
byf.shapiro(Nota_Fis ~ Posicao_Sala, dados)
byf.shapiro(Nota_Hist ~ Posicao_Sala, dados)

###############teste de homogeneidade########################

#teste de Levene 

leveneTest(Nota_Biol ~ Posicao_Sala, dados, center = mean)

leveneTest(Nota_Fis ~Posicao_Sala, dados, center = mean)

leveneTest(Nota_Hist ~Posicao_Sala, dados, center = mean)


###############teste t ########################

t.test(Nota_Biol ~Posicao_Sala, dados, var.equal=TRUE) #var.equal=TRUE diz respeito a variâncias homogêneas
t.test(Nota_Fis ~ Posicao_Sala, dados, var.equal=FALSE)
t.test(Nota_Hist ~ Posicao_Sala, dados, var.equal=FALSE)


###############boxplot ########################
dev.off()

plot1 <- ggplot(data = dados, aes(y = Nota_Biol, x = Posicao_Sala)) +
  geom_errorbar(stat = "boxplot", width = 0.2) +
  geom_boxplot_jitter(aes(fill = Posicao_Sala), width = 0.6, outlier.shape = 1, show.legend = FALSE) +
  geom_point(stat = "summary", fun = "mean", shape = 4, size = 2, color = "black") +
  labs(y = "Notas de Biologia", x = "Posição na Sala") +
  scale_fill_manual(values = c("#FFB6C1", "#FFDAB9")) +
  theme_bw() +
  theme(axis.title.x = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(t = 10)),
        axis.title.y = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(r = 5)),
        legend.text = element_text(size = 12),  
        axis.text.x = element_text(size = 12),   
        axis.text.y = element_text(size = 12)) 

plot2 <- ggplot(data = dados, aes(y = Nota_Hist, x = Posicao_Sala)) +
  geom_errorbar(stat = "boxplot", width = 0.2) +
  geom_boxplot_jitter(aes(fill = Posicao_Sala), width = 0.6, outlier.shape = 1, show.legend = FALSE) +
  geom_point(stat = "summary", fun = "mean", shape = 4, size = 2, color = "black") +
  labs(y = "Notas de História", x = "Posição na Sala") +
  scale_fill_manual(values = c("#FFB6C1", "#FFDAB9")) +
  theme_bw() +
  theme(axis.title.x = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(t = 10)),
        axis.title.y = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(r = 5)),
        legend.text = element_text(size = 12),  
        axis.text.x = element_text(size = 12),   
        axis.text.y = element_text(size = 12)) 

plot3 <- ggplot(data = dados, aes(y = Nota_Fis, x = Posicao_Sala)) +
  geom_errorbar(stat = "boxplot", width = 0.2) +
  geom_boxplot_jitter(aes(fill = Posicao_Sala), width = 0.6, outlier.shape = 1, show.legend = FALSE) +
  geom_point(stat = "summary", fun = "mean", shape = 4, size = 2, color = "black") +
  labs(y = "Notas de Física", x = "Posição na Sala") +
  scale_fill_manual(values = c("#FFB6C1", "#FFDAB9")) +
  theme_bw() +
  theme(axis.title.x = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(t = 10)),
        axis.title.y = element_text(size = 18, face = "bold", color = "#2A2D34", margin = margin(r = 5)),
        legend.text = element_text(size = 12),  
        axis.text.x = element_text(size = 12),   
        axis.text.y = element_text(size = 12))    

grid.arrange(plot1, plot2, plot3, ncol = 3)

