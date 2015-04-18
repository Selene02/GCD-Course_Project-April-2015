#GCD Course Project
###This repo includes the following:
1. README.md provides an overview of the project and contains a copy of the script, run_analysis.R
2. CodeBook.md describes the transformations made to the data in run_analysis.R
3. OrginalCodeBook.md is the code book for the orginal dataset used in run_analysis.md.  It contains the feature names and descriptions. It should be read first. CodeBook.md assumes the reader is familiar with the dataset and features.
4. run_analysis.R is the script that creates tidy.txt.

This project uses data orginally created in the Human Activity Recognition Using Smartphones Dataset (version 1).

The goal of the course project was to to transform the original data that recorded body movements in three dimensions for six activities (walking, standing, etc) into a a smaller, tidy, dataset that included the average of the mean and standard deviations of each movement for each activity and each subject.

There is only a single script to run for the analysis, run_analysis.R. Below is the basic outline of run_analsys.R.

####STEP 1
1.  Gets the names of the features from features.txt, which measure the movements of the sujects in three dimensions (X, Y, Z).  
