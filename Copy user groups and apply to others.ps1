#choose your reference user							           #user who should get the permissions
Get-ADUser -Identity Paul -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members Tobi
