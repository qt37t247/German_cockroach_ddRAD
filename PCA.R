##################PCA######################################
library(SNPRelate)

vcf.fn <- "DATA1L.vcf"

snpgdsVCF2GDS(vcf.fn, "DATA1L.gds",  method="biallelic.only")

genofile <- openfn.gds("DATA1L.gds", readonly = FALSE)

ccm_pca<-snpgdsPCA(genofile, autosome.only=FALSE)

pdf("DATA1L.pdf")  
plot(ccm_pca$eigenvect[,1],ccm_pca$eigenvect[,2], pch=19, col="yellow")
text(ccm_pca$eigenvect[,1],ccm_pca$eigenvect[,2],labels=ccm_pca$sample.id, cex=0.2)
dev.off()

tq1<-ccm_pca$eigenvect[,1]
tq2<-ccm_pca$eigenvect[,2]
tq3<-ccm_pca$eigenvect[,3]
tq4<-ccm_pca$eigenvect[,4]
pop<-ccm_pca$sample.id
tq<-cbind(tq1,tq2,tq3,tq4)
tq<-cbind(pop,tq)
tq<-as.data.frame(tq)

write.csv(tq,"pca_DATA1L.csv")
##I exported the PCA data to plot with excel for easier color manipulation

####################F-statistics##############################
pop.group <- c("AA", "AA", "AA", "AA", "AA", "AC", "AC", "AC", "AC", "AC", "BB", "BB", "BB", "BB", "BD", "BD", "BD", "BD", "BD", "BG", "BG", "BG", "BG", "BG", "BI", "BI", "BI", "BI", "BI", "BJ", "BJ", "BJ", "BJ", "BJ", "BL", "BL", "BL", "BL", "BL", "BS", "BS", "BS", "BS", "BS", "CC", "CC", "CC", "CC", "CC", "CN", "CN", "CN", "CN", "CN", "CQ", "CQ", "CQ", "CQ", "CQ", "CS", "CS", "CS", "CS", "CS", "CW", "CW", "CW", "CW", "CW", "FL", "FL", "FL", "FL", "FL", "GA", "GA", "GA", "GA", "GA", "GH", "GH", "GH", "GH", "GH", "GZ", "GZ", "GZ", "GZ", "GZ", "HW", "HW", "HW", "HW", "HW", "IN", "IN", "IN", "IN", "IN", "IR", "IR", "IR", "IR", "IR", "JJ", "JJ", "JJ", "JJ", "JJ", "JK", "JK", "JK", "JK", "JK", "KK", "KK", "KK", "KK", "KK", "LA", "LA", "LA", "LA", "LA", "LC", "LC", "LC", "LC", "LC", "LP", "LP", "LP", "LP", "LP", "MB", "MB", "MB", "MB", "MB", "MK", "MK", "MK", "MK", "MK", "MM", "MM", "MM", "MM", "MM", "MN", "MN", "MN", "MN", "MN", "MO", "MO", "MO", "MO", "MO", "MR", "MR", "MR", "MR", "MR", "NC", "NC", "NC", "NC", "NC", "NJ", "NJ", "NJ", "NJ", "NJ", "OH", "OH", "OH", "OH", "OH", "OK", "OK", "OK", "OK", "OK", "PA", "PA", "PA", "PA", "PA", "PD", "PD", "PD", "PD", "PD", "PL", "PL", "PL", "PL", "PL", "PR", "PR", "PR", "PR", "PR", "RM", "RM", "RM", "RM", "RM", "RT", "RT", "RT", "RT", "RT", "SB", "SB", "SB", "SB", "SB", "SG", "SG", "SG", "SG", "SG", "SH", "SH", "SH", "SH", "SH", "SN", "SN", "SO", "SO", "SO", "SO", "SO", "SR", "SR", "SR", "SR", "SR", "SS", "SS", "SS", "SS", "SS", "SY", "SY", "SY", "SY", "SY", "TR", "TR", "TR", "TR", "TR", "TX", "TX", "TX", "TX", "TX", "UC", "UC", "UC", "UC", "UC", "UK", "UK", "UK", "UK", "UK", "VW", "VW", "VW", "VW", "VW", "XA", "XA", "XA", "XA", "XA")

pop <- data.frame(pop.group)

node <- add.gdsn(genofile, "sample.annot", val=pop)

group <- as.factor(read.gdsn(index.gdsn(genofile, "sample.annot/pop.group")))

v <- snpgdsFst(genofile, population=group, method="W&H02", autosome.only=FALSE)

write.csv(v$Beta, "F-stats.csv") 

