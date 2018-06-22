# Read the results of executing the blastp all proteinALDH sequences against all proteinALDH sequences
families <- read.csv("HITBLASTFamilies.csv", header = F)

# Change colnames
colnames(families) = c("query", "subject", "identity", "align_length", "mismatches",
                  "gap_opens", "q.start", "q.end", "s.start", "s.end", "evalue",
                  "bit_score", "%positives")
            
# Obtaining length of the query protein and the coverage and adding it as a column to the dataframe (families)
xp <- unique(families$query)
lenquery <- c()
for(i in xp){
  buq <- entrez_summary(db="protein", id=i)
  lenquery <- c(lenquery, buq$slen)
}
lenquerydf <- data.frame(xp, lenquery)

query <- families$query
slenprot <- c()
for(i in seq_along(query)){
  lenqueryxp <- lenquerydf[lenquerydf$xp == query[i], 2]
  slenprot <- c(slenprot, lenqueryxp)
  slenprot
}

families$lenquery = slenprot

#calculate query cover and add it to the dat tibble
querycover <- c()
for(i in 1:nrow(families)){
  cover = (families$q.end[i] - families$q.start[i] + 1)/ families$lenquery[i]
  querycover <- c(querycover, cover)
  querycover
}
families$querycover = querycover

# Calculate lenght of the hit
xphit <- unique(families$subject)
lenhit <- c()
for(i in xphit){
  buh <- entrez_summary(db="protein", id=i)
  lenhit <- c(lenhit, buh$slen)
}
lenhitdf <- data.frame(xphit, lenhit)

hit <- families$subject
slenhit <- c()
for(i in seq_along(hit)){
  lenhitxp <- lenhitdf[lenhitdf$xphit == hit[i], 2]
  slenhit <- c(slenhit, lenhitxp)
  slenhit
}
families$lenhit = slenhit

# Eliminate non required columns
families$align_length <- NULL
families$mismatches <-  NULL
families$gap_opens <-  NULL
families$q.end <-  NULL
families$q.start <-  NULL
families$s.end <-  NULL
families$s.start <- NULL
