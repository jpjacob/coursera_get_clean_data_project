#Data Sets Used

The data represents measurements for 30 subjects, across 6 different activities (walking, walking upstairs, walking downstairs, 
sitting, standing and laying). The data is broken into a test group (30%) and a training group (70%).

The raw data provided can be classified as:
1. x_train.txt and x_test.txt - statistic values of 560 attributes associated with each measurement. This had 561 rows.
2. y_train.txt and y_test - activity identifiers for each measurement. This was established since it took only 6 values.
3. subject_train.txt and subject_test.txt - subject identifiers for each measurement. This took 30 values.
4. features.txt - a table listing each of the measured attributes, which is used to assign column names to 1.
5. activity_labels.txt - a lookup table that links the activity identifiers in 2. to activity names.

The total data had 10,299 observations, broken into test (2,947 observations) and training (7,352 observations).

#Processing

1. All data read through the read.table() function.
2. Column names assigned as described above.
3. x_train.txt and x_test.txt subset to columns containing only mean or std in the column name. To do this a logical vector 
is created by the grepl() function to match on 'mean' and 'std'. This is then used for subsetting columns.
4. Test and training data stacked using the rbind() function and the data is brought together (x_, y_ and subject_ sets) 
using the cbind() function.
5. The column names were cleaned up using the gsub() function, where abbreviations were expanded. For example, Acc was 
expanded to Acceleration, and Gyro to Gyroscope. t was expanded to Time and f to Frequency, as per the readme file 
provided with the raw data. Additionally, parentheses were excluded and repeating words were replaced with only one word (e.g. 
BodyBody was replaced with Body. 
6. The aggregate() function was used to generate a summary of mean values of the observations at a subject and activity level.
