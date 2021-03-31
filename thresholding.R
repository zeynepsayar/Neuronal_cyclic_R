features <-read.csv("38592-2_QiGates.csv", header = TRUE, sep=",")

#View(features)
#colnames(features)
#dim(features)

#View(features$ROI_ID)

fts_edited <- features[!features$ROI_ID == 0, ] #features for only cells in ROIs #TOT nr of cells is 8873

####Ki67 analysis ####
CK5positive <- fts_edited[!fts_edited$CK5pos == 0, ] #382 cells #features for CK5 pos cells
CK5Ki67 <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$KI67pos == 1, ]
CK5Ki67_IDs <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$KI67pos == 1, 1] #just the cell IDs
length(CK5Ki67_IDs) #number of CK5andNLGN1 pos cells #13 cells


CK8positive <- fts_edited[!fts_edited$CK8pos == 0, ] #3521 cells #features for CK8 pos cells this does the same thing CK8positive <- fts_edited[fts_edited$CK8pos == 1, ]
CK8Ki67_IDs <- fts_edited[fts_edited$CK8pos == 1 & fts_edited$KI67pos == 1, 1] #just the cell IDs
length(CK8Ki67_IDs) #number of CK8andNLGN1 pos cells #181 cells


CD31positive <- fts_edited[!fts_edited$CD31pos == 0, ] #fts for CD31 pos cells #528 cells
CD31Ki67_IDs <- fts_edited[fts_edited$CD31pos == 1 & fts_edited$KI67pos == 1, 1] #just the cell IDs
length(CD31Ki67_IDs) #number of CD31andNLGN1 pos cells #2 cells


CD3positive <- fts_edited[!fts_edited$CD3pos == 0, ] #fts for CD3 pos cells #288 cells
CD3Ki67_IDs <- fts_edited[fts_edited$CD3pos == 1 & fts_edited$KI67pos == 1, 1] #just the cell IDs
length(CD3Ki67_IDs) #number of CD3andNLGN1 pos cells #4 cells


NCAMpositive <- fts_edited[!fts_edited$ALL_NCAM == 0, ] #fts for NCAM pos cells #tot 4 NCAM pos cells
NCAMKi67_IDs <- fts_edited[fts_edited$ALL_NCAM == 1 & fts_edited$KI67pos == 1, 1] #just the cell IDs
length(NCAMKi67_IDs) #number of CD3andNLGN1 pos cells #0 cells



#other markers: Ki67 (coexpression with all celltypes wanted), AMACR (coexpression w/ CK5 and CK8)

#AR_genes[AR_genes %in% top_DEGs] 

#plotting
#mydf <-read.csv("dfsummary.csv", header = TRUE, sep=",")

myDF <- read.table(text=" marker Basal     Luminal     Endothel.     Immune     Nerves
+ proliferating    13     181     2     4    0
+ nonprolif    369    3340     526     284    4", header=TRUE)
View(myDF)

install.packages("tidyverse")
library(scales)
library(ggplot2)
library(reshape2)

DF1 <- melt(myDF, id.var="marker")

#percent population of cell type by marker expression
ggplot(DF1, aes(x = variable, y = value, fill = marker)) 
+ geom_bar(stat = 'identity', position = 'fill')
+labs(y = "Percent Population", x = "Cell Type")
+theme_bw(base_family = "Times") #optional if you want white background

#amount of cells by cell type by marker expression
ggplot(DF1, aes(x = variable, y = value, fill = marker)) 
+ geom_bar(stat = 'identity')
+labs(y = "Cells", x = "Cell Type")
+theme_bw(base_family = "Times") #optional if you want white background

#mapping the location of cells:
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point")
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point", color = ROI_ID) #ROI locations

####rest####


fts_edited$ALL_NLGN1 <- fts_edited$ROI1.NLGN1 + fts_edited$ROI2.NLGN1 + fts_edited$ROI3.NLGN1
fts_edited$ALL_AMACR <- fts_edited$ROI1.AMACR + fts_edited$ROI2.AMACR + fts_edited$ROI3.AMACR
fts_edited$ALL_NCAM <- fts_edited$ROI2.NCAM #b/c only NCAM is in ROI2 so no need to add

#markers we have: CK5, CK8, CD31, CD3, NCAM - our main cell types
#molecular markers: NLGN1, NRXN1 (coexpression with all of the above wanted)
CK5positive <- fts_edited[!fts_edited$CK5pos == 0, ] #382 cells #features for CK5 pos cells
CK5NLGN1 <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$ALL_NLGN1 == 1, ]
CK5NLGN1_IDs <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CK5NLGN1_IDs) #number of CK5andNLGN1 pos cells #136 cells
CK5NRXN1_IDs <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CK5NRXN1_IDs) #262 cells
NRXN1NLGN1_basal <- CK5NRXN1_IDs[CK5NRXN1_IDs %in% CK5NLGN1_IDs] #132 basal cells that are both NRXN1 and NLGN1 pos
length(NRXN1NLGN1_basal)

