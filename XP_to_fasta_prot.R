xp_to_fasta_prot <- function(data, nameFile){
  
  for(i in seq_along(data)){
    xp <- data[i]
    imp_aa_seq <- entrez_fetch(db="protein", id=xp, rettype='fasta')
    write(imp_aa_seq, paste0(nameFile, ".fasta"), append =TRUE)
  }
}

# nameFile in character string format "nameFile"
# data is a vector which elements are the accesion name of proteins
