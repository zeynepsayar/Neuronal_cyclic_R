ROI_IDs <-read.csv("ROI-ids.csv", header = TRUE, sep=",")
allMI <- read.csv("Mean-Intensities.csv", header = TRUE, sep=",")

fts1 <- allMI[allMI$Labels %in% ROI_IDs$Cell_ID ,] #fts of only cells in ROI


write.csv(fts1,"C:/path/fts1.csv", row.names = FALSE)

fts1$ROI_ID <- 'ROI1'

allMI$scene <- 1
allMI$source <- 'Immune2020-CP-30411-6'	
allMI$clinical_subtype <- 'WT+G3+3'

write.csv(allMI,"C:/path/WholeTissuefts.csv", row.names = FALSE)
