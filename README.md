------------------------------
	run_analysis.R 
------------------------------
The script performs the below actions:
 - merge the test and train datasets together to produce a superset, only keep the MEAN and STD columns
 - assign the subject name into each columns header of this superset from feature.txt 
 - assign the activity name for each row from activity_labels.txt
 - rename the columns to a more meanningful name
 - calculate the mean for each subject/columns by activities 
 - output the aggregated dataset
  
