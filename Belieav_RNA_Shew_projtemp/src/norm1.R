# Linggi, Aug 1,2013
# normalize RNA-seq data using DE-Seq Package

#input:  ('parse1_output'): file with columns for each condition, row.names as genes.
#output: "norm1_output":  normalized data

require("DESeq")
# remove duplicate row names, DEseq will not work otherwise *may check for loss of interesting genes

parse1.output.no.dups = parse1.output[!(duplicated(row.names(parse1.output))),]
CountTable = parse1.output.no.dups
conditions = colnames(CountTable)
cds= newCountDataSet(floor(CountTable),conditions) 
cds=estimateSizeFactors(cds)
sizeFactors(cds)
Counts.norm = (counts(cds, normalized=TRUE) )
norm1.output = Counts.norm
