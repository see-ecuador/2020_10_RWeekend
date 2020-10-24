#Taller: R desde cero - Parte 3: Subconjunto de datos
#Autor: Denisse Fierro Arcos
#Fecha: 2020-10-24
#Detalles: 
#En este script mostraremos cómo acceder a un subconjunto de datos

# Accediendo elementos específicos de un vector ---------------------------
nombres <- c("Laura", "Pedro", "Cecilia", "Ximena")
nombres[4]
nombres[1:2]
nombres[c(1,3)]
nombres[c(1,3:4)]
nombres[-2]

#Cambiando un elemento
nombres[4] <- "Jorge"
nombres
#Aumentando un elemento
nombres[5] <- "Marina"
nombres
nombres[6:7] <- c("Isabel", "Estela")
nombres
nombres[9] <- "Julio"
nombres
#NA significa que ese elemento no tiene un valor asignado
rm(nombres)

#Podemos hacer lo mismo con vectores numéricos
x <- seq(from = 5, to = 15, by = 5)
x
x[1] <- 30
x


# Accediendo elementos de la matriz ---------------------------------------
xFila <- matrix(seq(1:50), nrow = 10)
#Por filas
xFila
xFila[1,]
xFila[1:3,]
xFila[c(1, 5),]
rownames(xFila) <- c("uno", "dos", "tres", "cuatro", "cinco", "seis",
                     "siete", "ocho", "nueve", "diez")
xFila["uno",]

#Por columna
xFila[,1]
xFila[,3:5]
xFila[,c(2, 4)]
colnames(xFila) <- c("Uno", "Dos", "Tres", "Cuatro", "Cinco")
xFila[,"Uno"]

#Por elemento
xFila[1,5]
xFila[10,3]
xFila["cuatro", "Tres"]
xFila[10, "Tres"]

#Podemos reemplazar los valores de elementos específicos
xFila
xFila[1,] <- 3
xFila
xFila[,1] <- rep(1:5, 2)
xFila
xFila[3,5] <- 100
xFila
xFila["cuatro", "Tres"] <- 350
xFila

#Podemos también cambiar el nombre de una columna o fila específica
colnames(xFila)[5]
colnames(xFila)[5] <- "CINCO"
colnames(xFila)
rm(xFila, x)


# Accediendo elementos en un data frame -----------------------------------
df <- data.frame(ID = c(1:5), 
                 Nombres = c("Elena", "Isabela", "Juan", "Pedro", "Lola"),
                 Edades = c(rep(30, 3), 15, 18),
                 Ciudad = c(rep("Santa Cruz", 3), "Guayaquil", "Quito"))
#Reemplazando contenido de un elemento
df$Edades[3] <- NA
df

#Accedemos elementos de la misma manera que con las matrices
#Fila 1
df[1,]
#Columna 3 (edad)
df[,3]
#También podemos utilizar el nombre de la columna para acceder elementos del data frame
df$Edades
df["Edades"]
#Fila 1, columna 2 (nombre)
df[1, 2]
df$nombre[1]
df[1, "nombre"]

#Agregando/resumiendo información basado en la columna de factores (ciudad)
table(df$Ciudad)
table(df['Ciudad'])
table(df[,4])


# Accediendo elementos en una lista ---------------------------------------
Encuesta <- list(ID = c(1:5),
                 Nombres = c("Elena", "Isabela", "Juan", "Pedro", "Lola"),
                 Participantes = 5,
                 Casado = c(T, F, F, T, NA),
                 Ciudad = c(rep("Santa Cruz", 3), "Guayaquil", "Quito"),
                 Encuestador = c("Lisa", "Jorge"))

#Acceder a elementos de una lista
Encuesta$Participantes
Encuesta[['Participantes']]
Encuesta[3]

#Acceder a un subelemento en una lista - Tercer elemento en Ciudad
Encuesta$Ciudad[3]
Encuesta[['Ciudad']][3]

