#This command pulls in a CSV file AD User
Get-Content C:\Dataowner.csv | Get-ADUser | 
#Check user is disabled or enabled and is output as a csv file.
select SamAccountName,Enabled | Out-File  C:\StatusAccounts.csv
