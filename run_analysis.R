#Getting and Cleaning Data Course project program
#Maria Otoo April 2015

#My thanks to our community TA David Hood for his
#helpful advice https://class.coursera.org/getdata-013/forum/thread?thread_id=30

#***************************************************************************************************
#IMPORTANT INFORMATION ABOUT RUNNING THIS SCRIPT
#The script was created using R version 3.1.1 for Windows 7 Enterprise. It ran correctly
#using RStudio (0.98.1028) and RGui 32bit. I cannot vouch for it in Linux or OS X.

#To run in the RGui, select File-> Open Script. Select run_analysis.R. This will open the script in a
#new window. Right-click on the script (anywhere) and click on Select All (Ctrl-A). Right-click again
#and click on Run Line or Selection (Ctrl-R). The output will appear in the RGui window.

#To run in RStudio, click on File-> Open file. Select run_analysis.R. Highlight all the text and then
#click on the Run button (located in the top-right of the editing window.
#***************************************************************************************************

#PROGRAM STRUCTURE

#STEP 1:  1) READ FEATUREX.TXT TO GET COLUMN NAMES
#         2) MERGES THE TRAINING AND TEST DATA INTO ONE DATASET CALLED "BIGDATA"

#STEP 2:  DATA PREPARATION:
#         1)  READS IN ACTIVITY DATA AND TRAINING DATA.
#         2)  RENAMES VARIABLES TO "ID" AND "ACTIVITY.
#         3)  TACKS THE TRAINING AND TEST DATASETS TOGETHER AND CREATES DATAFRAME, "IDSACT"
#             WITH 10299 OBS AND 2 VARIABLES.
#         4)  MERGES IDSACT WITH BIGDATA W/20299 OBS AND 561 VARIABLES.
#
#STEP 3:  READS IN FEATURES AND RENAMES THE COLUMNS USING THE FEATURE NAMES AND EXTRACTS
#         ONLY VARIABLES WITH MEAN OR STANDARD DEVIATION
#STEP 4:  REPLACES THE ACTIVITY NUMBER WITH A NAME
#STEP 5:  CALCULATES THE MEAN BY ID AND ACTIVITY
#STEP 6:  WRITES THE DATA FRAME TO TIDY.TXT AND THEN VIEWS IT

library("plyr")
library("stringr")
library("reshape2")
library("dplyr")

#STEP 1:  READ IN DATA AND GET THE COLUMN NAMES
#**********************************************************************************************
#For names of the features use the ones provided in features.txt.  Changes are in Step 5
features <- read.table("features.txt",header=FALSE,as.is=2)
colnames <- features$V2

message("Starting to read in the test and training datasets.  This will take a minute or so.")
train <- read.table("X_train.txt",stringsAsFactors=FALSE,col.names=colnames)
test <-  read.table("X_test.txt", stringsAsFactors=FALSE,col.names=colnames)

message("Done reading in the datasets.")

bigdata <- rbind(train,test)  #combined data set
message("The combined dataset has been created and is called BIGDATA.")

#STEP 2:  DATA PREP
#*************************************************************************************
#Read in the activity data
message("Reading in activities data")
acttrain <- read.table("y_train.txt",stringsAsFactors=FALSE)       
acttest  <- read.table("y_test.txt", stringsAsFactors=FALSE)

#Rename variable
acttrain <- rename(acttrain, ACTIVITY = V1)
acttest  <- rename(acttest , ACTIVITY = V1)

#stack the activities
actall   <- rbind(acttrain,acttest)  

#Read in subject data
message("Reading in subject data")
subtrain <- read.table("subject_train.txt",stringsAsFactors=FALSE)        
subtest <-  read.table("subject_test.txt", stringsAsFactors=FALSE)

#Rename variable
subtrain <- rename(subtrain,ID = V1) 
subtest  <- rename(subtest ,ID = V1)

#stack the subjects
subids   <- rbind(subtrain,subtest)   

#combine the data frames that have ids and activities
idsact   <- cbind(subids,actall)
message("Finished combining id and activities.")

