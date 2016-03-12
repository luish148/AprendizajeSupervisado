#paquetes necesarios para que el código corra, no volver a ejecutar
install.packages('curl')

# Seleccionar google_api.R en su sistema de archivos
source(file.choose())

origen = c("Via Paolo Emilio", "Vancouver BC", "Seattle")
destino =c("Piazzale Aldo Moro", "San Francisco", "Victoria BC")

# Colocar su API Key 
api_key = "AIzaSyDRdw1yFZTk1jBVqOre2IHs5B8h21xYAc0"

api_url = get_url(origen, destino, api_key)




#################################  Agregado desde aquí  #################################


datos = get_data(api_url)
names(datos)
datos
datos$rows


data = toJSON(datos)
data

result = parse_data(datos)
result

result[1]$distance.text[1]

result[1,2]
result[1,1]
result[1,1,1]



l <- list(a = list(var.1 = 1, var.2 = 2, var.3 = 3)
          , b = list(var.1 = 4, var.2 = 5, var.3 = 6)
          , c = list(var.1 = 7, var.2 = 8, var.3 = 9)
          , d = list(var.1 = 10, var.2 = 11, var.3 = 12)
)

library (plyr)
df <- ldply (l, data.frame)

require(tidyr)



