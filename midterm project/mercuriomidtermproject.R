# Katherine Mercurio

# foreign library is used to access read.dbf 
library(foreign)  
library(dplyr)

# these are the two DBF files I want to work with first
osha <- read.dbf("osha.DBF")
viol <- read.dbf("viol.DBF")

# created subsets of DBF files, deleted duplicates, so we only have attributes
# of interest
subViol <- viol[ ,c("ACTIVITYNO","NUMEXPOSED", "GRAVITY", "ISSUANCE", "CITATION", "VIOLTYPE")]
subViolU <- subViol[ ,c("ACTIVITYNO", "ISSUANCE")]
subViolU <- distinct(subViolU)
subViol <- unique(inner_join(subViolU, subViol))
subOsha <- osha[ ,c("ESTABNAME", "ACTIVITYNO", "PREVACTNO", "PREVCTTYP", "INSPTYPE")]
subOshaU <- distinct(subOsha)

# created a new data frame joining my subsets by activity number
ov <- unique(inner_join(subViol, subOshaU, by = "ACTIVITYNO"))

# filtered to only have accidents that directly affected people
ov <- filter(ov, NUMEXPOSED > 0)

# distinct accidents only; no repeats
ov <- distinct(ov)

# read in next DBF file to be used
accid <- read.dbf("accid.DBF")

# add all of the columns to ov from accid
ov <- unique(inner_join(ov, accid, by = "ACTIVITYNO"))

# determining which columns to keep based on potentially important attributes
ov <- ov[ ,c("ACTIVITYNO", "ESTABNAME", "GRAVITY", "NAME.x", "SEX.x", "DEGREE.x", "NATURE.x", "BODYPART.x", "SOURCE.x") ]

# read in dbf file containing codes
acc <- read.dbf("./lookups/acc.dbf")

# split DBF so only relevant body part information is present
acc1 <- acc[1:31,]

# join the body part codes with the ov table so that the table can be labeled 
# with the actual body part instead of a code; simplifies analysis process because
# you dont't need to look up codes; makes data more meaningful
ov <- unique(left_join(ov, acc1, by = c("BODYPART.x" = "CODE")))

# added library to make dropping columns easier
library(BBmisc)
ov <- BBmisc:: dropNamed(ov, "BODYPART.x") 
ov <- BBmisc:: dropNamed(ov, "CATEGORY.y")
ov <- BBmisc:: dropNamed(ov, "VALUE.y")

# repeated steps but with nature and source codes instead of bodyparts
acc2 <- acc[84:105, ]
ov <- left_join(ov, acc2, by = c("NATURE.x" = "CODE"))
acc3 <- acc[106:153, ]
ov <- left_join(ov, acc3, by = c("SOURCE.x" = "CODE"))

# renamed columns to make it more clear what they represent; deleted unnecessary cols
library(plyr)
ov <- rename(ov, c("VALUE.x"="BodyPart", "VALUE.y"="EnvFact", "VALUE" = "InjurySource"))
ov <- BBmisc:: dropNamed(ov, "NATURE.x")
ov <- BBmisc:: dropNamed(ov, "SOURCE.x")
ov <- BBmisc:: dropNamed(ov, "CATEGORY.x")
ov <- BBmisc:: dropNamed(ov, "CATEGORY.y")
ov <- BBmisc:: dropNamed(ov, "CATEGORY")

# used tidyr to add issue dates and to seperate those dates into seperate month, year
# and day columns, so dates could be used to analyze yearly trends
library(tidyr)
viol <- viol[, c("ACTIVITYNO", "ISSUEDATE")]
ov <- unique(inner_join(ov, viol))
ov <- separate(ov, ISSUEDATE,c("Year", "Month", "Day"), "-")

# created a graphic (bar graph) showing relationship between accidents in 
# MA and prevalance of a body part being affected 
graph2 <- ggplot(ov, aes(BodyPart)) + geom_bar(aes(fill = DEGREE.x))
graph2