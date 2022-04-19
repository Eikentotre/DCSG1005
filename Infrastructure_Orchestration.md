# Infrastructure Orchestration

## Tasks

### Yaml syntax
heat_template_version: kommer ny hvert halvår

Description:
">" betyr at linjeskift erstattes med space.

Viktigst: 
- Parametere
- Ressurser.
Se hva i scriptene hans som er ressurser og parametre
Dette skjer ikke i sekvens nedover. Heat forstår rekkefølgen på det og orkestrerer det.
Vi skal kun beskrive tilstanden vi ønsker å ha det i. --> declarative scripts
[Heat-template for oppgaver](https://github.com/openstack/heat-templates/blob/master/hot/servers_in_new_neutron_net.yaml)

[Template guide openstack](https://docs.openstack.org/heat/latest/template_guide/openstack.html)
Load Balancer as a Service (LBaaS) eks.

Application credentials --> Openstack skyhigh credentials?

I linux bruker vi \ for å fortsette kommandoene på neste linje

Når vi endrer på en template: 
- Create failed? Nederst i øvingen står det openstack stac event list heat_demo --nested-depth 3 (veriden er hvor mye informasjon vi vil ha)

[iac_top.yaml](https://github.com/githubgossin/IaC-heat/blob/master/iac_top.yaml)

iac_base: må fullføre før iac_rest kan kjøre
dette kan gjøres ved at du i iac_rest skriver depends_on: iac_base
Kan passe på at den venter på at alt er satt opp før du kan kjøre noen 

For å få flere: OS::Heat::ResourceGroup
og count: 2

### Nested stack:
Det er flere yaml filer som referer til hverandre.

### Boot script:
Ikke bruk en ekstern fil
Last ned templaten vi startet kurset med, og se linje 74-86. 
Der står det hvordan du kan gi en maskin kommandoer den skal kjøre på boot

cl_dc_srv_basic_yaml:
under user_data: | 
lim inn alt vi vil installere ved oppstart

Til eksamen: 30% flervalgsoppgaver
10-20% drag'n'drop f. eks.
resten kommer til å være ting som powershell cmdlets.

Frem mot eksamen: Sett dere sammen i grupper og gå over nøkkelord fra weekly-schedule

