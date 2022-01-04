
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
#   <GEOM_FUCNTION>(mapping = aes(x =, y =))


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

# COLOR DE LOS PUNTOS
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy, col=class))

# TAMAÑO DE LOS PUNTOS (Conviene que la variable sea numérica)
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy, size=class))

# alpha -> transparencia )opacidad)  de los puntos
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy, alpha=class))

# Forma de los puntos (ggplot solo genera 6 formas a la vez)
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy, shape = class))

# Elección manual de estéticas
ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy), color="red")

# color, 
# shape = forma del punto con números desde el 0 al 25
# 0 - 14 formas sin relleno y por tanto se les puede camboar solo el color
# 15 - 20 formas rellenas por lo tanto se puede cambiar el color
# 21 - 25 formas con bordes y relleno -> se puede cambiar el color borde y fill (relleno) 
d=data.frame(p=c(0:25,32:127))
ggplot() +
  scale_y_continuous(name="") +
  scale_x_continuous(name="") +
  scale_shape_identity() +
  geom_point(data=d, mapping=aes(x=p%%16, y=p%/%16, shape=p), size=5, fill="red") +
  geom_text(data=d, mapping=aes(x=p%%16, y=p%/%16+0.25, label=p), size=3)


ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy), shape = 23, size = 3, color ="darkgreen", fill ="gold")

ggplot(data = mpg) +
  geom_point(mapping = aes(x= displ, y=hwy, col= displ < 4))
# stroke modifica el ancho del borde

?ggplot
df <- data.frame(
  gp = factor(rep(letters[1:3], each = 10)),
  y = rnorm(30)
)

plot(df)

ds <- do.call(rbind, lapply(split(df, df$gp), function(d) {
  data.frame(mean = mean(d$y), sd = sd(d$y), gp = d$gp)
}))

ds1 <- plyr::ddply(df,"gp", plyr::summarise, mean=mean(y), sd=sd(y))

# FACETS ------------------------------------------------------------------

# facet_wrap(~<VARIABLE>): La variable debe ser discreta, categoría
ggplot(mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, col=class)) +
  facet_wrap(~ class, nrow = 2)

# facet_wrap(~<VARIABLE>): con variable continua NO ES VÁLIDO
ggplot(mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, col=class)) +
  facet_wrap(~ cty, nrow = 2)

# geom -> relacionado con la geometría
# facet -> relacionado con la distribución 


# facet_wrap(<VARIABLE1>~<VARIABLE2>): La variable debe ser discreta
ggplot(mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, col=class)) +
  facet_grid(drv~cyl)

# facet_wrap(.~<VARIABLE2>): La variable debe ser discreta
ggplot(mpg) +
  geom_point(mapping = aes(x = displ , y = hwy, col=class)) +
  facet_grid(.~cyl)