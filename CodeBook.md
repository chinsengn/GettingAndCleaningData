
# Summ_data.csv Data Dictionary

## 180 rows x 81 cols

## Column (field) descriptions 


### subject_id

Numbers from 1 - 30, indicating the 30 volunteers in the test

### activity_nm

denotes the 6 activities performed 
- WALKING, 
- WALKING_UPSTAIRS, 
- WALKING_DOWNSTAIRS, 
- SITTING, 
- STANDING, 
- LAYING

___

#### The following 79 fields are the AVERAGED values of measurement features collected, grouped for each volunteer and activity performed.

|        |        |        |        |        |        |
| ------ | ------ | ------ | ------ | ------ | ------ |
|tBodyAcc-mean()-X	|tBodyAccJerk-mean()-Z	|tBodyGyroJerk-std()-Y	|fBodyAcc-mean()-Z	|fBodyAccJerk-meanFreq()-Y	|fBodyBodyAccJerkMag-mean()	|
|tBodyAcc-mean()-Y	|tBodyAccJerk-std()-X	|tBodyGyroJerk-std()-Z	|fBodyAcc-std()-X	|fBodyAccJerk-meanFreq()-Z	|fBodyBodyAccJerkMag-std()	|
|tBodyAcc-mean()-Z	|tBodyAccJerk-std()-Y	|tBodyAccMag-mean()	|fBodyAcc-std()-Y	|fBodyGyro-mean()-X	|fBodyBodyAccJerkMag-meanFreq()	|
|tBodyAcc-std()-X	|tBodyAccJerk-std()-Z	|tBodyAccMag-std()	|fBodyAcc-std()-Z	|fBodyGyro-mean()-Y	|fBodyBodyGyroMag-mean()	|
|tBodyAcc-std()-Y	|tBodyGyro-mean()-X	|tGravityAccMag-mean()	|fBodyAcc-meanFreq()-X	|fBodyGyro-mean()-Z	|fBodyBodyGyroMag-std()	|
|tBodyAcc-std()-Z	|tBodyGyro-mean()-Y	|tGravityAccMag-std()	|fBodyAcc-meanFreq()-Y	|fBodyGyro-std()-X	|fBodyBodyGyroMag-meanFreq()	|
|tGravityAcc-mean()-X	|tBodyGyro-mean()-Z	|tBodyAccJerkMag-mean()	|fBodyAcc-meanFreq()-Z	|fBodyGyro-std()-Y	|fBodyBodyGyroJerkMag-mean()	|
|tGravityAcc-mean()-Y	|tBodyGyro-std()-X	|tBodyAccJerkMag-std()	|fBodyAccJerk-mean()-X	|fBodyGyro-std()-Z	|fBodyBodyGyroJerkMag-std()	|
|tGravityAcc-mean()-Z	|tBodyGyro-std()-Y	|tBodyGyroMag-mean()	|fBodyAccJerk-mean()-Y	|fBodyGyro-meanFreq()-X	|fBodyBodyGyroJerkMag-meanFreq()	|
|tGravityAcc-std()-X	|tBodyGyro-std()-Z	|tBodyGyroMag-std()	|fBodyAccJerk-mean()-Z	|fBodyGyro-meanFreq()-Y	|	|
|tGravityAcc-std()-Y	|tBodyGyroJerk-mean()-X	|tBodyGyroJerkMag-mean()	|fBodyAccJerk-std()-X	|fBodyGyro-meanFreq()-Z	|	|
|tGravityAcc-std()-Z	|tBodyGyroJerk-mean()-Y	|tBodyGyroJerkMag-std()	|fBodyAccJerk-std()-Y	|fBodyAccMag-mean()	|	|
|tBodyAccJerk-mean()-X	|tBodyGyroJerk-mean()-Z	|fBodyAcc-mean()-X	|fBodyAccJerk-std()-Z	|fBodyAccMag-std()	|	|
|tBodyAccJerk-mean()-Y	|tBodyGyroJerk-std()-X	|fBodyAcc-mean()-Y	|fBodyAccJerk-meanFreq()-X	|fBodyAccMag-meanFreq()	|	|

___
#### The above features are interpreted with the following naming conventions:

|Feature label |Signal description	 |
| ------------ | ------------------- |
|tAcc-XYZ      |	 accelerometer 3-axial raw signals |
|tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ|	 Jerk signals |
|tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag|	 Magnitude of three-dimensional signals calculated using the Euclidean norm |
|tBodyAcc-XYZ|	 body acceleration signals |
|tGravityAcc-XYZ|	 gravity acceleration signals |
|tGyro-XYZ|	 gyroscope 3-axial raw signals |
|fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag|	 Fast Fourier Transform (FFT) of signals. Note the 'f' to indicate frequency domain signals.|
| '-XYZ'|	 is used to denote 3-axial signals in the X, Y and Z directions|
|mean()|	Mean value of signal|
|std()|	Standard deviation of signal|
