


#leer los datos, que no tome ninguna linea como header
dat <-  read.csv("6E70ADJ0014-Alignment-HitTable.csv", header = FALSE, stringsAsFactors = F)
#sacar segunda columna, la que interesa (devuelve factores)
