#----------------------------------------------------------------------------
#Actividad Tranversal Fundamentos de R: Carga y Revisión de un dataset en R
#----------------------------------------------------------------------------

# 1 Carga de paquetes necesarios 
library(readr)   
library(dplyr)   
library(ggplot2) 

# 2 Carga del archivo 
archivo_csv <- "salarios_mujeres.csv"
salarios_mujeres <- read_csv(archivo_csv)
  
# 3 Exploración del archivo 
# 3.1 Primeras 6 filas
head(salarios_mujeres)

# 3.2 Información General
str(salarios_mujeres)

# 3.3 Dimensiones 
dim(salarios_mujeres)

# 3.4 Nombre de las columnas 
names(salarios_mujeres)

# 3.5 Resumen 
summary(salarios_mujeres)

# 3.6 Medidas de Tendencia Central 
# 3.6.1 Media
media_salarios <- mean(salarios_mujeres$Salario, na.rm = TRUE)
print(media_salarios)
media_edades <- mean(salarios_mujeres$Edad, na.rm = TRUE)
print(media_edades)
# 3.6.2 Mediana
mediana_salarios <- median(salarios_mujeres$Salario, na.rm = TRUE)
print(mediana_salarios)
mediana_edades <- median(salarios_mujeres$Edad, na.rm = TRUE)
print(mediana_edades)

# 4 Limpieza y manejo de los datos 
# 4.1 Convertir la columna de salarios a numérico
salarios_mujeres$Salario <- as.numeric(salarios_mujeres$Salario)
colSums(is.na(salarios_mujeres))
# 4.2 Eliminar valores NA 
colSums(is.na(salarios_mujeres))
salarios_sin_na <- na.omit(salarios_mujeres)
colSums(is.na(salarios_sin_na))
        
# 4.3 Filtrar valores 
salarios_filtrados <- salarios_sin_na[salarios_sin_na$Edad %in% c("20", "21", "22", "23", "24", "25", "26", "27", "28", "29"), ]
summary(salarios_filtrados)

# 5 Visulización de los datos 
# Histograma
ggplot(salarios_filtrados, aes(x = Salario)) +
  geom_histogram(binwidth = 2000, fill = "violet", color = "purple", alpha = 0.7) +
  labs(title = "Histograma de Salarios de Mujeres en sus 20's",
       x = "Salario",
       y = "Frecuencia") +
  theme_classic()

# Diagrama de dispersión
#***A consideración más apropiado para los datos 
ggplot(salarios_sin_na, aes(x = Edad, y = Salario)) +
  geom_point(color = "lightgreen", size = 2, alpha = 1) +
  labs(title = "Relación entre Edad y Salario en Mujeres",
          x = "Edad",
       y = "Salario") +
  theme_classic()

# Perfil de GitHub 
#TamaraHdez 
# ♥♥♥♥♥♥♥





