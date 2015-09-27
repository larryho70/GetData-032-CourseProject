Getting and Cleaning Data Course Project

This assignment combines data collected by a team of UCI students involving recognition of 
human activities using the accelerator and gyroscope of a smart phone (Samsung Galaxy S2).

An R script, run_analysis.R was created to read in the data and create the tidy data set.

The script assumes that the data files from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
have been downloaded and unzipped in the home directory of R.  If dplyr and tidyr have already been installed or when running
the script a second time, you may have to comment out the install.packages and library commands from the script.

The script will create two files in the work directory, tidy_data.txt and tidy_data_mean.txt

* tidy_data.txt - the train and test files are combined along with the volunteer/activity that describes which 
volunteer and what activity was being measured.  Only the mean and standard deviation variables (columns) are
selected.
* tidy_data_mean.txt - the data for each volunteer/activity are summarized by calculating the mean of the
measurements

