#CodeBook for run_analysis.R

xtest - data frame containing data extracted from X_test.txt
xtrain - data frame containing data extracted from X_train.txt

X - combined data frame containing the data from xtest and xtrain

ytest - data frame containing activity values extracted from y_test.txt
ytrain - data frame containing activity values extracted from y_train.txt

subtest - data frame containing subject values extracted from subject_test.txt
subtrain - data frame containing subject values extracted from subject_train.txt

Subject - combined data frame of the subject values

activity - data frame containing activity values and their corresponding labels
features - data frame containing feature names

(in for loop)
ind - index for rows where ytest has a value of "1"
ytest$V1[ind] - assignment for activity label based on the corresponding value
same goes again for ind2 and ytrain$V1[ind]

Y - data frame containing labeled activities

names(X) - assignment of feature names to columns

indFeat - column index of features that contain "mean()" or "std()" in name

Data - combined data frame of cleaned X, Subject, and renamed Y

end - number of columns that Data has

numSubjects - number of unique subjects in data set

numActivities - number of unique activities in data set

Data2 - second data set containing the average value of each activity for each subject

i - corresponds to the row value of Data2
s - index marker for which subject the for loop is on
a - index marker for which activity the for loop is on
ind - index for row values where the indicated subject and activity coincide

