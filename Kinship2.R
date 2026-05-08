library(kinship2)

Kalicz <- read.csv2("KaliczCS.csv", sep =",")
Kalicz <- Kalicz[Kalicz$ID != "",]
Kalicz$Sex <- as.numeric(Kalicz$Sex)
Kalicz$Born <- as.Date(Kalicz$Born)
## Both or neither
Kalicz[which(Kalicz$IDparent1 == ""), "IDparent2"] <- ""
Kalicz[which(Kalicz$IDparent2 == ""), "IDparent1"] <- ""
pedAll <- pedigree(id=Kalicz$ID, 
                   dadid=Kalicz$IDparent1, momid=Kalicz$IDparent2,
                   sex = Kalicz$Sex) 
pdf(width = 26, height = 8)
plot(pedAll, cex = 0.8, id = Kalicz$Name)
dev.off()
