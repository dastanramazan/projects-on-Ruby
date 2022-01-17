Description


We have been provided a dataset of sales from My Online Coffee Shop. It's a CSV (Comma Separated Values) (each columns are separated by , and each line by \n)
Our goal will be to identify customer who are more likely to buy coffee online.

Ok, this time we will have to create a function with code logic and not just return the solution hard coded :D

Data management is hard problem, as hard problem we have to split them into smaller one.

Here is our second step: data transformation. This exercise follow step one.

You will receive the output of your function my_data_transform.

Our function will group the data and it will become a Hash of hash. (Wow.)
Example:
"{'Gender': {'Male': 22, 'Female': 21}, 'Email': {'yahoo.com': 3, 'hotmail.com': 2}, ...}"

We will discard the column FirstName, LastName, UserName and Coffee Quantity from our output.

Your function will be prototyped: def my_data_process
It will take a string array which is the output of your function my_data_transform, it will return a json string of hash of hash following this format:
{COLUMN: {Value1: nbr_of_occurence_of_value_1, Value2: nbr_of_occurence_of_value_2, ...}, ...}
Order of Column will be the order they are in the header of the CSV (Gender first then Email, etc)
Order of the Value will be the order they appear in each line from top left.
