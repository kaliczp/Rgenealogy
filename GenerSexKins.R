Kalicz <- read.csv2("KaliczCsaládfa.csv")
Kalicz$Sex <- NA
Kalicz[1,"Sex"] <- 1
for(nr in 2:nrow(Kalicz)){Kalicz[nr,"Sex"] <- ifelse(any(Kalicz[,"IDparent1"] == Kalicz[nr,"ID"]), 1, 2)}
write.csv2(Kalicz[,c(1:4,8,5:7)], "KaliczCS.csv", row.names=FALSE)
