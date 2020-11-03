<powershell>

$instance_id = Invoke-WebRequest "http://169.254.169.254/latest/meta-data/instance-id" | Select-Object -Expand content
$tag_name = aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].Tags[?Key==`Name`].Value[]' | ConvertFrom-Json

$DN = "alturamso.com"
$ServerName = "$tag_name"

#Set Timezone to PST
Set-TimeZone -Id "Pacific Standard Time"

#Install AD Module for Powershell
Install-WindowsFeature RSAT-AD-PowerShell

#Join computer to domain
Add-Computer -DomainName $DN -NewName $ServerName -Credential (New-Object -TypeName PSCredential -ArgumentList "<domainusername>", (ConvertTo-SecureString -String '<password>' -AsPlainText -Force)[0]) -Restart

</powershell>