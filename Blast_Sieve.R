eliminate <-  c()
for(i in 1:nrow(families)){
  if(families[i,]$identity < 39.5 || families[i,]$lenquery < families[i,]$lenhit){
    eliminate <- c(eliminate, i)
  }
}
data_fam <- families[-eliminate, ]
