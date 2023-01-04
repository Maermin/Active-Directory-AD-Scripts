#only search for users who have not logged in for more than x days in your selected ou. (I used 90 days for my test)
Search-ADAccount -Searchbase "OU=YOUR,OU=OU,OU=STRUCTUR,DC=*,DC=*" -AccountInactive -UsersOnly -TimeSpan 90.00:00:00 | 
#lists only activated users
Where {$_.Enabled -eq "True"} |
#sorted by last logon date
sort -property LastLogonDate -desc |
#gives us a .csv file with the names of the users, the last logon tag and whether the user is enabled.
ft Name, LastLogonDate, Enabled -autosize  | Out-File  C:\lastxdaysoff.csv
