# linggi 081213
# filter output data by counts and fold changes, cols are labeled
# input: columsn of counts and fold change
# output: list of rows that pass criteria, can be filtered out in excel

filter.input = read.csv('filter_output081213.csv')


# put cols together 
counts=cbind(filter.input$counts1,cbind(filter.input$counts2,filter.input$count3)) 
counts.sums = rowSums(counts)

#get row index of those with top 90% of count sums
counts.top.90.TF = counts.sums>(quantile(counts.sums,.1))

#filter by fold change cuttoff

fc.cols = cbind(filter.input$fold1, cbind(filter.input$fold2,filter.input$fold3))

fc.abs.2fold = (rowSums(fc.cols >2 | fc.cols< 0.5)>0)

#combine both 
counts.fc.logicals = cbind(counts.top.90.TF,fc.abs.2fold)
write.csv(counts.fc.logicals,'filtered_TF_list.csv')

# combine so both have to be true
write.csv(fc.abs.2fold & counts.top.90.TF, 'pass_both_filters.csv')