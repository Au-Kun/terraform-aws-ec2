<powershell>

$instance_id = Invoke-WebRequest "http://169.254.169.254/latest/meta-data/instance-id" | Select-Object -Expand content
$tag_name = aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].Tags[?Key==`Name`].Value[]' | ConvertFrom-Json

$DN = "alturamso.com"
$ServerName = "$tag_name"

# Retreives domain username and password from AWS Parameter Store
$domainuser = (Get-SSMParameter -Name msoAWSDomainUser -WithDecryption $true).Value
$domainpw = (Get-SSMParameter -Name msoAWSDomainPW -WithDecryption $true).Value

#Set Instance Timezone to PST
Set-TimeZone -Id "Pacific Standard Time"

#Install AD Module for Powershell
Install-WindowsFeature RSAT-AD-PowerShell

#Join computer to domain
Add-Computer -DomainName $DN.ToUpper() -NewName $ServerName.ToUpper() -Credential (New-Object -TypeName PSCredential -ArgumentList "$domainuser", (ConvertTo-SecureString -String "$domainpw" -AsPlainText -Force)[0]) -Restart

</powershell>