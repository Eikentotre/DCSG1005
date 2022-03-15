# This file will contain notes to self

Idémyldring: 


## Bergsprekken - Treningsutstyr

Økonomi og regnskap, administrasjon(ledelsen og personal), IT-avdeling,
 selgere, 

 OU:   
 Servere, Computers,

 Domenet: Bergsprekken
 Brukere, grupper, maskinvare 


1. Lag stacken

2. Legg IP og passord til VM'ene i myvms.ps1(/bash)

3. Oppgrader (som administrator) til powershell core

´´´
# search powershell, right click, Run as administrator

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y powershell-core
exit
´´´

4. Installerer AD og setter administrator-passord på det som blir domene-administrator:
```powershell
# run as administrator
Install-WindowsFeature AD-Domain-Services, DNS -IncludeManagementTools
$Password = Read-Host -Prompt 'Enter Password' -AsSecureString
Set-LocalUser -Password $Password Administrator
$Params = @{
    DomainMode                    = 'WinThreshold'
    DomainName                    = 'sec.core'
    DomainNetbiosName             = 'SEC'
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