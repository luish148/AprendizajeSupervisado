setwd("C:/Users/Luis/Documents/Computación/Mineria de datos/Tarea 2")
prc <- read.csv("minable.csv",stringsAsFactors = FALSE)
stringsAsFactors = FALSE
str(prc)
#prc <- prc[-1]  #remueve la primera variable(id) desde el set de datos.
table(prc$sexo)  # Nos ayuda a obtener el numero de personas(dependiendo de la variable)
prc$porSex <- factor(prc$sexo, levels = c("0","1"), labels = c("femenino", "Masculino"))
round(prop.table(table(prc$porSex)) * 100, digits = 1) #para mostrar en porcentaje

#prc <- prc[-1] #elimine diferentes variables no numéricas

normalize <- function(x) { return ((x - min(x)) / (max(x) - min(x))) } #normalizamos la data
prc_n <- as.data.frame(lapply(prc[2:43], normalize)) #set de datos normalizados
summary(prc_n$eCivil) #verificamos que el set de datos esta normalizado
summary(prc_n$escuela) #probamos con algunas variables del set de datos

prc_entrenamiento <- prc_n[1:65,]
prc_prueba <- prc_n[66:100,]

prc_entrenamiento_labels <- prc[1:65, 1] #Este codigo toma el factor sexo en la columna 1 del prc data frame
prc_prueba_labels <- prc[66:100, 1] #y crea prc_entrenamiento_labels y prc_prueba_labels data frame.

install.packages("class") #paquete instalado exitosamente
library(class)

prc_prueba_pred <- knn(train = prc_entrenamiento, test = prc_prueba,cl = prc_entrenamiento_labels, k=10)
install.packages("gmodels") #paquete instalado exitosamente
library(gmodels)

CrossTable(x=prc_prueba_labels, y=prc_prueba_pred,prop.chisq = FALSE)




