<powershell>

$DN = "alturamso.com"
$ServerName = "AMOMNISRC"

Install-WindowsFeature RSAT-AD-PowerShell

Add-Computer -DomainName $DN -NewName $ServerName -Credential (New-Object -TypeName PSCredential -ArgumentList "<DomainUSER>",(ConvertTo-SecureString -String '<DomainPW>' -AsPlainText -Force)[0]) -Restart

</powershell>