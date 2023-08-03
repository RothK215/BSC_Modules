#PyPoll
from ast import And
from math import degrees
import os
import csv

voterid = []
voteid = 0
Stockham = 0
DeGette = 0
Doane = 0
election_csv = os.path.join ('Resources/election_data.csv')
election_txt = os.path.join ('Analysis/PollResults.txt')

with open(election_csv, 'r') as csvfile:
    csv_reader = csv.reader(csvfile, delimiter=',')
    csv_header = next (csv_reader)

    for row in csv_reader:
        voterid.append(row[0])
        if row[2] == 'Charles Casper Stockham':
            Stockham = Stockham + 1
        if row[2] == 'Diana DeGette':
            DeGette = DeGette + 1
        if row[2] == 'Raymon Anthony Doane':
            Doane = Doane + 1

voteid = int(len(voterid))
stockhamv = round(((int(Stockham)/int(voteid))*100), 3)
degettev = round(((int(DeGette)/int(voteid))*100), 3)
doanev = round(((int(Doane)/int(voteid))*100), 3)

if (Stockham > DeGette) and (Stockham > Doane):
    Winner = 'Charles Casper Stockham'
if (DeGette > Stockham) and (DeGette > Doane):
    Winner = 'Diana DeGette'
if (Doane > Stockham) and (Doane > DeGette):
    Winner = 'Raymon Anthony Doane'

print(' ')
print(' Election Results')
print(' -----------------------------------')
print(' Total Votes: ' + str(voteid))
print(' -----------------------------------')
print(' Charles Casper Stockham: ' + (str(stockhamv)) + '% (' + str(Stockham) + ')')
print(' Diana DeGette: ' + (str(degettev)) + '% (' +str(DeGette) + ')')
print(' Raymon Anthony Doane: ' + (str(doanev)) + '% (' +str(Doane) + ')')
print(' -----------------------------------')
print(' Winner: ' + str(Winner))

with open(election_txt, 'w') as txtfile:
    #Not adding a delimiter allows me to not have spaces between letters in the quotes, but
    # requires me to put the quotes in brackets other wise, quotes become null
    txtwriter = csv.writer(txtfile)
    txtwriter.writerow([f'Election Results'])
    txtwriter.writerow([f'-----------------------------------'])
    txtwriter.writerow([f'Total Votes: ' + str(voteid)])
    txtwriter.writerow([f'-----------------------------------'])
    txtwriter.writerow([f'Charles Casper Stockham: ' + (str(stockhamv)) + '% (' + str(Stockham) + ')'])
    txtwriter.writerow([f'Diana DeGette: ' + (str(degettev)) + '% (' +str(DeGette) + ')'])
    txtwriter.writerow([f'Raymon Anthony Doane: ' + (str(doanev)) + '% (' +str(Doane) + ')'])
    txtwriter.writerow([f'-----------------------------------'])
    txtwriter.writerow([f'Winner: ' + str(Winner)])