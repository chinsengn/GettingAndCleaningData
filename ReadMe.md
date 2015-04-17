
# ReadMe for run_analysis.R

This .R script consist of 5 parts.

## Part 1
- load the ```dplyr``` package
- make a lookup data table (**ac_llk**) wtih 2 columns - **activity** (number 1 - 6) and  **activity_nm** (descriptive names) by reading the file _activity_labels.txt_ 

## Part 2
Processing the files from the _Train_ folder, 
- read _y_train.txt_ into **a** - this contains the list of activities performed by each volunteer (identified by subject_id)
- read _subject_train.txt_ into **s** - this contains the list of subject ids associated with the activities performed
- use ```cbind``` to merge them into 1 data table (**train**) with 2 columns - **activity** and **subject_id**
- use ```mutate``` to add a 3rd column called **data_typ** that identifies this as the "Training" set
- use ```left join``` to  add **activity_nm** column by matching **activity** columns in **train** and **ac_llk**. Note that ```left join``` does not re-sort the rows in the data table
- read the descriptive names for the measurement features from _'features.txt'_ into data table (**features**).
- using ```grep```, I get the positions and full names of the Mean() and Std() features, assign them to vectors **meanStdColumnPos** and **meanStdColumnNames**
- read in the variables values from file _X_train.txt_ into data table (**v**). The columns in **v** are not named but their names are listed in **features**.
- ```select``` the mean and std columns from **v** using the col positions from **meanStdColumnPos**, this is data table **v_meanstd_only** which I then rename its columns with  extracted names in **meanStdColumnsNames**
- merge the **train** table with **v_meanstd_only**

The outcome of Part 2 is a data table - **train** (7352 x 83)

## Part 3
Part 3 works like Part 2, except it processes corresponding files from the _Test_ folder instead.

The outcome of Part 3 is a data table - **test** (2947 x 83)

## Part 4
Taking the **train** and **test** data tables, 
- use ```rbind_list``` to merge their rows into one data table - **all_data** (10299 x 83)

Note that the columns in **all_data** are now: **activity, subject_id, data_typ, activity_nm** and all the measurment fields related to mean() or std().

## Part 5
With **all_data**,
-   since we are not using them, throw out the **data_typ, activity** col by using ```-dat_typ, -activity``` in the ```select```,
-  then ```group_by``` dataset by **activity_nm** and **subject_id**,
-  then ```summarise_each``` of the measurement variables by computing their ```mean```
-  write the summarised data set into external txt file - _summ_data.txt_ in the same path as this .R script

Note that col names of the measurement variables were **not changed** after the ```summarise_each``` function but their values are.

The output of Part 5 is a text file - _summ_data.txt_ (180 x 81)
