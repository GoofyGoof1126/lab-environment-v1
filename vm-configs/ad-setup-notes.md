## Active Directory Setup — DC01-LAB

### Domain Details
- Domain name: pretorium.lab
- NetBIOS name: PRETORIUM
- Forest/Domain functional level: Windows Server 2016
- DNS: Integrated with AD DS on DC01-LAB
- FSMO roles: All held by DC01-LAB.pretorium.lab 
  (single-DC forest — RID Master, PDC Emulator, Schema Master)

### Why this domain name?
Named to mirror the Pretorium Trust environment for 
narrative consistency across portfolio projects.

### What AD DS enables downstream
- Month 3: Wazuh agent on DC01-LAB sending Windows 
  Security Event Logs
- Month 4: Kerberoasting attack against service accounts 
  in pretorium.lab domain
- Month 4: Event ID 4769 detection on this exact DC

### Installation method
PowerShell — Install-WindowsFeature then Install-ADDSForest. 
GUI installation deliberately avoided to build PowerShell 
muscle memory.

### Verification
Get-ADDomain and Get-ADForest both returned successfully 
post-restart with no errors. DNS zones (ForestDnsZones, 
DomainDnsZones) confirmed present under Application Partitions.
