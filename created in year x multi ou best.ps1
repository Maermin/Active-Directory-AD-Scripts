$OUListe = @(
    'OU=Your,OU=OU,OU=structur,OU=xyz,OU=_xyz,DC=xyz,DC=xyz',
    'OU=Your,OU=OU,OU=structur,OU=xyz,OU=_xyz,DC=xyz,DC=xyz',
    'OU=Your,OU=OU,OU=structur,OU=xyz,OU=_xyz,DC=xyz,DC=xyz',
    'OU=Your,OU=OU,OU=structur,OU=xyz,OU=_xyz,DC=xyz,DC=xyz',
    'OU=Your,OU=OU,OU=structur,OU=xyz,OU=_xyz,DC=xyz,DC=xyz'
)

@(
Foreach($OU in $OUListe){
    $Start = Get-Date -Day 01 -Month 01 -Year 2022 -Hour 00 #start date
    $End = Get-Date -Day 31 -Month 12 -Year 2022 -Hour 23 -Minute 59 #end date
    $Users = Get-ADUser -Filter * -SearchBase $OU -Properties Name,WhenCreated,DistinguishedName , whenCreated | ? { ($_.whenCreated -gt $Start) -and ($_.whenCreated -le $End) } #builds the table
    
    Foreach($User in $Users){
    
    [pscustomobject]@{Name=$User.Name;WhenCreated=$User.WhenCreated;DistinguishedName=$User.DistinguishedName}
    }

}) | Export-CSV -NoTypeInformation C:\usacccreated2022.csv #outputs a csv table

