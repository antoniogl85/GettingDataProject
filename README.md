GettingDataProject
==================

Repository for Course Project for Getting and Cleaning Data on Coursera

## Content

This repository contains two files: `run_analysis.R` and `CodeBook.md`. The first one is a script developed to create a tidy data set from raw data. The second one is a markdown file that describes the variables, the data, and any transformations or work that have been performed to clean up the data.

## Execution

To execute the script `run_analysis.R` it is necessary that the working directory contains the following files:

* `activity_labels.txt`
* `features.txt`
* a directory named `test` than contais `subject_test.txt`, `X_test.txt` and `y_test.txt`
* a directory named `train` than contais `subject_train.txt`, `X_train.txt` and `y_train.txt`

In addition, `plyr` package has to be installed on R. If it is not, it can be done using the command `install.packages("plyr")`.

The script file has to be in the same directory, the command to execute is `source("run_analysis.R")`. This script reads the files listed above and merges the two data sets, test and train. It selects the columns that contains the mean or the standard deviation of the features and creates a new data set with the average value of the selected data. This tidy data set is stored in a file called `tidy_data.txt`.