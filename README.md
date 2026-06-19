# Lab Environment v1

## What is this?
A documented home lab built as part of an 11-month cybersecurity 
career roadmap targeting Junior Cloud Security Engineer roles 
in Gauteng by April 2027.

## Architecture Screenshots
- [VirtualBox VM Specs](architecture/dc01-virtualbox-specs.png)
- [Hostname and IP Config](architecture/dc01-hostname-ipconfig.png)
- [Server Manager](architecture/dc01-server-manager.png)

## Environment
- Ubuntu Server 22.04 VM — Linux administration, log analysis, 
  rsyslog configuration, Wazuh SIEM agent (Month 2)
- Windows Server 2019 VM (DC01-LAB) — Active Directory Domain 
  Services, GPO configuration, Kerberoasting detection (Month 4)

## Architecture Screenshots
- [VirtualBox VM Specs](architecture/dc01-virtualbox-specs.png)
- [Hostname and IP Config](architecture/dc01-hostname-ipconfig.png)
- [Server Manager](architecture/dc01-server-manager.png)

## What gap does this close?
Zero documented evidence of Linux or AD administration prior 
to this lab. Every downstream project in this roadmap depends 
on this foundation.

## What would have happened without this?
The Wazuh SIEM project (Month 2) has no endpoints to monitor. 
The Kerberoasting detection (Month 4) has no domain to attack. 
This is the foundation everything else builds on.

## Commit history
Deliberately iterative — each week adds documented evidence, 
not one large final push.
