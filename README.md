#GCD Course Project
###This repo includes the following:
1. **README.md** provides an overview of the project and contains a copy of the script, run_analysis.R
2. **CodeBook.md** describes the transformations made to the data in run_analysis.R
3. **OrginalCodeBook.md** is the code book for the orginal dataset used in run_analysis.md.  It contains the feature names and descriptions. It should be read first. CodeBook.md assumes the reader is familiar with the dataset and features.
4. **run_analysis.R** is the script that creates tidy.txt. The script was created using R version 3.1.1 for Windows 7 Enterprise.

This project uses data orginally created in the Human Activity Recognition Using Smartphones Dataset (version 1). The goal was to transform the original data that recorded body movements in three dimensions for six activities (walking, standing, etc) into a smaller, tidy, dataset that included the average of the mean and standard deviations of each movement for each activity and each subject.

There is only a single script to run:  *run_analysis.R*. Below is the basic structure of run_analsys.R. Following that is information on running the script.

####STEP 1 Merge datasets
1.  Gets the names of the features from features.txt, which measure the movements of the sujects in three dimensions (X, Y, Z).
2.  Merges the training and test data into one dataset call BIGDATA.

####STEP 2  Data Preparation
1.  Read in the activity data and the training data.
2.  Rename the variables to "id" and "activity" from standard R names like V1 and V2.
3.  Tacks the training and test datasets together. This creates a long data set with 10299 observations and 2 columns, id and activity.  
4.  Combines BIGDATA with the dataset created in #3.

####STEP 3 Extract means and standard deviations
1.  Extract all features with mean or standard deviation (std) in the name.

####STEP 4  Assign Meaningful Names to Activities and Features (variables)
1.  Changes activities from numbers to more descriptive names: walking, walking upstairs, walking downstairs, sitting, standing, laying.
2.  The feature names are already pretty descriptive (ex. BodyGyroMag) so I just cleaned them up to make them easier to read.  See the codebook.md for a list of the specific changes that were made.

####STEP 5 Calculate the Mean feature for each individual and each activity
1.  The data were grouped by id and activity
2.  The data were summarized by mean
3.  The output was written to tidy.txt.

##IMPORTANT INFORMATION ABOUT RUNNING THE SCRIPT
The script, run_analysis.R, was created using R version 3.1.1 for Windows 7 Enterprise. It ran correctly
using RStudio (0.98.1028) and RGui 32bit. I cannot vouch for it in Linux or OS X.

To run in the RGui, select File-> Open Script. Select run_analysis.R. This will open the script in a
new window. Right-click on the script (anywhere) and click on *Select All* (Ctrl-A). Right-click again
and click on *Run Line or Selection* (Ctrl-R). The output will appear in the RGui window.

To run in RStudio, click on File-> Open file. Select run_analysis.R. Highlight all the text and then
click on the *Run* button (located in the top-right of the editing window).

