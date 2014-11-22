###Data Cleaning Course Project
####README
=====================
####Course Project for the Getting and Cleaning Data course
=====================
#####Fernando Torres
=====================

The assignment was to take two data sets for test and training data captured by data collected from the accelerometers from the Samsung Galaxy S smartphone while the experiment subjects performed different activities, combine them and perform several transformations in order to produce a tidy data set.

A script called run_analysis was developed to transform the data sources into the tidy set. Rather than using functions, which would have produced a more compact and simpler script, the code was developed entirely within the script to increase readability by the graders.

The script assumes the dataset is stored locally. A variable called **path2fies** has been created to identify the folder where the dataset is stored. It's being manually assigned in the script.

The steps to transform the data set were as follows:

1. Read the test data set into three different dataframes capturing the subjects, activities and measurements. (subjectsdf, activitydf and measuredf). Techiniques to optimize the data reading were applied to improve the script efficiency.
2. Read the training data files set and bind them into the dataframes created in the previous step
3. Identify all the columns on the mean and standard deviation for each measurement and store them in a dataframe called selcols. (The columns were selected as per the exercise instructions.)
4. Used the selcols dataframe to transform measuredf, keeping only the required columns
5. Extract the measurements names from the features.txt file in a dataframe called varnamesdf
6. Update the column names in measuredf with the variable names in varnamesdf
7. Merge the subject, activity, activity name and measurements dataframes in a single one.
8. Update the column names to comply with principles of tidy dataframeas
9. Create a new dataframe (tidymeasuresdf) which groups the measurements by subject and activity (including activity names) and calculate the average (mean) for each column.
10. Finally, create a file which contains the tidy data.

