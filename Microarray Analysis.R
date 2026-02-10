#Name: Shelby Thomas; Date: 02/03/2026; Purpose: Microarray Analysis

#Install Affymetrix library/Package
if (!require("BiocManager", quietly = TRUE))
install.packages("BiocManager")
BiocManager::install("affy")

#Load the library Affy
library(affy)

#Set the working directory to a folder where you have .CEL
setwd("/Users/shelbythomas/Downloads")

#Read the 4 .CEL files in R
data <-ReadAffy()

#Generate a boxplot to visualize dataset
boxplot(data)

#Normalize dataset to remove any outliers and stabilize the median for all .CEL files
normalizeddata <-rma(data)

#Generate a boxplot to visualize normalized dataset
boxplot (exprs(normalizeddata))

#Fold change analysis for comparing treatment vs. convtrol samples
#Let's assume GSM4843.CEL and GSM4844.CEL samples to be Leukemia/Blood cancer and GSM4845.CEL and GSM4846.CEL to be normal blood samples

#Take means/ average on each row (Calculate average)
head(exprs(normalizeddata))
Newdata <- exprs(normalizeddata)
Treatment <- Newdata[,c(1,2)]
Control <- Newdata[,c(3,4)]

#Apply the rowmeans function to calculate averages
rowMeans()
Treatmentaverage <- rowMeans(Treatment)
Controlaverage <- rowMeans(Control)
head(Treatmentaverage)
head(Controlaverage)

#Apply fold change by subtraction
foldchange <- Treatmentaverage - Controlaverage
head(foldchange)

#If genes fold change value is >2 its an upregulated gene, and if it's < -2 it's downregulated gene, and if genes are between -2 and +2 they are insignificant genes

#Export variable foldchange in an CSV file

write.csv(foldchange, "foldchange.csv")
