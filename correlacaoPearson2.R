#instalar pacotes
if (!require(dplyr)) install.packages("dplyr")
library(dplyr)

if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

if (!require(corrplot)) install.packages("corrplot")
library(corrplot)

#dados
mtcars
?mtcars

glimpse(mtcars)
View(mtcars)

## Normalidade (Shapiro-Wilk):
shapiro.test(mtcars$mpg)
shapiro.test(mtcars$wt)

## Presenca de outliers:
boxplot(mtcars$mpg)
boxplot (mtcars$wt)

## Relacao linear entre as variaveis:
plot(mtcars$mpg, mtcars$wt)

#Verificao dos pressupostos nos residuos

## Construcao do modelo de regressao:

mod_reg <- lm(wt ~ mpg, mtcars)

## Analise grafica:

par(mfrow=c(1,2))
plot(mod_reg, which=c(1,3))
par(mfrow=c(1,1))

## Correlacao Linear de Pearson (coeficiente = r):
cor.test(mtcars$wt, mtcars$mpg, method = "pearson")

##gráfico de dispersão 
library(scales)
library(ggpubr)


dispersao <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=mpg))+
  geom_point(size=2)+
  geom_smooth(method = "lm", se=F, color = "black", 
              size=0.7, linetype = "dashed")+
  labs(x= "Milhas por Galão", y= "Peso do Carro")+
  scale_color_gradient(low = "#D84797", high = "#FC2F00") +
  theme_bw()+
  theme(axis.title.x = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(t = 10))) +
  theme(axis.title.y = element_text(size = 13, face = "bold", 
                                    color = "#2A2D34", margin = margin(r = 10)))+
  guides(color = FALSE) 

dispersao  
ggsave("dispersaoPearson1.png", plot = dispersao, width = 10, height = 8, dpi = 200)


###############matriz de correlação##########################

matriz <- round(cor(mtcars[1:11], method = "pearson"),2)
View(matriz)

corrplot(matriz, 
         type = "upper", order = "hclust", 
         addCoef.col = "black", # adiciona o coeficiente ? matriz
         tl.col = "#2A2D34", 
         insig = "blank",
         col = colorRampPalette(c("#D84797", "#FC2F00"))(100))



