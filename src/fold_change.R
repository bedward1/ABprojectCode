# linggi, Aug 6, 2013
# fold change calculation for RNA-seq data.
# input: 'norm.output': has 3 columns of data and other columns 
# output: "FC.all.conds': fold change values between all compbinations with col labels that inform with direction change is happening. Do not use any cuttoff. 

fold.change.working.1 = as.data.frame(norm1.output)
# remove any 0 value to all fold change calc to be a real number

fold.change.working.1[fold.change.working.1==0] = .123
attach(fold.change.working.1)

# need to annotate below for conditions (automate TODO)
FC.HLHO.div.LL_HO2 = HL_HO2/LL_HO2
FC.HLHO.div.LL_LO2 = HL_HO2/LL_LO2
FC.HLHO.div.HL_LO2 = HL_HO2/HL_LO2
FC.LLHO.div.LL_LO2 = LL_HO2/LL_LO2
FC.LLHO.div.HL_LO2 = LL_HO2/HL_LO2
FC.LLLO.div.HL_LO2 = LL_LO2/HL_LO2

#need to manually bind the cols below
FC.all.conds.output = cbind(norm1.output,cbind(FC.HLHO.div.HL_LO2, 
                                               cbind(FC.HLHO.div.LL_HO2),
                                               cbind(FC.HLHO.div.LL_LO2),
                                               cbind(FC.LLHO.div.HL_LO2),
                                               cbind(FC.LLHO.div.LL_LO2),
                                                     FC.LLLO.div.HL_LO2))