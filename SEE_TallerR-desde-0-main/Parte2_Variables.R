#Taller: R desde cero - Parte 2: Variables
#Autor: Denisse Fierro Arcos
#Fecha: 2020-10-24
#Detalles: 
#En este script mostraremos los diferentes tipos de variables disponibles en R


# Vectores ----------------------------------------------------------------
#Vector vacío
x <- vector()
x
length(x)

x <- 20
length(x)
y <- 5+(5*3)
length(y)

#Vectores con más de un elemento
x <- c(5, -10, 15)
x
length(x)
class(x)

#Creando un vector a partir de una secuencia
x <- (1:10)
x
class(x)
y <- c(-10:-1)
y
z <- c(5.5:26) 
z
class(z)

#Secuencias con incrementos distintos a uno
x <- c(5, 10, 15)
x
x1 <- seq(from = 5, to = 15, by = 5)
x1
x2 <- seq(from = 5, length.out = 3, by = 5)
x2

#Comparando resultados (booleanos)
x == x1
x == x2
z <- x == c(5:7)
z
class(z)

rm(x, y, z, x1, x2)

#Creando un vector repitiendo un número o variable
x <- rep(10, times = 4)
x
y <- rep(1:3, times = 4)
y
#Repitiendo cada elemento N número de veces
z <- rep(seq(1, 3, by = 1), each = 4)
z
#¿Son x & z iguales?
y == z

#Creando un vector basado en otros vectores
x; y; z
nuevo <- c(x, y, z)
nuevo
length(nuevo)

nuevo2 <- c(x, rep(y, 3))
nuevo2

nuevo3 <- c(y, rep(10:14, each = 3))
nuevo3

#Uso de booleanos
nuevo3 > 10
nuevo3 < 10
nuevo3 != 10

rm(nuevo, nuevo2, nuevo3)

#Operaciones con vectores
x <- seq(from = 5, to = 15, by = 5)
x
x*5
(10*x)^2
x*pi
sqrt(x)
x * c(1:3)
x * c(1:2)
rm(x, y, z)


#Vectores con caracteres
nombres <- c("Laura", "Pedro", "Cecilia", "Ximena")
length(nombres)


# Matrices ----------------------------------------------------------------
#Creando una matriz basada en una sequencia
#Podemos definir el numero de filas
x <- matrix(1:30, nrow = 5)
x
length(x)
dim(x)
class(x)
#Definiendo el numero de columnas
y <- matrix(seq(2,100, by = 5), ncol = 10)
y
dim(y)
#O podemos definir ambos: filas y columnas
z <- matrix(rep(10, 20), ncol = 5, nrow = 4)
z
#Podemos definir si la matriz es llenada por columnas o filas
matrix(1:30, nrow = 5, byrow = FALSE) #por columna
matrix(1:30, nrow = 5, byrow = T) #por file

#Podemos crear matrices basadas en vectores existentes
x <- seq(1:50)
x
xMat <- matrix(x, nrow = 10) #ordenadas por columna
xMat
xMatFila <- matrix(x, nrow = 10, byrow = T) #ordenadas por fila
xMatFila

#Podemos combinar matrices para crear matrices mas grandes
#Una sobre otra con rbind()
xFila <- rbind(xMat, xMatFila)
xFila
#Una al lado de la otra con cbind()
xCol <- cbind(xMat, xMatFila)
xCol


# Cambiando el nombre de columnas y filas ---------------------------------
xCol
colnames(xCol)
colnames(xCol) <- c("Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis",  "Siete",
                    "Ocho", "Nueve", "Diez")
colnames(xCol)
xCol

rownames(xCol)
rownames(xCol) <- c("uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", 
                    "ocho", "nueve", "diez")
rownames(xCol)
xCol


# Data frames -------------------------------------------------------------
#Creando un data frame vacio
df <- data.frame()

#Creando un data frame con varias columnas
df <- data.frame(ID = c(1:5), 
                 Nombres = c("Elena", "Isabela", "Juan", "Pedro", "Lola"),
                 Edades = c(rep(30, 3), 15, 18))
df
dim(df)
class(df)
str(df)

#Creando data frame basado en otros vectores
ID <- c(1:5)
Nombres <- c("Elena", "Isabela", "Juan", "Pedro", "Lola")
Edades <- c(rep(30, 3), 15, 18)
ID; Nombres; Edades
#Uniendo todos los vectores
df1 <- data.frame(ID, Nombres, Edades)
df1

#Comprobando si los dos data frames son iguales
df == df1

#Podemos cambiar los nombres de las columnas al crear el data frame con vectores
colnames(df1)
df1 <- data.frame(Identificacion = ID, Nombre = Nombres, Edad = Edades)
df1

#Tambien podemos cambiar los nombres despues de crear el data frame
colnames(df)
colnames(df) <- c("id", "nombre", "edad")
colnames(df)


# Factores ----------------------------------------------------------------
#Nos permite agregar información de manera fácil
Ciudad <- c(rep("Santa Cruz", 3), "Guayaquil", "Quito")
Ciudad
class(Ciudad)
Ciudad <- factor(Ciudad)
Ciudad
class(Ciudad)
levels(Ciudad)

#Podemos agregar una columna adicional como lo hicimos con las matrices
df <- cbind(df, Ciudad)
df
class(df)
str(df)

#Alternativamente podemos crear una columna adicional de la siguiente manera
df$Ciudad2 <- Ciudad
df


# Listas ------------------------------------------------------------------
Encuesta <- list(ID = ID,
                 Nombres = Nombres,
                 Participantes = 5,
                 Casado = c(T, F, F, T, NA),
                 Ciudad = Ciudad,
                 Encuestador = c("Lisa", "Jorge"))
Encuesta
class(Encuesta)
#Número de elementos incluidos en una lista
length(Encuesta)

