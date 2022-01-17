Create a class MySelectQuery.

Your constructor will receive a CSV content (as a string), first line will be the name of the column.

Example:

"name,year_start,year_end,position,height,weight,birth_date,college\nAlaa Abdelnaby,1991,1995,F-C,6-10,240,'June 24, 1968',Duke University\nZaid Abdul-Aziz,1969,1978,C-F,6-9,235,'April 7, 1946',Iowa State University\nKareem Abdul-Jabbar,1970,1989,C,7-2,225,'April 16, 1947','University of California, Los Angeles
Mahmoud Abdul-Rauf,1991,2001,G,6-1,162,'March 9, 1969',Louisiana State University\n"
It will be prototyped:

constructor(csv_content)

Implement a where method which will take 2 arguments: column_name and value.
It will return an array of strings which matches the value.

It will be prototyped:

where(column_name, criteria)

Our examples will use these CSV
Nba Player Data
Nba Players
Nba Seasons Stats
