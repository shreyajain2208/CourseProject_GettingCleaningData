
##CODE BOOK: COURSE PROJECT (GETTING & CLEANING DATA)


###CodePart1
Purpose:
* Merges the training and the test sets to create one data set.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names

Steps/Tranformations:
* downloading the data
* tidying test data
	* assign the names to x_test using feature.txt (as number of columns in x_test = number of rows in features.txt)
	* merge subject_test, x_test and y_test using rbind (as number of rows are same in these)
	* assign activity name to each activity of y_test using labels

* tidying train data (same as test)

* merge the tidy test and train datasets

Output:
* "data" is the dataset final dataset obtained at this step (10299 obs and 563 var).

###CodePart2
Purpose:
* Extracts only the measurements on the mean and standard deviation for each measurement.

Input: 
* "data" is the merged test and train data frame

Output: 
* "data" is out dataset that contains only mean and std measures

###CodePart3
Purpose:
* Computes the mean of every variable for each activity and each subject and appends them together.

Input: 
* "data" is out dataset that contains only mean and std measures

Output: 
* "finalData" is final dataset created and saved as text file.
* variable "activity_subject represents the activity or subject for which the mean of subsequent measures have been computed.
