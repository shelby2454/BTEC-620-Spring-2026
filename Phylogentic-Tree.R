#Author:Shelby Thomas, Date: March 26, 2026, Purpose: To generate a phylogentic tree structure.

#Load package ape
library(ape)

#Generate some dummy data for tree structure

text.string<- "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),gold_fish),shark);"

vert.tree<-read.tree(text=text.string)

#Plot the tree structure

plot(vert.tree,no.margin=TRUE,edge.width=2)

#Writing/storing the tree structure dataset

setwd("/Users/shelbythomas/Desktop")

write.tree(vert.tree,file="dummy.tre")
