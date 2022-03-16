#!/bin/bash

# This script assumes you have netcat and xfreerdp installed
# usage: myvms.bash [mgr|cl1|dc1|srv1|mgra|cl1a|dc1a|srv1a]

# floating ip's and the Admin-user-password for each host (retrieve from SkyHiGh):
mgr_ip=
mgr_pw=
cl1_ip=
cl1_pw=
dc1_ip=
dc1_pw=
srv1_ip=
srv1_pw=
# domain administrator password (you set this yourself when creating the domain):
dc1a_pw=

logintype="$1"

logmein () {
    if nc -z -w2 "$ip" 3389      # test if host reachable
    then
        echo "Login $logintype"
        xfreerdp /u:"$user" /audio-mode:1 +fonts +clipboard /dynamic-resolution /w:2048 /h:1152 /v:"$ip" /p:"$pw"
    else
        echo "Not able to reach port 3389 on host $ip"
    fi
}

case "$logintype" in
    "mgr")
        ip=$mgr_ip
        pw="$mgr_pw"
        user=Admin
        logmein
        exit 0;;
    "cl1")
        ip=$cl1_ip
        pw="$cl1_pw"
        user=Admin
        logmein
        exit 0;;
    "dc1")
        ip=$dc1_ip
        pw="$dc1_pw"
        user=Admin
        logmein
        exit 0;;
    "srv1")
        ip=$srv1_ip
        pw="$srv1_pw"
        user=Admin
        logmein
        exit 0;;
    "mgra")
        ip=$mgr_ip
        pw="$dc1a_pw"
        user='SEC\Administrator'
        logmein
        exit 0;;
    "cl1a")
        ip=$cl1_ip
        pw="$dc1a_pw"
        user='SEC\Administrator'
        logmein
        exit 0;;
    "dc1a")
        ip=$dc1_ip
        pw="$dc1a_pw"
        user='SEC\Administrator'
        logmein
        exit 0;;
    "srv1a")
        ip=$srv1_ip
        pw="$dc1a_pw"
        user='SEC\Administrator'
        logmein
        exit 0;;
    *)
        echo "Please tell me which login you would like."
        exit 1;;
esac
