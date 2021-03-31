####plotting####
#cell types already quantified (basal, luminal, Neuroendocrine. endothelial, immune, neuronal) are plotted using R ggplot2 library

#create a table with the cell types and number of cells that express marker of interest
myDF <- read.table(text="marker basal     luminal    neuroendocrine     endothelial     immune     neuronal
NRXN1+    4364 16203 9 988 1603 119
NRXN1-   1495 3513 5 2855 2762 165", header=TRUE)
View(myDF)

install.packages("tidyverse") 
library(scales)
library(ggplot2)
library(reshape2)

DF1 <- melt(myDF, id.var="marker")

#percent population of cell type by marker expression - only need to change the "ggtitle" here
ggplot(DF1, aes(x = variable, y = value, fill = marker))  + geom_bar(stat = 'identity', position = 'fill') +labs(y = "Percent Population", x = "Cell Type") +ggtitle("All_Low_Risk") +theme_bw(base_family = "Times") #optional if you want white background

#amount of cells (cell counts) by cell type by marker expression - only need to change the "ggtitle" here
ggplot(DF1, aes(x = variable, y = value, fill = marker)) + geom_bar(stat = 'identity') +labs(y = "Cells", x = "Cell Type") + ggtitle("All_Low_Risk") +theme_bw(base_family = "Times") #optional if you want white background


#mapping the location of cells:
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point")
qplot(x = Nuc.X, y = Nuc.Y, data = features, geom = "point", color = ROI_ID) #ROI locations
