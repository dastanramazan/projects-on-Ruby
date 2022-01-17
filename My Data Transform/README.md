Description
We have been provided a dataset of sales from My Online Coffee Shop. It's a CSV (Comma Separated Values) (each columns are separated by , and each line by \n)
Our goal will be to identify customer who are more likely to buy coffee online.

Data management is hard problem, as hard problem we have to split them into smaller one.

Here is our first step: data prep.

You noticed our CSV is composed of 3 columns we cannot group them easily: Email - Age - Order At.

For the email, we will consider the provider.
For the age column, we consider a group from [1->20] - [21->40] - [41->65] - [66->99]
For the Order at column, we consider a group for [morning => 06:00am -> 11:59am] - [afternoon => 12:00pm -> 5:59pm] - [evening => 6:00pm -> 11:59pm]

You will have to create a function which will replace the value in each of this column with the correct actionable data.
(ex: if the age is between 21 and 40, replace by "21->40")

Order At is a little more tricky.

Your function will be prototyped: def my_data_transform(csv_content)
It will take a string which contains data in CSV format and it will return a string in CSV format with the column Email, Age and Order At transformed.

