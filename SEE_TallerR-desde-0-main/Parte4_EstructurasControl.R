#Taller: R desde cero - Parte 4: Estructuras de control
#Autor: Denisse Fierro Arcos
#Fecha: 2020-10-24
#Detalles: En este script veremos estructuras de control: bucles (for, while)


# Bibliotecas -------------------------------------------------------------
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

TotalPartidos <- subset(df, subset = anio >= 2010 & 
                          (equipo_1 == "Brasil" | equipo_2 == "Brasil"), 
                        select = c(anio:ciudad, fecha:equipo_2))

# If, else (Si, de otra manera) -------------------------------------------
#Queremos utilizar la clasificacion muy bueno, bueno y malo a los
#equipos de futbol basados en el numero de veces que han jugado en un mundial
#Definimos que malo es un equipo que solo aparece tres veces o menos, bueno si aparece 
#hasta 15 veces y muy bueno si aparece mas de 15 veces
if(nrow(TotalPartidos) <= 3){
  print("Malo")
}else if(nrow(TotalPartidos) > 3 & nrow(TotalPartidos) <= 15){
  print("Bueno")
}else{
  print("Muy bueno")
}

#Aplicando if else en vectores
if(df$equipo_1_final == 0){
  print("Malo")
}else if(df$equipo_1_final !=0){
  print("Bueno")
}
#No nos da el resultado esperado

#Podemos intentar utilizar ifelse()
ifelse(test = df$equipo_1_final == 0, yes = "Malo", no = "Bueno")


# Bucles con For ----------------------------------------------------------
#Ejemplo simple
Vec <- c(10:20)
Vec
length(Vec)

#Para programar nuestro bucle necesitamos un contador, lo llamaremos i
for(i in Vec){
  print(i)
}

for(i in 1:10){
  print(i)
}

for(i in 1:length(Vec)){
  print(i)
}

#Podemos agregar mas operaciones
for(i in Vec){
  j <- i*2
  print(j)
}

#Puedo guardar los resultados en un vector
#Creemos un vector vacio
NuevoVec <- vector()

#Ahora corramos el mismo bucle, pero con unos ligeros cambios
for(i in 1:10){
  #El i provee el indice del elemento dentro del vector
  NuevoVec[i] <- i*2
}
NuevoVec

#Podemos tambien hacer guardar resultados en un data frame
#Supongamos que queremos crear una columna llamada ID para identificar las filas
#de nuestro data frame TotalPartidos
for(i in 1:nrow(TotalPartidos)){
  TotalPartidos$ID[i] <- i
}
head(TotalPartidos)


# Bucles con while --------------------------------------------------------
#Queremos imprimir los equipos que se enfrenran en las 5 primeras filas de nuestro 
#data frame TotalPartidos

#Primero creamos un contador
i <- 10
#Ahora creamos nuestro bucle
while(i <= 50){
  print(df[i,c("equipo_1", 'equipo_2')])
  i <- i+10
}


# Bucles con break y next -------------------------------------------------
#Equivalente a lo que intentamos anteriormente
for(i in 3:length(TotalPartidos$anio)){
  if(i > 5){
    break
  } else{print(TotalPartidos[i,c("equipo_1", 'equipo_2')])
  }}

#Queremos correr un bucle si nuestro contador es mayor a 10, pero queremos pararlo 
#si es igual a 15
i <- nrow(TotalPartidos)
while(i > 10){
  print(TotalPartidos[i,])
  if(i == 15){
    break
  }
  print(TotalPartidos[i,])
  i <- i-1
}

#Queremos correr el bucle solo si el contador es un numero par
#Podemos identificar un numero par utilizando %%. Esto nos dara el resto de la division

#Por ej., el resto de 10 dividido para dos es 0. Esto se representa
500%%2
#Ahora revisemos el resto de 11/2
1071%%2
#Los numeros pares siempre tendran 0 como resto cuando son dividos para dos

#Ahora armemos el bucle
for(i in 1:length(TotalPartidos$anio)){
  #Si la condicion que es si el resto del numero divido para dos NO es cero, debemos
  #saltar este paso (next)
  if(i%%2 != 0){
    next
  }
  #Si la condicion no se cumple entonces la operacion abajo se realiza
  print(TotalPartidos[i,])
}

#Podemos juntar while y next Por ej, quiero imprimir las 5 primeras filas, pero
#solo si su ID es impar
for(i in TotalPartidos$ID){
  #Si el ID es par entonces seguir al siguiente paso
  if(i%%2 == 0){
    next
  }
  #Si el ID es mayor a 5 romper
  if(i > 5){
    break
  }
  #En cualquier otro caso imprimir
  print(TotalPartidos[i,])
}


# Bucles con repeat -------------------------------------------------------
#Si nuevamente queremos solamente mostrar el contenido de las cinco primeras filas de
#nuestro data frame
i <- 1
repeat{
  print(TotalPartidos[i,])
  i <- i+1
  if(i > 5){
    break
  }
}
