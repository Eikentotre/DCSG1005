# Usage: myvms.ps1 [mgr|cl1|dc1|srv1|mgra|cl1a|dc1a|srv1a]

# floating ip's and the Admin-user-password for each host (retrieve from SkyHiGh):
$mgr_ip ="10.212.139.36"
$mgr_pw ="1fmeAVAOJbX44ZyeZjLr"
$cl1_ip ="10.212.140.252"
$cl1_pw ="rZxvR0pzYFG9SmcHx8x2"
$dc1_ip ="10.212.138.108"
$dc1_pw ="L7iWo33M2lDTWrJQFfnr"
$srv1_ip="10.212.141.204"
$srv1_pw="OgV2gOu6CBzVzleWZDTZ"
# domain administrator password (you set this yourself when creating the domain):
$dc1a_pw=

$logintype=$args[0]

function Connect-MyHost {
    param (
        $User,$IP,$Pw
    )
    if (Test-NetConnection -ComputerName "$ip" -Port 3389 -InformationLevel Quiet -WarningAction SilentlyContinue) {
        Write-Output "Logging in $user on $ip"
        cmdkey `/generic:"$ip" `/user:"$user" `/pass:"$pw"
        mstsc `/v:"$ip"
        Start-Sleep 10
        cmdkey `/delete:"$ip"
    } else {
        Write-Output "Not able to reach port 3389 on host $ip"
    }
}

switch ($logintype) {
"mgr" {
    $ip="$mgr_ip"
    $pw="$mgr_pw"
    $user="Admin"
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"cl1" {
    $ip="$cl1_ip"
    $pw="$cl1_pw"
    $user="Admin"
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"dc1" {
    $ip="$dc1_ip"
    $pw="$dc1_pw"
    $user="Admin"
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"srv1" {
    $ip="$srv1_ip"
    $pw="$srv1_pw"
    $user="Admin"
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"mgra" {
    $ip=$mgr_ip
    $pw="$dc1a_pw"
    $user='SEC\Administrator'
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"cl1a" {
    $ip=$cl1_ip
    $pw="$dc1a_pw"
    $user='SEC\Administrator'
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"dc1a" {
    $ip=$dc1_ip
    $pw="$dc1a_pw"
    $user='SEC\Administrator'
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
"srv1a" {
    $ip=$srv1_ip
    $pw="$dc1a_pw"
    $user='SEC\Administrator'
    Connect-MyHost -User $user -IP $ip -Pw $pw
    }
default {
    Write-Output "Please tell me which login you would like."
    }
}