# linggi Aug 1, 2013
# add annotations to Belieav data. Use Margie's annotation set
# input: FC.all.conds.output
# output: 'workflow.output'

# prep ref annotitions
ref.annotions = read.csv('ref_files/ShewW3181_annots_042513.csv')
ref.annotions.test = read.csv('ref_files//allgenesannots_MR.csv')
# move over the id of interested into row.names, make only 4 last character (**specfic to this list)
short_Sput_IDS = sapply(as.character(ref.annotions$W3181), FUN = function(x){substr(x,nchar(x)-3, nchar(x))})
# make a shortened version for each match, put in row.names
shortID.ref.annotations = cbind(short_Sput_IDS,ref.annotions)

# prep row names from data to match ref
annotate1.working = FC.all.conds.output
# pull out part of list #that matches ref.annotation format, use underscore to find end
row.names(annotate1.working)=sapply(row.names(annotate1.working), FUN = function(x){substr(x, regexpr('_',x)+1,  nchar(x))})
# ** currently (08/1/13), the above has some gene symbols left over, need to fix orignal mapping 


#grab annotations for genes in annotate1.working
picked.annots = ref.annotions[match(row.names(annotate1.working),shortID.ref.annotations$short_Sput_IDS),]
# add annotations to data
workflow.output = cbind(annotate1.working,picked.annots)