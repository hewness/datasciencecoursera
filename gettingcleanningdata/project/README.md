README
=========================

Objective
-------------------------
A group of researchers set out to to create a human activity recognition database out of the data recorded from thirty subjects performing different activities while carrying a cell phone with an accelerometer. Out objective is take the raw data that was collected and create a tidy data set.

The Data
-------------------------

The data used to generate the tidy set can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It is a zip file that contains a training data set and a test data set. Additionally, there are other pieces of data in seperate files that contains information on the activities, the description of the test data, and the subjects. Our goal is to process these disparate pieces of data into a unified tidy data set that is grouped by subject, activity and displays the average of all collected data that is either a mean or standard deviation.

The Code
-------------------------

The run_analysis.R code performs the following in order to create the tidy data set:

1. Downloads the raw data (this code is commented out, assuming that the data is already in the working directory)
2. Performs the following for both the training and test data:
  * Reads the features, activity, subject, x, and y data into different data tables.
  * Takes the features data and makes them the column names for the x data.
  * Binds the subject, y, and x data columns together into a single data table.
  * Merges the combined data table with the descriptive activity data.
3. Unions the marshalled test and training data into a single data table.
4. From the unioned table, prunes data that do not to pertain to standard deviation and mean.
5. Of the pruned data, renames the columns to be more descriptive and human readable.
6. Performs an aggregation on the pruned data to group the data by subject and activity and then find the average for each column that remains in the data table.
7. Writes the aggregated table to disk as a tab delimited text file.
