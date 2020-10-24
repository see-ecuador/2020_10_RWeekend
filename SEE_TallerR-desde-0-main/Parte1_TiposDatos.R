#Taller: R desde cero - Parte 1: Tipos de datos
#Autor: Denisse Fierro Arcos
#Fecha: 2020-10-24
#Detalles: 
#En este script veremos los diferentes tipos de datos que podemos manipular
#en R. Practicaremos también cómo crear variables.

# Caracteres --------------------------------------------------------------
"Joaquín"
"Este es un conjunto de caracteres"

# Datos numéricos ---------------------------------------------------------
#Revisemos qué tipo de dato es el numero 5
class(5)
#¿Qué clase de dato es un decimal?
class(20.89)
#¿Cómo podemos decirle a R que reconozca un número como entero?
10L
#Revisemos el tipo de dato
class(10L)
#¿Qué pasa si fuerzo a R a que reconozca un número decimal como entero?
class(10.8L)
#Revisemos números complejos
#Los números complejos están representados por un número real y un número imaginario
30+2i
class(30+2i)

# Datos lógicos ------------------------------------------------------------
#Verdadero
TRUE
class(TRUE)
#Falso
FALSE
class(FALSE)


# Asignando datos a una variable ------------------------------------------
#Forma sencilla utilizando <-
x <- "Bobby"
x
class(x)

nombres <- "Lisa, Joaquín y Bobby"
nombres
class(nombres)

x <- -2L
x
class(x)

y <- 6.8
y
class(y)

z <- 10i
z
class(z)

respuesta <- T
respuesta
class(respuesta)

#Utilizando la función assign
assign("nombres", "Lisa, Homero, Marge, Bart")
nombres
class(nombres)

#Borremos las variables que no vamos a utilizar
rm(x, y, z, nombres, respuesta)


# Cálculos con datos numéricos --------------------------------------------
#Podemos realizar operaciones numéricas como una calculadora
2+5
2*5
2/5
sqrt(5)
sqrt(5)+2


# Cálculos utilizando valores de variables existentes -------------------
x <- 2L
y <- 5.5
x+y
class(x+y)

x*x
x^2
class(x*x)
class(x^2)

#Operaciones más complejas
(x+y)*(-x)
x+y*(-x)

#Operaciones con números imaginarios
sqrt(-1)
sqrt(-1+0i)
class(sqrt(-1+0i))

#Operaciones con números imaginarios
z <- 30+2i
x+z
class(x+z)

#Operaciones con datos lógicos o booleanos
a <- F
a*5

b <- T
b*10

(a*5)+(b*10)

# Asignando resultados de cálculos a variables ----------------------------
#A una nueva variable
resultado <- y*x
resultado

#Actualizando el valor de una variable existente
x
x <- x^3
x

y
y <- y/-resultado
y

rm(a, b, resultado, x, y, z)


# Valores numéricos especiales --------------------------------------------
#Inf - Infinito
x <- 15/0
x
class(x)

#NaN - No es un número
y <- 0/0
y
class(y)


# Ejemplos de uso de datos booleanos o de tipo lógico ---------------------
x <- -5
y <- 20
#Preguntamos si una condición es cierta o falsa
x < y
y <= 15
#Podemos guardar el resultado de esa pregunta en una variable
z <- x == 10
z