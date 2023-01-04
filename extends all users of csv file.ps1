#imports a csv file from the selected path
$users = import-csv -Path "C:\USERverlaengern.csv"

#loop that goes through each user of the file once
foreach ($user in $users){

#Extends all users in the list up to the selected point in time
Set-ADUser -Identity $user.SamAccountName -AccountExpirationDate "02/01/2023 5:00:00 PM"

#echo"settinguser" $user
#Get-ADUser -Identity $user.SamAccountName
}