# linggi, Aug 6, 2013
# fold change calculation for RNA-seq data.
# input: 'norm.output': has 3 columns of data and other columns 
# output: "FC.all.conds': fold change values between all compbinations with col labels that inform with direction change is happening. Do not use any cuttoff. 

fold.change.working.1 = as.data.frame(norm1.output)
# remove any 0 value to all fold change calc to be a real number

fold.change.working.1[fold.change.working.1==0] = .123
attach(fold.change.working.1)


FC.HLHO.div.C_Lim = Shew_HL_HO2/C_lim_CC
FC.HLHO.div.lact = Shew_HL_HO2/Lactate_CC
FC.C_lim.div.lac = C_lim_CC/Lactate_CC

FC.all.conds.output = cbind(norm1.output,cbind(FC.HLHO.div.C_Lim, cbind(FC.HLHO.div.lact, FC.C_lim.div.lac)))