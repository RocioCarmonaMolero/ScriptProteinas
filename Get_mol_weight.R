weight_prot <- function(xp){
  mol_wg <- c()
  lca <- strsplit(entrez_fetch(db="protein", id=xp, rettype='gp'), "\n")
  for(i in seq_along(lca[[1]])){
    if(grepl("calculated_mol_wt", lca[[1]][i]) == TRUE){
      mol_wg <- strsplit(lca[[1]][i], "=")[[1]][2]
    }
    if((i == length(lca[[1]])) & (is.null(mol_wg))){
      mol_wg <- c("a mano")
    }
  }
  mol_wg
}
