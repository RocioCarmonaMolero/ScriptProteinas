#previous and posterior step, primping the csv data file from the Blast search
> dat <-  read.csv( cicer_D9V2GJ7401R-Alignment-HitTable.csv , header = FALSE, stringsAsFactors = F)
 
> dat <- dat[,2]
 
> IDprot <- get_IDprot(dat, 2)
 
> candidatos <- c(candidatos, IDprot[!IDprot %in% candidatos])


#function itself
get_IDprot <- function(dat, puntocorte){
  
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
    f = nchar(d) - puntocorte
    foo <- c(foo, substr(d, p, f))
  }
  foo <- unique(foo)
  foo
} 
