
# dATA vISUALIZATION 3 DE ENERO DE 2022 -----------------------------------

library(tidyverse)

# VERSIÓN CON LA QUE SE HIZO EL ANÁLISIS ----------------------------------

# tidyverse 1.3.1 --
#v ggplot2 3.3.5     v purrr   0.3.4
#v tibble  3.1.6     v dplyr   1.0.7
#v tidyr   1.1.4     v stringr 1.4.0
#v readr   2.1.1     v forcats 0.5.1

# CARGA  - LIMPIEZA 

# PREGUNTA ----------------------------------------------------------------
# Los autos con un motor más grande consumen más combustible que los autos con un
# motor más pequeño

# La relación consumo/tamaño es lineal? No es lineal? Es exponencial?
# Es positiva? es negativa?

#ggplot2::mpg

View(mpg)
# ayuda
?mpg #help(mpg)
# displ: tamaño del motor rn litros
# hwy: número de millas recorridas en autopista por galón de combustible (3,785411784 litros)

# PLOT --------------------------------------------------------------------
ggplot(data = mpg) +
  geom_point(mapping = aes(x=displ, y = hwy)) 

# Se observa una relación negativa entre el tamaño del motor y la eficiencia 
# energética del combustible
# Cuanto mayor es el tamaño del motor menos millas recorridas con un galón de gasolina


# PLANTILLA PATA HACER UNA REPRESENTACIÓN GRÁFICA CON GGPLOT --------------


# ggplot(data = <DATA_FRAME>) +
#   <GEOM_FUCNTION>(mapping =aes(x =, y =))


# T1 ----------------------------------------------------------------------
# Carga de mpg 
ggplot(data=mpg)

# Número de filas y columnas del dataframe
dim(mpg)

str(mpg$drv)
?mpg
# drv = the type of drive train, where f = front-wheel drive, 
# r = rear wheel drive, 4 = 4wd

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = cty))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = class, y = drv))
# El gráfico no aporta información relevante
