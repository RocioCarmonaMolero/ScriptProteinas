caracterization <- function(datos){
  naa <- c()
  accRNA <-  c()
  RNAlen <- c()
  gename <- c()
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
    gename <- c(gename, bg$name)
    chr <- c(chr, bg$chromosome)
    exon <- c(exon, bg$genomicinfo[,5])
    startp <- c(startp, bg$genomicinfo[,3])
    stopp <- c(stopp, bg$genomicinfo[,4])
    mol_wg <- c(mol_wg, weight_prot(xp))
  }
  
  dat <- data.frame(naa, accRNA, RNAlen, gename, chr, exon, startp, stopp, mol_wg, row.names = datos)
  dat
}
