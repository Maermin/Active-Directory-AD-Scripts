#imports a csv file from the selected path
$users = import-csv -Path "C:\UserDeaktivieren.csv"

#loop that goes through each user of the file once
foreach ($user in $users){

#disabled all users in the list one after the other
Disable-ADAccount -Identity $user.SamAccountName
}

