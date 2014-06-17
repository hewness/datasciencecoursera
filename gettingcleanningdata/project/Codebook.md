Codebook
=========================

Description
-------------------------
The source data for this project was constructed by a group of researchers who set out to create a human activity recognition database in order to identify various basic human activities with accelerometer data. Thirty subjects were used in this study and performed activities such as walking, sitting, and standing. 

The goal of our project is to construct a tidy set using R. The tidy data set is an assembly of disaparate activity, subject, and accelerometer data. 

File Information
-------------------------

run_analysis.R writes an aggregated data table that is grouped by subject and activity. All of the other data columns represent a mean of all mean and standard deviation data captured in the human activity recognition database.

The column names take on the following pattern:
* The first column is Subject which is the unique identifier of a volunteer.
* The second column is Activity which describes the activity that the volunteer was performing (i.e. Sitting, Standing, etc.)
* The next 66 columns represent aggregated means of the mean and standard deviation data collected from the accelerometer. 
** Mean column names would be denoted with *-mean and standard deviation would be denoted by *-std.
** The accelerometer data captures data on three axises: X, Y, and Z. The column names would have -X, -Y, and -Z respectively as a suffix.

The text file of the outputted tidy data set is delimited by tabs and written to a file called tidyData.txt.