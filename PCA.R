##################PCA######################################
library(SNPRelate)

vcf.fn <- "DATA1L.vcf"

snpgdsVCF2GDS(vcf.fn, "DATA1L.gds",  method="biallelic.only")

genofile <- openfn.gds("DATA.gds")

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

