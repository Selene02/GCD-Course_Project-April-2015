#Code book describing transformations to the original dataset to create tidy.txt.  

##The columns of tidy.txt are as follows:
- Column 1:  ID is the individual identified as a number rannging from 1 to 30.
- Column 2:  ACTIVITY is the activity the person is doing when measured (ex. sitting, standing, etc.)
- Columns 4 to 81: These are the mean of each feature for each activity for each individual.  The features quantify the movements in three dimensions represented by X, Y, and Z. 

##Feature Descriptions
1.  Individuals are identified by number. The range is 1 to 30.
2.  The activities are initially identified by number. These are changed to descriptive names in tidy.txt.  The activites are:  1 = WAlKING; 2 = WALING UPSTAIRS; 3 = WALING DOWNSTAIRS; 4 = SITTING; 5 = STANDING; 6 = LAYING.
3.  The following features are in both the train and test datasets for each axis (X, Y, and Z).  The features are normalized and bounded within [-1,1].

- 'Inertial signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


The training and test datasets were merged into one large file called bigdata.  All the features including "mean" or standard deviation "std" in the name were extracted.  
