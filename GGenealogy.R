Kalicz <- read.csv("KaliczCS.csv")
Kalicz <- Kalicz[Kalicz$ID != "",]
Kalicz$Born <- as.Date(Kalicz$Born)
Kalicz$Kereszt <- as.Date(Kalicz$Kereszt)
library(ggenealogy)

## Generate matrix first column child second parent with unique name
KaliczF <- factor(c(Kalicz[, "ID"],Kalicz[, "IDparent1"],Kalicz[, "IDparent2"]), Kalicz[,"ID"], labels = make.unique(Kalicz[, "Name"]))
KaliczM <- matrix(as.character(KaliczF), ncol = 3)
KaliczClean <- rbind(KaliczM[,1:2], KaliczM[,c(1,3)])

## Add birthyear to child
KaliczClenaB <- cbind(KaliczClean, Kalicz[,"BornYear"])
Kalicz.df <- as.data.frame(KaliczClenaB)
colnames(Kalicz.df) <- c("child", "parent", "Born")
Kalicz.df$Born <- as.numeric(Kalicz.df$Born)

KaliczIG <- dfToIG(Kalicz.df)
pathKP_JS <- getPath("Kalicz Péter", "Jósa Sára", KaliczIG, Kalicz.df, "Born")
plotPath(pathKP_JS, Kalicz.df, "Born")
plotPathOnAll(pathKP_JS, Kalicz.df, KaliczIG, "Born")


plotAncDes("Kocsis Gizella Lenke", Kalicz.df, 10)
plotAncDes("Kalicz Imre", Kalicz.df, 10)

pdf(width=14, height=21)
