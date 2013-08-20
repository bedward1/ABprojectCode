# linggi August 1,2013
# munge script for csv files for Belieav data
# input : csv files for each condition. Sent from meng. Have "RPKM" column.  Use gene column "Transcripts" for ids (same for each)
# output: ('parse1_output') dataframe. with row.names as gene symbol or locus id.  Col.names as condition_descriptors, each column is rpkm value


#get data files from workspace after auto data import (all have name 'MM')
#get from workspace names
data.file.names= ls()[ grep('MM',ls())]


# TO DO automate this..


all.RPKM = cbind(cbind(data.spu.annotated.AB3.11$RPKM,data.spu.annotated.AB3.6$RPKM),data.spu.annotated.AB3.9$RPKM) # 11, 6, 9
colnames(all.RPKM) = c('Lactate_CC', 'Shew_HL_HO2','C-lim_CC')
rownames(all.RPKM)=data.spu.annotated.AB3.11$X.Gene.ID
# remove rows that have 'gene', this is duplicated in this output (Lifescope)
parse1.output=all.RPKM[!grepl('gene',row.names(all.RPKM)),]
rm(all.RPKM)
rm(data.file.names)
rm(data.spu.annotated.AB3.11)
rm(data.spu.annotated.AB3.6)
rm(data.spu.annotated.AB3.9)