Kalicz <- read.csv2("KaliczCsaládfa.csv")
library(kinship2)
Kalicz$Sex <- NA
Kalicz[1,"Sex"] <- 1
for(nr in 2:nrow(Kalicz)){Kalicz[nr,"Sex"] <- ifelse(any(Kalicz[,"IDparent1"] == Kalicz[nr,"ID"]), 1, 2)}
pedAll <- pedigree(id=Kalicz$ID, 
                   dadid=Kalicz$IDparent1, momid=Kalicz$IDparent2,
                   sex = Kalicz$Sex) 

                sex=Kalicz$sex, famid=Kalicz$ped)
plot(pedAll, cex = 0.7)
plot(pedAll, cex = 0.7, id = Kalicz$Name)
