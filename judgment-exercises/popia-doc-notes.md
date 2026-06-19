## Gap Assessment Findings — Pretorium Trust (June 2026)

### Finding 1 — Workstation Inactivity CLOSED

Policy: Password-protected screensaver on inactivity

Gap found: Not enforced by default

Control implemented: Bash script deployed via task scheduler,
15-minute inactivity threshold, automatic logoff

POPIA mapping: Section 19(1) — organisational measure

### Finding 2 — Database Privilege Control PARTIAL
Policy: Only DBA runs bulk queries

Current state: Two admins (supervisor + self)

Risk: Two admin accounts doubles the attack surface.
Compromise of either account = full DB access

Audit trail: Admin-level queries logged 

Recommended improvement: Privileged access review quarterly

### Finding 3 — Physical Document Control PARTIAL
Policy: Documents secured when offices unoccupied

Gap found: No clean desk policy during working hours

Risk: Sensitive documents visible to non-authorised visitors
during business hours

Recommended control: Clean desk policy implementation

### Finding 4 — Audit Trail Coverage CLOSED
Admin and user activity both covered by immutable logs 
Who changed, queried, and viewed data is tracked 

### Finding 5 — Data Availability Control IMPLEMENTED
Control: Automated backup of employee Documents/Desktop to 
on-prem backup drive via robocopy, scheduled via Task Scheduler

POPIA mapping: Section 19(1) — protection against loss of 
personal information
