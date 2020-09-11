<powershell>

$identity = (Invoke-WebRequest -Uri http://169.254.169.254/latest/dynamic/instance-identity/document).Content | ConvertFrom-Json

$identity.instanceId


</powershell>