Getting Data Project Code Book
==============================

## Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Variables

The variables contained in the tidy data have been extracted from the train and test data set. They are the average value of the following signals:

* time_body_accelerometer_XYZ
* time_gravity_accelerometer_XYZ
* time_body_accelerometer_XYZ
* time_body_gyroscope_XYZ
* time_body_gyroscope_jerk_XYZ
* time_body_accelerometer_magnitude
* time_gravity_accelerometer_magnitude
* time_body_accelerometer_magnitude
* time_body_gyroscope_magnitude
* time_body_gyroscope_jerk_magnitude
* frequency_body_accelerometer_XYZ
* frequency_body_accelerometer_jerk_XYZ
* frequency_body_gyroscope_XYZ
* frequency_body_accelerometer_magnitude
* frequency_body_accelerometer_jerk_magnitude
* frequency_body_gyroscope_magnitude
* frequency_body_gyroscope_jerk_magnitude

A full description is available at the following [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Transformations to clean up the data

The steps followed to clean up the data are the following:

* Read data from the two data sets: train and test.
* Join the two data sets merging each column.
* Select columns corresponding to mean and standard deviation features.
* Rename columns with more descriptive names
* Calculate mean of the selected features and create a new data frame.
* Add activity names to new data frame.
* Write tidy data to a file called `tidy_data.txt`.