#!/usr/bin/env python3

import csv
import ast

# open file to read csv
file = open("keywords.csv")

# open file1 and file2 to write csv
file1 = open("keyword.csv","w")
file2 = open("haskeyword.csv","w")

# csv reader
csvreader = csv.reader(file)

#csv writers
writer1 = csv.writer(file1)
writer2 = csv.writer(file2)

# get header
header = next(csvreader)

# create headers for the 2 new csv files(db tables) and save them
keyword_header = ["id","name"]
writer1.writerow(keyword_header)

has_keyword_header = ["movie_id","keyword_id"]
writer2.writerow(has_keyword_header)

#list (rows) to save in the haskeyword file
haskeyword_row = []

# write data in the csv files
for row in csvreader:
    data = ast.literal_eval(row[1])
    for i in data:
    
        # write data in the keyword file
        writer1.writerow(list(i.values()))

        # append data int the haskeyword_row
        haskeyword_row.append(int(row[0]))
        haskeyword_row.append(i["id"])

        # write data in the haskeyword file
        writer2.writerow(haskeyword_row)

        # clear(empty) haskeyword_row list
        haskeyword_row.clear()                
       
# close all open files
file.close()
file1.close()
file2.close()
