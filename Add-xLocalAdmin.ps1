#pre Windows Server 2016
Invoke-Command -ComputerName server1 -ScriptBlock {net localgroup Administrators "domain\username or group" /add}

#post Windows Server 2016
Invoke-Command -ComputerName server1 -ScriptBlock {Add-LocalGroupMember -Group "Administrators" -Member "domain\username or group"}

#to add some logic determening system then execute relevant command
#get user input
#use advanced paramters
