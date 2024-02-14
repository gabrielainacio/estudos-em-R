
install.packages("geobr")
library(geobr)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
install.packages("sf")
library(sf)
install.packages("readr")
library(readr)


install.packages("devtools")
devtools::install_github("ipeaGIT/geobr" , subdir = "r-package")

##DADOS PARA MAPA DE JOINVILLE NO geobr
br = read_country()
estado = read_state()

read_municipality(code_muni = 'SC')
sc.m = read_municipality(code_muni = 4209102)

##LER DADOS
dados <- read.csv("enderecos00 (1).csv", sep = ";")
glimpse(dados)
View(dados)

##MUDAR OS DADOS DE chr PARA dbl
dados <- dados %>%
  mutate(
    LATITUDE = parse_number(gsub("\\.", "", LATITUDE, fixed = TRUE)) ,
    LONGITUDE = parse_number(gsub("\\.", "", LONGITUDE, fixed = TRUE)) 
  )

# Criar um objeto sf para os dados
dados_sf <- st_as_sf(dados, coords = c("LONGITUDE", "LATITUDE"))

# Definir o CRS os dados
dados_sf <- st_set_crs(dados_sf, st_crs(sc.m))

#transformar os dados
dados_sf <- st_transform(dados_sf, crs = st_crs(sc.m))


##MAPA COM OS DADOS
mapa <- ggplot() +
  geom_sf(data = sc.m, fill = gray(0.85), color = gray(0.7)) +
  geom_sf(data = dados_sf, color = "red", size = 2.5) +
  labs(title = 'Distribuição das Obras em Joinville')
print(mapa)

##MAPA SEM OS DADOS
mapa <- ggplot ()+
  geom_sf(data = sc.m,
          fill=gray(0.85),
          color=gray(0.7)) +
  labs(title='Distribuição das Obras em Joinville')
mapa
          
# Para verificar os limites gráficos
st_bbox(dados_sf)
st_bbox(sc.m)


# Verificar a projeção de dados_sf
st_crs(dados_sf)

# Verificar a projeção de sc.m
st_crs(sc.m)

dados_sf
sc.m







