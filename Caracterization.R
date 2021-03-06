caracterization <- function(datos){
  naa <- c()
  accRNA <-  c()
  RNAlen <- c()
  LOC <- c()
  chr <- c()
  exon <- c()
  startp <- c()
  stopp <- c()
  mol_wg <- c()
  
  for(i in seq_along(datos)){
    xp <- datos[i]
    buq <- entrez_summary(db="protein", id=xp)
    fa <- entrez_link(dbfrom="protein", id=xp, db='all')
    ind <- fa$links$protein_nuccore_mrna
    bm <- entrez_summary(db="nuccore", id=ind)
    inp <- fa$links$protein_gene
    bg <- entrez_summary(db="gene", id=inp)

    naa <- c(naa, buq$slen)
    accRNA <- c(accRNA, bm$caption)
    RNAlen <- c(RNAlen, bm$slen)
    LOC <- c(LOC, bg$name)
    chr <- c(chr, bg$chromosome)
    if(length(bg$genomicinfo) == 0){
      exon <- c(exon, "mirar")
      startp <- c(startp, "mirar")
      stopp <- c(stopp, "mirar")
    } else {
      exon <- c(exon, bg$genomicinfo$exoncount)
      startp <- c(startp, bg$genomicinfo$chrstart)
      stopp <- c(stopp, bg$genomicinfo$chrstop)
    }
    mol_wg <- c(mol_wg, weight_prot(xp))
  }
  dat <- data.frame(naa, accRNA, RNAlen, LOC, chr, exon, startp, stopp, mol_wg, row.names = datos, stringsAsFactors = FALSE)
  dat
}
