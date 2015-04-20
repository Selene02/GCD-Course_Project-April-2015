#Code Book for run_analysis.R that creates tidy.txt

Creatd using R version 3.1.1 for Windows 7.  Additional information on the original data is contained in OriginalCodeBook.md in this repository.  You should read OriginalCodeBook.md first.

##The columns of tidy.txt are as follows:
- Column 1:  id is the individual identified as a number rannging from 1 to 30.
- Column 2:  activity is the activity the person is doing when measured (ex. sitting, standing, etc.)
- Columns 4 to 81: These are the mean of each feature for each activity for each individual.  The features quantify the movements in three dimensions represented by X, Y, and Z.
- Each row represents an individual, an activity, and the measurements recorded for that activity.

##Changes to features and names
1.  Individuals are identified by number. The range is 1 to 30.
2.  The activities are initially identified by number. These are changed to descriptive names in tidy.txt.  The activites are:  1 = walking; 2 = walking_upstairs; 3 = walking_downstairs; 4 = sitting; 5 = standing; 6 = laying.
3.  The following features are in both the train and test datasets for each axis (X, Y, and Z).  The features are normalized and bounded within [-1,1].
4.  Removed "t" and "f" from the beginning of each name
5.  Changed all names to lower case
6.  Changed "acc" to "acceleration" and "gyro" to "gyroscope"
7.  Removed "mean" and "std" from the middle of each name and moved it to the front of its respective name.
8.  Changed "bodybody" in some names to "body"
9.  Removed all periods


##More on feature descriptions
- 'Inertial signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Feature Transformations
The training and test datasets were merged into one large file called BIGDATA, which also included the ID numbers and the activities.

All the features including "mean" or "std" (standard deviation) in the name were extracted.  The feature names were cleaned up by replacing mean with MEAN and std with STDEV.  Also, periods in the names were removed, which were introduced when the data were read into R.

The data were then group by ID and ACTIVITY using the **group_by** function.

The mean of each feature for each indivudla (ID) and each activity was calculated using **summarize** and the **mean** function.


