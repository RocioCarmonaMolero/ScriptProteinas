weight_prot <- function(lca)
  
for(i in seq_along(lca[[1]])){
  if(grepl("calculated_mol_wt", lca[[1]][i]) == TRUE){
    mol_wg <- strsplit(lca[[1]][i], "=")[[1]][2]
  }
}