#STEP 3:  RENAME COLS. EXTRACT MEAN AND STD
#**************************************************************************************
#Extract means, std. deviations. Rename and store in SMALLDAT.
feanum <- nrow(features)
smalldat <- idsact

#grab the columns with mean in name
for(i in 1:feanum){
     if(str_detect(features[i,2],"mean")){
          targetm <- assign(features[i,2],bigdata[i])
          smalldat <- cbind(smalldat,targetm)
     }
}

#now get columns with std in name
for(i in 1:feanum){
     if(str_detect(features[i,2],"std")){
          targetsd <- assign(features[i,2],bigdata[i])
          smalldat <- cbind(smalldat,targetsd)
     }
}
message("Extracted only variables with MEAN or STD in name from BIGDATA.")

#STEP 4:  ASSIGN MEANINGFUL NAMES
#*************************************************************************************************
#These are the activities (see ~/activity_labels.txt)
#1=Walking, 2=Walking upstairs, 3=Walking downstairs, 4=Sitting
#5=Standing, and 6=Laying

#Assigning meaningful names to activities
num1 <- nrow(smalldat)

for(i in 1:num1){
     if(smalldat[[i,2]]=="1") smalldat[[i,2]] = "Walking           "
     if(smalldat[[i,2]]=="2") smalldat[[i,2]] = "Walking_upstairs  "
     if(smalldat[[i,2]]=="3") smalldat[[i,2]] = "Walking_downstairs"
     if(smalldat[[i,2]]=="4") smalldat[[i,2]] = "Sitting           "
     if(smalldat[[i,2]]=="5") smalldat[[i,2]] = "Standing          "
     if(smalldat[[i,2]]=="6") smalldat[[i,2]] = "Laying            "
}

#put smalldat into table
findat <- tbl_df(smalldat)

#The given feature names are pretty good. I'm just going to clean
#them up a bit.

#RENAME THE COLUMNS SO MEAN AND STANDARD DEV ARE EASIER TO SPOT
#AND REMOVE DOTS

#First, all the means
names(findat) <- gsub(".mean...X","_MEAN_X",names(findat))
names(findat) <- gsub(".mean...Y","_MEAN_Y",names(findat))
names(findat) <- gsub(".mean...Z","_MEAN_Z",names(findat))
names(findat) <- gsub(".meanFreq...X","_MEAN_Freq_X",names(findat))
names(findat) <- gsub(".meanFreq...Y","_MEAN_Freq_Y",names(findat))
names(findat) <- gsub(".meanFreq...Z","_MEAN_Freq_Z",names(findat))
names(findat) <- gsub(".meanFreq..","_MEAN_Freq",names(findat))
names(findat) <- gsub("Mag.mean..","Mag_MEAN",names(findat))

#Now Standard deviations
names(findat) <- gsub(".std...X","_STDEV_X",names(findat))
names(findat) <- gsub(".std...Y","_STDEV_Y",names(findat))
names(findat) <- gsub(".std...Z","_STDEV_Z",names(findat))
names(findat) <- gsub(".stdFreq...X","_STDEV_Freq_X",names(findat))
names(findat) <- gsub(".stdFreq...Y","_STDEV_Freq_Y",names(findat))
names(findat) <- gsub(".stdFreq...Z","_STDEV_Freq_Z",names(findat))
names(findat) <- gsub(".stdFreq..","_STDEV_Freq",names(findat))
names(findat) <- gsub("Mag.std..","Mag_STDEV",names(findat))

#STEP 5:  CALCULATE MEAN FOR EACH ACTIVITY FOR EACH INDIVIDUAL
#********************************************************************************************************
step1 <- group_by(findat,ID,ACTIVITY)
result <- summarise_each(step1,funs(mean))      #summarize each column for each person and activity
message("Finished calculating result.")

#STEP 6:  WRITE DATA TO OUT FILE
#******************************************************************************************************
write.table(result,file="tidy.txt", row.names=FALSE)
#WANT TO VIEW THE DATASET IN A NICE FORMAT?
viewIt <- read.table("tidy.txt", header = TRUE)
View(viewIt)

