# Lab Environment v1 — Month 1: Foundation Repair

## Purpose
Built as the foundation phase of an 11-month cybersecurity 
career roadmap targeting Junior Cloud Security Engineer roles 
in Gauteng. This phase closes two zero-evidence gaps that were 
blocking my CV: Linux administration and Active Directory.

## Environment Overview



### DC01-LAB — Windows Server 2019
Domain controller for `pretorium.lab`. Hosts a structured OU 
layout (Staff, IT, Service Accounts) with real user accounts 
and an enforced GPO covering a 12-character password policy 
and a legal logon banner. Static IP 192.168.56.10.

### LinuxVM-LAB — Ubuntu Server
Used for Linux administration fundamentals: user/group 
management, file permissions, cron scheduling, and rsyslog 
configuration. Performed real log parsing against `auth.log`, 
including debugging two genuine technical issues along the 
way — a `grep` binary-detection false positive, and a 
dual-format `sshd` log parsing problem that broke a naive 
`awk` field extraction. Static IP 192.168.56.13.

Both VMs sit on the same host-only network (192.168.56.0/24), 
deliberately isolated from any production network.

## Real-World Application — Beyond the Lab

Alongside the technical lab work, I was assigned genuine POPIA 
compliance work at my employer, Pretorium Trust:

- Reviewed three internal compliance documents (IT compliance 
  policy, POPI compliance and security policy, POPI handling 
  procedure) and consolidated them into a single staff training 
  resource
- Designed and delivered that training to all staff across all 
  departments
- Conducted a gap assessment against the documentation, 
  identifying a missing clean-desk policy and a privileged 
  access review gap on the main database
- Implemented two production technical controls myself: a 
  workstation inactivity lockout script and an automated 
  on-prem backup script, both scheduled via Task Scheduler and 
  mapped directly to POPIA Section 19(1)

Full findings are documented in `judgment-exercises/popia-doc-notes.md`.

## What This Foundation Enables

- **Month 2:** Wazuh SIEM deployment — both VMs become monitored 
  endpoints, building directly on the rsyslog and log analysis 
  work done this month
- **Month 4:** Kerberoasting attack against `svc-sqlbackup`, 
  detected via Event ID 4769 — the OU structure and service 
  account built this month make that attack realistic rather 
  than a contrived target

## What Would Have Happened Without This
The Wazuh SIEM project (Month 2) has no endpoints to monitor. 
The Kerberoasting detection (Month 4) has no domain to attack. 
This is the foundation everything else builds on.

## Architecture Screenshots
- [VirtualBox VM Specs](architecture/dc01-virtualbox-specs.png)
- [Hostname and IP Config](architecture/dc01-hostname-ipconfig.png)
- [Server Manager](architecture/dc01-server-manager.png)

## Repository Structure
- `architecture/` — diagrams and configuration screenshots
- `vm-configs/` — technical notes, scripts, setup documentation
- `judgment-exercises/` — POPIA gap analysis and reasoning exercises

## Commit History
Deliberately iterative — each week adds documented evidence, 
not one large final push.
