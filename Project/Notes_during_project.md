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
'''
# search powershell, right click, Run as administrator

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y powershell-core
exit
'''