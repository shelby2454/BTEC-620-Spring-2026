library(affy)
setwd("/Users/shelbythomas/Desktop/Practice")
data <- ReadAffy()
boxplot(data)
normalizeddata <-rma(data)
boxplot (exprs(normalizeddata))
Newdata <- exprs(normalizeddata)
Treatment <- Newdata[,c(1,2)]
Control <- Newdata[,c(3,4)]
Treatmentaverage <- rowMeans(Treatment)
Controlaverage <- rowMeans(Control)
foldchange <- Treatmentaverage - Controlaverage
head(foldchange)
write.csv(foldchange, "practice.csv")
