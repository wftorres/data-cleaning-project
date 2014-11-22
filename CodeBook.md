###Data Cleaaning Course Project
==========================================================
####Project course for the Getting and Cleaning data course. 
#####Fernando Torres
#####v1.0, Nov 2014
==========================================================
#####Summary
The object is to apply  technques for consolidation and data cleanup discussed in the course. The assignment was to work with the result data from the experiment on Human Activity Recognition (HAR) Using Smartphones. (Further information about this experiment and its dataset may be found at https://sites.google.com/site/smartlabunige/software-datasets/har-dataset).

The tecniques applied in this data project are

1. Joining two separate and identical datasets
2. Extracting a subset of the columns to manipulate.
3. Consolidating/Merging separate tables into a single one
4. Renaming the variables to comply with tidy data principles
5. Summarizing the data and writing it in a new file.

#####Variable Description
During the experiment, Acceleration and jerk in each of the 3 dimensional axis (X,Y,Z) were measured by the 
smartphone accelerometer and gyroscope. The measurements were transfored by a FFT to obtain frequency data.

The following, more detailed, description has been taken directly from the har-dataset codebook.

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. *
A more detailed description of the variables can be found in the **features_info.txt** file, provided in the dataset.

As part of the exercise, the measurements of the mean and standard deviation for all measurements were chosen.

#####Variable Names
The final file **"tidy_dataset.txt"** is a wide-format dataset (each row contains a measurement for every variable) with the average (mean) of every selected variable by activity and subject.
The variables in the analysis are

1.    timeBodyAcceleration.mean...X
2.	timeBodyAcceleration.mean...Y
3.	timeBodyAcceleration.mean...Z
4.	timeGravityAcceleration.mean...X
5.	timeGravityAcceleration.mean...Y
6.	timeGravityAcceleration.mean...Z
7.	timeBodyAccelerationJerk.mean...X
8.	timeBodyAccelerationJerk.mean...Y
9.	timeBodyAccelerationJerk.mean...Z
10.	timeBodyGyro.mean...X
11.	timeBodyGyro.mean...Y
12.	timeBodyGyro.mean...Z
13.	timeBodyGyroJerk.mean...X
14.	timeBodyGyroJerk.mean...Y
15.	timeBodyGyroJerk.mean...Z
16.	timeBodyAccelerationMagnitude.mean..
17.	timeGravityAccelerationMagnitude.mean..
18.	timeBodyAccelerationJerkMagnitude.mean..
19.	timeBodyGyroMagnitude.mean..
20.	timeBodyGyroJerkMagnitude.mean..
21.	freqBodyAcceleration.mean...X
22.	freqBodyAcceleration.mean...Y
23.	freqBodyAcceleration.mean...Z
24.	freqBodyAccelerationJerk.mean...X
25.	freqBodyAccelerationJerk.mean...Y
26.	freqBodyAccelerationJerk.mean...Z
27.	freqBodyGyro.mean...X
28.	freqBodyGyro.mean...Y
29.	freqBodyGyro.mean...Z
30.	freqBodyAccelerationMagnitude.mean..
31.	freqBodyAccelerationJerkMagnitude.mean..
32.	freqBodyGyroMagnitude.mean..
33.	freqBodyGyroJerkMagnitude.mean..
34.	timeBodyAcceleration.std...X
35.	timeBodyAcceleration.std...Y
36.	timeBodyAcceleration.std...Z
37.	timeGravityAcceleration.std...X
38.	timeGravityAcceleration.std...Y
39.	timeGravityAcceleration.std...Z
40.	timeBodyAccelerationJerk.std...X
41.	timeBodyAccelerationJerk.std...Y
42.	timeBodyAccelerationJerk.std...Z
43.	timeBodyGyro.std...X
44.	timeBodyGyro.std...Y
45.	timeBodyGyro.std...Z
46.	timeBodyGyroJerk.std...X
47.	timeBodyGyroJerk.std...Y
48.	timeBodyGyroJerk.std...Z
49.	timeBodyAccelerationMagnitude.std..
50.	timeGravityAccelerationMagnitude.std..
51.	timeBodyAccelerationJerkMagnitude.std..
52.	timeBodyGyroMagnitude.std..
53.	timeBodyGyroJerkMagnitude.std..
54.	freqBodyAcceleration.std...X
55.	freqBodyAcceleration.std...Y
56.	freqBodyAcceleration.std...Z
57.	freqBodyAccelerationJerk.std...X
58.	freqBodyAccelerationJerk.std...Y
59.	freqBodyAccelerationJerk.std...Z
60.	freqBodyGyro.std...X
61.	freqBodyGyro.std...Y
62.	freqBodyGyro.std...Z
63.	freqBodyAccelerationMagnitude.std..
64.	freqBodyAccelerationJerkMagnitude.std..
65.	freqBodyGyroMagnitude.std..
66.	freqBodyGyroJerkMagnitude.std..

