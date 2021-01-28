#POSTWORK SESION 1

#1.-Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace: https://www.football-data.co.uk/spainm.php

soccer <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#2.-Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)

Goles_casa<- soccer$FTHG
Goles_visitante<- soccer$FTAG

#3.- Consulta cómo funciona la función table en R al ejecutar en la consola ?table 

#Primero realicé las tablas de los goles de casa y coles de visitante
Tabla_1<- table(Goles_casa) 
Tabla_1
Tabla_2<- table(Goles_visitante)
Tabla_2
#Usando las tablas anteriores elaboré las tablas de frecuencia relativas en base a los goles
Tabla_3<- prop.table(x=Tabla_1)
Tabla_3
Tabla_4<- prop.table(x=Tabla_2)
Tabla_4



#Por ultimo, elaboré una tabla con ambos vectores, goles en casa y goles en visitantes; y posteriormente realicé una tabla de frecuencia relativa conjunta
Tabla_5<- table(Goles_casa,Goles_visitante)
Tabla_6<- prop.table(x=Tabla_5)
Tabla_6
#POSTWORK SESION 2

#Desarrollo

#Ahora vamos a generar un cúmulo de datos mayor al que se tenía, esta es una situación habitual que 
#se puede presentar para complementar un análisis, siempre es importante estar revisando las 
#características o tipos de datos que tenemos, por si es necesario realizar alguna transformación en 
#las variables y poder hacer operaciones aritméticas si es el caso, además de sólo tener presente 
#algunas de las variables, no siempre se requiere el uso de todas para ciertos procesamientos.

#Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división
#de la liga española a R, los datos los puedes encontrar en el siguiente enlace: 
# https://www.football-data.co.uk/spainm.php

SP1<- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
SP2<- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
SP3<- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#Obten una mejor idea de las características de los data frames al usar las funciones: str, head, 
#View y summary

str(SP1)
head(SP1)
View(SP1)
summary(SP1)

str(SP2)
head(SP2)
View(SP2)
summary(SP2)

str(SP3)
head(SP3)
View(SP3)
summary(SP3)

#Con la función select del paquete dplyr selecciona únicamente las columnas Date, HomeTeam, AwayTeam,
#FTHG, FTAG y FTR; esto para cada uno de los data frames. (Hint: también puedes usar lapply).
library(dplyr)

SP1<- mutate(SP1, Date = as.Date(Date, "%d/%m/%y"))
SP2<- mutate(SP2, Date = as.Date(Date, "%d/%m/%Y"))
SP3<- mutate(SP3, Date = as.Date(Date, "%d/%m/%Y"))

SP4<-list(SP1,SP2,SP3)
SPf<- lapply(SP4, select,Date, HomeTeam, AwayTeam,FTHG, FTAG, FTR)
str(SPf)

#Asegúrate de que los elementos de las columnas correspondientes de los nuevos data frames sean del 
#mismo tipo (Hint 1: usa as.Date y mutate para arreglar las fechas). Con ayuda de la función rbind 
#forma un único data frame que contenga las seis columnas mencionadas en el punto 3 
#(Hint 2: la función do.call podría ser utilizada).

LigaEspañola<- do.call(rbind,SPf)
head(data_frame)
tail(data_frame)
str(data_frame)

write.csv(LigaEspañola, "LigaEspañola.csv", row.names = FALSE)

#POSTWORK SESION 3

#Desarrollo
#Ahora graficaremos probabilidades (estimadas) marginales y conjuntas para el número de goles que 
#anotan en un partido el equipo de casa o el equipo visitante.

#Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias 
#relativas para estimar las siguientes probabilidades

LigaEspañola<- read.csv("LigaEspañola.csv")
str(LigaEspañola)
head(LigaEspañola)
View(LigaEspañola)
#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

FTHG<- table(LigaEspañola$FTHG)
(FTHG1<- prop.table(FTHG))
View(FTHG1)

dfH<-as.data.frame(FTHG1) #Creé los data frames para poder usar ggplot, ya que no puedo usarlo con una tabla

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

FTAG<- table(LigaEspañola$FTAG)
FTAG1<- prop.table(FTAG)

dfA<- as.data.frame(FTAG1)

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como 
#visitante anote y goles (x=0,1,2,, y=0,1,2,)

FTTG<-table(LigaEspañola$FTHG,LigaEspañola$FTAG)
FTTG1<- prop.table(FTTG)

dfT<- as.data.frame(FTTG1)

#Realiza lo siguiente:

#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el 
#equipo de casa.

barplot(FTHG1, main = "Probabilidad marginal FTHG", 
        xlab = "Numero de goles", 
        ylab = "Frecuencia relativa", 
        col = "Yellow")

ggplot(dfH, aes(x = Var1, y = Freq)) + 
  geom_bar(stat = "identity", col = "black", fill = "Yellow" ) +
  ggtitle("Probabilidad marginal FTHG") +
  xlab("Numero de goles") +
  ylab("Frecuencia relativa") +
  theme_grey()

#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el 
#equipo visitante.

barplot(FTAG1, main = "Probabilidad marginal FTAG",
        xlab = "Numero de goles", 
        ylab = "Frecuencia relativa",
        col = "Orange")

ggplot(dfA, aes(x = Var1, y = Freq)) +
  geom_bar(stat = "identity", col = "Black", fill = "Orange") + 
  ggtitle("Probabilidad marginal FTAG") +
  labs(x = "Numero de goles",
       y = "Frecuencia relativa") +
  theme_grey()

#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de
#casa y el equipo visitante en un partido.

library(scales)

ggplot(dfT, aes(x = Var1, y = Var2, fill = Freq)) +
  ggtitle("Probabilidad conjunta FTTG") +
  labs(x = "Goles casa",
       y = "Goles visitante") +
  geom_tile() +
  scale_fill_gradient2(low = "Black", high = "Blue", mid = "Yellow") +
  theme_dark()

#Postwork 4
#Llamamos a nuestras 3 Estimaciones.
visitante <- FTAG1
local <- FTHG1
conjunta <- FTTG1
conjunta

cocientes <- apply(conjunta, 2, function(col) col/local)
cocientes <- apply(cocientes, 1, function(fila) fila/visitante)
cocientes <- t(cocientes)
cocientes


