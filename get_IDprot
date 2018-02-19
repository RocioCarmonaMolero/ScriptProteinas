get_IDprot <- function(dat){
  
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
}
