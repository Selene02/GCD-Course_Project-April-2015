#GCD Course Project
###This repo includes the following:
1. **README.md** provides an overview of the project and contains a copy of the script, run_analysis.R
2. **CodeBook.md** describes the transformations made to the data in run_analysis.R
3. **OrginalCodeBook.md** is the code book for the orginal dataset used in run_analysis.md.  It contains the feature names and descriptions. It should be read first. CodeBook.md assumes the reader is familiar with the dataset and features.
4. **run_analysis.R** is the script that creates tidy.txt.

This project uses data orginally created in the Human Activity Recognition Using Smartphones Dataset (version 1).

The goal of the course project was to to transform the original data that recorded body movements in three dimensions for six activities (walking, standing, etc) into a a smaller, tidy, dataset that included the average of the mean and standard deviations of each movement for each activity and each subject.

There is only a single script to run for the analysis, run_analysis.R. Below is the basic outline of run_analsys.R.

####STEP 1 Merge datasets
1.  Gets the names of the features from features.txt, which measure the movements of the sujects in three dimensions (X, Y, Z).
2.  Merges the training and test data into one dataset call BIGDATA.

####STEP 2  Data Preparation
1.  Read in the activity data and the training data.
2.  Rename the variables to ID and ACTIVITY from standard R names like V1 and V2.
3.  Tacks the training and test datasets together. This creates a long data set with 10299 observations and 2 columns, ID and ACTIVITY.  
4.  Combines BIGDATA with the dataset created in #3.

####STEP 3 Extract means and standard deviations
1.  Extract all features with mean or standard deviation (std) in the name.

####STEP 4  Assign Meaningful Names to Activities and Features (variables)
1.  Changes activities from numbers to more descriptive names: walking, walking upstairs, walking downstairs, sitting, standing, laying.
2.  The feature names are already pretty descriptive (ex. BodyGyroMag) so I just cleaned them up to make them easier to read.  This was done by changing "mean" and "std" to MEAN and STDEV and also removing periods from the names that were introduced when it was read into R.

####STEP 5 Calculate the Mean feature for each individual and each activity
1.  The data were grouped by ID and ACTIVITY
2.  The data were summarized by mean
3.  The output was written to tidy.txt.



