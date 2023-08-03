#PyBank File

import os
import csv
from statistics import mean

months = []
ntotal = []
pfChange = []

#Joins the budget_data csv onto this script
budget_csv = os.path.join ('Resources/budget_data.csv')
budget_txt = os.path.join ('Analysis/BankResults.txt')

with open(budget_csv, 'r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    #Skips Header Line
    csv_header = next (csv_reader)

    for row in csv_reader:
        months.append(row[0])
        #Float allows adding of all real numbers (+ or - #'s)
        ntotal.append(int(row[1]))

#Goes through the Net Totals and find the difference between the next number by current number
for x in range(85):
    y = ntotal[x+1] - ntotal[x]
    pfChange.append(y)

max_value = max(pfChange)
max_index = pfChange.index(max_value)
min_value = min(pfChange)
min_index = pfChange.index(min_value)

print(" ")
print(" Financial Analysis")
print(" ------------------------------------------------")
print(' Total Months: ' + str(len(months)))
print(' Total: $' + str(sum(ntotal)))
print(' Average Change: $' + str((round(mean(pfChange), 2))))
print(' Greatest Increase in Profits: ' + str(months[max_index+1]) + ' ($' + str(max_value) + ')')
print(' Greatest Decrease in Profits: ' + str(months[min_index+1]) + ' ($' + str(min_value) + ')')

with open('Analysis/BankResults.txt', 'w') as txtfile:
    txtwriter = csv.writer(txtfile)
    txtwriter.writerow([" Financial Analysis"])
    txtwriter.writerow([" ------------------------------------------------"])
    txtwriter.writerow([' Total Months: ' + str(len(months))])
    txtwriter.writerow([' Total: $' + str(sum(ntotal))])
    txtwriter.writerow([' Average Change: $' + str((round(mean(pfChange), 2)))])
    txtwriter.writerow([' Greatest Increase in Profits: ' + str(months[max_index+1]) + ' ($' + str(max_value) + ')'])
    txtwriter.writerow([' Greatest Decrease in Profits: ' + str(months[min_index+1]) + ' ($' + str(min_value) + ')'])