#Número de elementos dentro de un elemento de la lista
length(Encuesta$Encuestador)
length(Encuesta$Nombres)

#Cambiar contenido de un elemento de la lista
Encuesta$ID <- seq(1, 16, by = 3)
Encuesta

#Agregando un nuevo elemento a la lista
Encuesta$ID2 <- c(1:5)

#Cambiar contenido de un sub-elemento de la lista
Encuesta$Encuestador[2] <- "Pedro"
Encuesta

#Accediendo nombres de los elementos de la lista y cambiandolos
names(Encuesta)
names(Encuesta)[1] <- "Identificación"
names(Encuesta)


# Operadores relacionales -------------------------------------------------
#Llamamos a bibliotecas relevantes para este taller
library(tidyverse)

# Accediendo a subconjunto de datos ---------------------------------------
#Primero vamos a acceder a datos de Partidos de las Copas del Mundo de Fútbol
#(1930 a 2018) disponibles en Datos de Miercoles. Mas informacion aqui: 
#https://github.com/cienciadedatos/datos-de-miercoles/tree/master/datos/2019/2019-04-10

#Aqui le damos el vinculo donde los datos estan guardados y a traves de delim le 
#decimos que el delimitador utilizado en esta base de datos en un tab
df <- read_delim("https://bit.ly/31wcrt9", delim = "\t") %>% 
  #Aqui especificamos que queremos que sea guardado como un data frame
  data.frame()

#Veamos su estructura
str(df)
#Tambien podemos ver solo el nombre de las columnas
colnames(df)

#Queremos acceder a datos para partidos desde el 2014 en adelante
df$anio >= 2014
#Pero si quiero saber exactamente que filas cumplen este requisito agrego which()
which(df$anio >= 2014)
#Puedo utilizar este resultado como listado de las filas que quiero ver
head(df[which(df$anio >= 2014),])
head(df[df$anio >= 2014,])

#Si quiero solo los elementos de ciertas columnas, simplemente agrego las columnas
#que me interesan
#Por ejemplo, quiero saber los equipos que se enfrentaron (equipo_1 y equipo_2) en el
#mundial celebrado en Inglaterra
df$anfitrion == "Inglaterra"
df$equipo_1
df[df$anfitrion == "Inglaterra", c("equipo_1", "equipo_2")]
df[which(df$anfitrion == "Inglaterra"), 7:8]

# Subconjuntos con operadores logicos -------------------------------------
#Queremos acceder a los partidos en los que participo Ecuador desde el 2010

#Dividamos esto por partes
#Primero accedemos a los partidos despues del 2010
df$anio > 2010
df$anio >= 2011
head(df[df$anio > 2010,])

#Como identificamos los partidos donde jugo Ecuador
df$equipo_1 == "Ecuador"
df[df$equipo_1 == "Ecuador",]
df$equipo_2 == "Ecuador"
df[df$equipo_2 == "Ecuador",]

#Ahora unimos, Ecuador debe aparecer en equipo_1 o en equipo_2
df$equipo_1 == "Ecuador" | df$equipo_2 == "Ecuador"
df[df$equipo_1 == "Ecuador" | df$equipo_2 == "Ecuador",]

#Finalmente agregamos el anio
df$equipo_1 == "Ecuador" | df$equipo_2 == "Ecuador" & df$anio > 2010
df[df$anio > 2010 & (df$equipo_1 == "Ecuador" | df$equipo_2 == "Ecuador"),]

# Subconjuntos de datos utilizando subset() -------------------------------
#Queremos acceder a los partidos en los que participo Brasil desde el 2010
#Ademas, solo estamos interesados en acceder las siguientes columnas: anio,
#anfitrion, estadio, ciudad, fecha, equipo_1 y equipo_2
TotalPartidos <- subset(df, subset = anio >= 2010 & 
                          (equipo_1 == "Brasil" | equipo_2 == "Brasil"), 
                        select = c(anio:ciudad, fecha:equipo_2))
