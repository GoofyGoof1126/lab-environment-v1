## Log Analysis — grep/awk/sed/grep-P on auth.log

### Command Used
sudo grep -a "sshd\[.*Failed password" /var/log/auth.log | \
grep -oP "Failed password for (invalid user )?\K[^ ]+" | \
sort | uniq -c

### Findings
- baduser: 3 failed attempts
- root: 2 failed attempts
- Most targeted username: baduser

### What I learned
sshd logs two different line formats depending on whether the 
targeted username exists on the system or not — lines for 
invalid usernames include the extra phrase "invalid user" before 
the name, which breaks any fixed-position field extraction with 
awk. Had to switch to a pattern-based extraction (grep -oP with 
\K) that handles both formats correctly regardless of field count.

Also learned that grep's binary-detection heuristic can misfire 
on legitimate text logs (file reported this log as "data" instead 
of "ASCII text"), producing a false "binary file matches" warning. 
The -a flag forces grep to treat the file as text regardless.

### Why this matters
Real log analysis rarely has a single consistent line format. 
A SIEM correlation rule has to handle this same inconsistency — 
this is exactly the kind of edge case that breaks naive detection 
logic in production.
