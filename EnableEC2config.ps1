$path = 'C:\Program Files\Amazon\Ec2ConfigService\Settings\config.xml'
$StateValue ='Enabled'


$xml = [xml](Get-Content $path)
$node = $xml.Ec2ConfigurationSettings.Plugins.Plugin | where {$_.Name -eq 'Ec2SetPassword'}
$node.State = $StateValue

$node = $xml.Ec2ConfigurationSettings.Plugins.Plugin | where {$_.Name -eq 'Ec2HandleUserData'}
$node.State = $StateValue

$xml.Save($path)