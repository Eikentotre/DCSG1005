# Active Directory: Design and Implementation (compendia chapter 6)

Todo: 
1. Set up the DC SEC.CORE as show in the [video from the previous week.](https://www.youtube.com/watch?v=pJF4xPFtqBk&ab_channel=YTGossin)

2. Opprett denne strukturen ved å kjøre medfølgende kommandoer:
![ Tatt fra kompendiet](SEC.CORE_Organizational_Chart.png)
 Kommandoene kjøres i sekvens. 
 
> # User OUs
> New-ADOrganizationalUnit 'AllUsers' -Description 'Containing OUs and users'
 New-ADOrganizationalUnit 'IT' -Description 'IT staff' `
   -Path 'OU=AllUsers,DC=sec,DC=core'
 New-ADOrganizationalUnit 'Cons' -Description 'Consultants' `
   -Path 'OU=AllUsers,DC=sec,DC=core'
 New-ADOrganizationalUnit 'Adm' -Description 'Administration' `
  -Path 'OU=AllUsers,DC=sec,DC=core'
New-ADOrganizationalUnit 'Blue' -Description 'Blue Team' `
  -Path 'OU=Cons,OU=AllUsers,DC=sec,DC=core'
New-ADOrganizationalUnit 'Red' -Description 'Red Team' `
  -Path 'OU=Cons,OU=AllUsers,DC=sec,DC=core'
New-ADOrganizationalUnit 'DFIR' -Description 'Dig For and Inc Resp' `
  -Path 'OU=Cons,OU=AllUsers,DC=sec,DC=core'
# Computer OUs
New-ADOrganizationalUnit 'Clients' -Description 'Containing OUs and users laptops'
New-ADOrganizationalUnit 'Servers' -Description 'Containing OUs and servers'
New-ADOrganizationalUnit 'Adm' -Description 'Adm laptops' `
  -Path 'OU=Clients,DC=sec,DC=core'
New-ADOrganizationalUnit 'Cons' -Description 'Consultants laptops' `
  -Path 'OU=Clients,DC=sec,DC=core'  

Så skal disse flyttes til OU'ene fra containeren de er i, ved å skrive 'get-adc

Prio list: 
1. Sett opp brukere, Organizational chart osv
2. Sett opp GPO, og gjør aaaalt du vil av endringer.















 Heading	
# H1

## H2

### H3

Bold	
**bold text**

Italic	
*italicized text*

Blockquote	
> blockquote

Ordered List	
1. First item
2. Second item
3. Third item

Unordered List	
- First item
- Second item
- Third item

Code	                
`code`
Horizontal Rule	
---

Link	                
[title](https://www.example.com)

Image	                
![alt text](image.jpg)
