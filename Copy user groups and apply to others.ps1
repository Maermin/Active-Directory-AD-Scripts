//choose your reference user							 //user who should get the permissions
Get-ADUser -Identity ext-M.Pauels -Properties memberof | Select-Object -ExpandProperty memberof | Add-ADGroupMember -Members ext-D.Brenig