CK8positive <- fts_edited[!fts_edited$CK8pos == 0, ] #3521 cells #features for CK8 pos cells this does the same thing CK8positive <- fts_edited[fts_edited$CK8pos == 1, ]
CK8NLGN1_IDs <- fts_edited[fts_edited$CK8pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CK8NLGN1_IDs) #number of CK8andNLGN1 pos cells #1138 cells
CK8NRXN1_IDs <- fts_edited[fts_edited$CK8pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CK8NRXN1_IDs) #2823 cells
NRXN1NLGN1_lum <- CK8NRXN1_IDs[CK8NRXN1_IDs %in% CK8NLGN1_IDs] #1080

CD31positive <- fts_edited[!fts_edited$CD31pos == 0, ] #fts for CD31 pos cells #528 cells
CD31NLGN1_IDs <- fts_edited[fts_edited$CD31pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CD31NLGN1_IDs) #number of CD31andNLGN1 pos cells #50 cells
CD31NRXN1_IDs <- fts_edited[fts_edited$CD31pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CD31NRXN1_IDs) #17 cells
NRXN1NLGN1_endo <- CD31NRXN1_IDs[CD31NRXN1_IDs %in% CD31NLGN1_IDs] #10

CD3positive <- fts_edited[!fts_edited$CD3pos == 0, ] #fts for CD3 pos cells #288 cells
CD3NLGN1_IDs <- fts_edited[fts_edited$CD3pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CD3NLGN1_IDs) #number of CD3andNLGN1 pos cells #53 cells
CD3NRXN1_IDs <- fts_edited[fts_edited$CD3pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CD3NRXN1_IDs) #57 cells
NRXN1NLGN1_CD3 <- CD3NRXN1_IDs[CD3NRXN1_IDs %in% CD3NLGN1_IDs] #49

NCAMpositive <- fts_edited[!fts_edited$ALL_NCAM == 0, ] #fts for NCAM pos cells #tot 4 NCAM pos cells
NCAMNLGN1_IDs <- fts_edited[fts_edited$ALL_NCAM == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(NCAMNLGN1_IDs) #number of CD3andNLGN1 pos cells #1 cells
NCAMNRXN1_IDs <- fts_edited[fts_edited$ALL_NCAM == 1 & fts_edited$NRXN1pos == 1, 1]
length(NCAMNRXN1_IDs) #1 cells
NRXN1NLGN1_NCAM <- NCAMNRXN1_IDs[NCAMNRXN1_IDs %in% NCAMNLGN1_IDs] 
length(NRXN1NLGN1_NCAM) #1
#only 4 NCAM cells in this tissue so it's not worth it for this one only


#other markers: Ki67 (coexpression with all celltypes wanted), AMACR (coexpression w/ CK5 and CK8)

#AR_genes[AR_genes %in% top_DEGs] 

#plotting
#mydf <-read.csv("dfsummary.csv", header = TRUE, sep=",")

myDF <- read.table(text="marker basal     luminal     endothelial     immune     neuro
+ NLGN1    132     1080     10     49    1
+ NRXN1    130    1743     7     8    0
+ NLGN1andNRXN1    4    58    40  4    0
+ neither    116     640     471     227     3", header=TRUE)
View(myDF)

install.packages("tidyverse")
library(scales)
library(ggplot2)
library(reshape2)

DF1 <- melt(myDF, id.var="marker")

#percent population of cell type by marker expression
ggplot(DF1, aes(x = variable, y = value, fill = marker)) 
+ geom_bar(stat = 'identity', position = 'fill')
+labs(y = "Percent Population", x = "Cell Type")
+theme_bw(base_family = "Times") #optional if you want white background

#amount of cells by cell type by marker expression
ggplot(DF1, aes(x = variable, y = value, fill = marker)) 
+ geom_bar(stat = 'identity')
+labs(y = "Cells", x = "Cell Type")
+theme_bw(base_family = "Times") #optional if you want white background

#mapping the location of cells:
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point")
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point", color = ROI_ID) #ROI locations
