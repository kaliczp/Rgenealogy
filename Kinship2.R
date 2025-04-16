library(kinship2)

Kalicz <- read.csv2("KaliczCS.csv")
Kalicz <- Kalicz[Kalicz$ID != "",]
pedAll <- pedigree(id=Kalicz$ID, 
                   dadid=Kalicz$IDparent1, momid=Kalicz$IDparent2,
                   sex = Kalicz$Sex) 
pdf(width = 26, height = 8)
plot(pedAll, cex = 0.8, id = Kalicz$Name)
dev.off()
