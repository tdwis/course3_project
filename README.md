------------------------------
	run_analysis.R 
------------------------------
The script performs the below actions:
 - merge the test and train datasets together to produce a superset, only keep the MEAN and STD columns
 - assign the measurements names into each columns header of this superset from feature.txt 
 - assign the activities names for each row from activity_labels.txt
 - rename the columns to a more meanningful name
 - calculate the mean for each measurements/columns by activities 
 - output the aggregated dataset
  
