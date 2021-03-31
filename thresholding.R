features <-read.csv("sampleID.csv", header = TRUE, sep=",")
#the data sampleID.csv contains binarized expression for cell type markers and neuronal adhesion markers (NLGN and NRXN), available upon request (email: sayar@ohsu.edu or eksi@ohsu.edu)

#View(features)
#colnames(features)
#dim(features)

#View(features$ROI_ID)

fts_edited <- features[!features$ROI_ID == 0, ] #features for only cells in ROIs selected


#markers we have: CK5, CK8, CD31, CD3, NCAM - our main cell types
#molecular markers: NLGN1, NRXN1 (coexpression with all of the above wanted)
CK5positive <- fts_edited[!fts_edited$CK5pos == 0, ] #features for CK5 pos cells
CK5NLGN1 <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$ALL_NLGN1 == 1, ]
CK5NLGN1_IDs <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CK5NLGN1_IDs) #number of CK5andNLGN1 pos cells 
CK5NRXN1_IDs <- fts_edited[fts_edited$CK5pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CK5NRXN1_IDs)
NRXN1NLGN1_basal <- CK5NRXN1_IDs[CK5NRXN1_IDs %in% CK5NLGN1_IDs] # both NRXN1 and NLGN1 pos
length(NRXN1NLGN1_basal)

CK8positive <- fts_edited[!fts_edited$CK8pos == 0, ] #features for CK8 pos cells this does the same thing CK8positive <- fts_edited[fts_edited$CK8pos == 1, ]
CK8NLGN1_IDs <- fts_edited[fts_edited$CK8pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CK8NLGN1_IDs) #number of CK8andNLGN1 pos cells 
CK8NRXN1_IDs <- fts_edited[fts_edited$CK8pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CK8NRXN1_IDs) 
NRXN1NLGN1_lum <- CK8NRXN1_IDs[CK8NRXN1_IDs %in% CK8NLGN1_IDs] 

CD31positive <- fts_edited[!fts_edited$CD31pos == 0, ] #fts for CD31 pos cells 
CD31NLGN1_IDs <- fts_edited[fts_edited$CD31pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CD31NLGN1_IDs) #number of CD31andNLGN1 pos cells 
CD31NRXN1_IDs <- fts_edited[fts_edited$CD31pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CD31NRXN1_IDs) 
NRXN1NLGN1_endo <- CD31NRXN1_IDs[CD31NRXN1_IDs %in% CD31NLGN1_IDs]

CD3positive <- fts_edited[!fts_edited$CD3pos == 0, ] #fts for CD3 pos cells
CD3NLGN1_IDs <- fts_edited[fts_edited$CD3pos == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(CD3NLGN1_IDs) #number of CD3andNLGN1 pos cells
CD3NRXN1_IDs <- fts_edited[fts_edited$CD3pos == 1 & fts_edited$NRXN1pos == 1, 1]
length(CD3NRXN1_IDs)
NRXN1NLGN1_CD3 <- CD3NRXN1_IDs[CD3NRXN1_IDs %in% CD3NLGN1_IDs]

NCAMpositive <- fts_edited[!fts_edited$ALL_NCAM == 0, ] #fts for NCAM pos cells 
NCAMNLGN1_IDs <- fts_edited[fts_edited$ALL_NCAM == 1 & fts_edited$ALL_NLGN1 == 1, 1] #just the cell IDs
length(NCAMNLGN1_IDs) #number of CD3andNLGN1 pos cells
NCAMNRXN1_IDs <- fts_edited[fts_edited$ALL_NCAM == 1 & fts_edited$NRXN1pos == 1, 1]
length(NCAMNRXN1_IDs) 
NRXN1NLGN1_NCAM <- NCAMNRXN1_IDs[NCAMNRXN1_IDs %in% NCAMNLGN1_IDs] 
length(NRXN1NLGN1_NCAM) 


