<powershell>

$instance_id = Invoke-WebRequest  http://169.254.169.254/latest/meta-data/instance-id | select -Expand content
$tag_name = aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].Tags[?Key==`Name`].Value[]' | ConvertFrom-Json


$DN = "alturamso.com"
$ServerName = $tag_name

Install-WindowsFeature RSAT-AD-PowerShell

Add-Computer -DomainName $DN -NewName $ServerName -Credential (New-Object -TypeName PSCredential -ArgumentList "<DomainUSER>",(ConvertTo-SecureString -String '<DomainPW>' -AsPlainText -Force)[0]) -Restart

</powershell>