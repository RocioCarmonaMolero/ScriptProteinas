xp_to_fasta_prot <- function(candidatos)

library(rentrez)

for(i in seq_along(candidatos)){
  xp <- candidatos[i]
  imp_aa_seq <- entrez_fetch(db="protein", id=xp, rettype='fasta')
  write(imp_aa_seq, "xp_to_fasta_candidatos.fasta", append =TRUE)
}
