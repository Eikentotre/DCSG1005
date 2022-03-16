# This file will contain notes to self

Scripts ogsånt - [heat-mono](https://gitlab.com/erikhje/heat-mono)

Idémyldring: 

## Bergsprekken.Trening - Treningsutstyr

Økonomi og regnskap, administrasjon(ledelsen og personal), IT-avdeling,
 selgere, 

 OU:   
 Servere, Computers,

 Domenet: Bergsprekken
 Brukere, grupper, maskinvare 


### 1. Lag stacken i skyhigh.

### 2. Legg IP og passord til VM'ene i myvms.ps1(/bash)

### 3. Oppgrader (som administrator) til powershell core

```powershell
# search powershell, right click, Run as administrator

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y powershell-core
exit
```

### 4. Installerer AD og setter administrator-passord på det som blir domene-administrator:

Generere passord: 
```
-join `
('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPRSTUVWXYZ0123456789!"#$%&()*+,-./:;<=>?@[\]^_`{|}~'.ToCharArray() | 
 Get-Random -Count 20)

```

```powershell
# run as administrator
Install-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools
#^Installerer programvaren for AD.
$Password = Read-Host -Prompt 'Enter Password' -AsSecureString
#^Leser inn passordet du har generert i variabelen Passord
Set-LocalUser -Password $Password Administrator
#^Endrer passordet til den lokale administratoren som ender opp med å bli domene-administrator
$Params = @{
    DomainMode                    = 'WinThreshold'
    DomainName                    = 'Bergsprekken.Trening'
    DomainNetbiosName             = 'Bergsprekken'
    ForestMode                    = 'WinThreshold'
    InstallDns                    = $true
    NoRebootOnCompletion          = $true
    SafeModeAdministratorPassword = $Password
    Force                         = $true
}
Install-ADDSForest @Params
Restart-Computer
# Log in as SEC\Administrator with password from above, test our domain
Get-ADRootDSE
Get-ADForest
Get-ADDomain
# Any computers joined the domain?
Get-ADComputer -Filter *
```

### 5. Legge til VM'ene i domenet.
```
# run as administrator
Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses 192.168.111.183
$cred = Get-Credential -UserName 'Bergsprekken\Administrator' -Message 'Cred'
Add-Computer -Credential $cred -DomainName Bergsprekken.Trening -PassThru -Verbose
Restart-Computer
```








Timeregistrering: 
15. mars: 7t
16. mars: 16:00 - 