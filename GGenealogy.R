Kalicz <- read.csv2("KaliczCsaládfa.csv")
library(ggenealogy)
KaliczClean <- Kalicz[,c(1:2,4)]
colnames(KaliczClean) <- c("ID", "IDparent2", "Name")
KaliczClean <- rbind(KaliczClean, Kalicz[,c(1,3,4)])
colnames(KaliczClean) <- c("child", "parent", "Name")
KaliczIG <- dfToIG(KaliczClean)
