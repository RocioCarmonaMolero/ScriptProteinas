
unis <-  "UniID|Universidad de Cordoba; UniID|Universidad Politecnica de Valencia; UniID|Universidad Pompeu Fabra"

for(i in 1:length(my_list[[1]])) {
  u = my_list[[1]][i]
  s = regexec("Universidad", u)[[1]][1]
  print(substr(u, s, nchar(u)))
  
}

grepl
strsplit
regexec
substr

#leer los datos, que no tome ninguna linea como header
dat <-  read.csv("6E70ADJ0014-Alignment-HitTable.csv", header = FALSE, stringsAsFactors = F)
#sacar segunda columna, la que interesa (devuelve factores)
dat <- dat[,2] 
#convertir los elementos de dat que son factores a string 
#dat <- levels(dat)
get_IDprot(dat)


#sacar XP
for(i in 1:length(dat)) {
  c = dat[i]
  print(i)
  p = regexec("ref", c)[[1]][1]
  f = nchar(c)
  print(substr(c, p + 4, f - 1))
}

get_IDprot <- function(dat) {
  # initialize empty vector
  foo <- c()
  
  for(i in 1:length(dat)) {  #i in seq_along()
    d = dat[i]
    if(grepl(";",d) == TRUE) {
      fa = strsplit(d, ";")
      for(j in 1:length(fa[[1]])) {
        d = fa[[1]][j]
        if(grepl("XP", d) == TRUE){
          p = regexec("XP", d)[[1]][1]
        } else {
          p = regexec("NP", d)[[1]][1]
        }
        
        
        f = nchar(d) - 3
        #meter dentro de un vedtor
        
        foo <- c(foo, substr(d, p, f))
          }
    }
    
    else {
      if(grepl("XP", d) == TRUE){
        p = regexec("XP", d)[[1]][1]
      } else {
        p = regexec("NP", d)[[1]][1]
      } 
      f = nchar(d) - 3
      foo <- c(foo, substr(d, p, f))
    }
  } 
  foo
}

fuanchu <- get_IDprot()
candidatos <- c() # hacer solo una vez para crear el vector vacio
fuanchu[!fuanchu %in% candidatos]
candidatos <- c(candidatos, fuanchu[!fuanchu %in% candidatos])
  


###########
write.csv(candidatos, "candidatos.csv", row.names = F) #al acabar el dia
candidatos <- read.csv("candidatos.csv", stringsAsFactors = F) #al empezar el dia
candidatos <- candidatos$x


#caso A




#caso B (f y foo juntos)

foo <- c()

for(i in seq_along(dat)) {
  d = c()
  if(grepl(";",dat[i]) == TRUE) {
    fa = strsplit(dat[i], ";")
    for(j in seq_along(fa[[1]])) {
      d = c(d, fa[[1]][j])
    }
  } else {
    d = c(d, dat[i]) 
  }
  for(h in seq_along(d)){
    if(grepl("XP", d[h]) == TRUE){
     p = regexec("XP", d[h])[[1]][1]
    } else {
     p = regexec("NP", d[h])[[1]][1]
    } 
  } 
   f = nchar(d) - 3
   foo <- c(foo, substr(d, p, f))
 }

foo



#caso C (con funcion)
start_point <- function(d){
  if(grepl("XP", d) == TRUE){
    p = regexec("XP", d)[[1]][1]
  } else {
    p = regexec("NP", d)[[1]][1]
  } 
}
  

foo <- c()

for(i in seq_along(dat)) {  
  d = dat[i]
  if(grepl(";",d) == TRUE) {
    fa = strsplit(d, ";")
    for(j in seq_along(fa[[1]])) {
      d = fa[[1]][j]
      start_point(d)
      f = nchar(d) - 3
      foo <- c(foo, substr(d, p, f))
    }
  }
  
  else {
    start_point(d)
    f = nchar(d) - 3
    foo <- c(foo, substr(d, p, f))
  }
} 
foo