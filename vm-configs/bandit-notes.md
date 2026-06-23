## Bandit Levels 0-15 — Notes and Real-World Mapping

------- Level 0 -------

Open the Kali terminal and type ssh to connect to the shell: 
`ssh bandit0@bandit.labs.overthewire.org -p 2220`
It will ask for the password, which is `bandit0`. Hit enter, 
then you're in.

-------- Level 0 -> 1 ---------

First enter `ls` to see which files or directories are in the 
current location. You'll see a readme file — that's what you're 
looking for. Run `cat readme` to view the contents, which 
contains a short message and the password for the next level.

**Real-world mapping:** Basic file system navigation — the 
first thing any attacker or analyst does after gaining shell 
access is orient themselves with `ls`.

---------- Level 1 -> 2 ---------

Enter the SSH address again, changing the 0 to a 1. Run `ls` — 
you'll see a file named `-`. Enter `cat ./-` (the `./` tells the 
shell to look in the current directory for a file literally 
named `-`, rather than interpreting it as a flag). Inside the 
file is the next password.

**Real-world mapping:** Filenames designed to break naive 
parsing of commands — attackers sometimes name files this way 
specifically to trip up automated scripts or careless analysts.

------------ Level 2 -> 3 --------------

Change the 1 to a 2. Run `ls` and you'll see a file named 
`--spaces in this filename--`. A normal `cat` command fails 
because the leading double-dash gets interpreted as a flag, 
not a filename. Use `cat "./ --spaces in this filename--"` — 
the `./` tells `cat` you're pointing at a file in the current 
directory, not passing it an option.

**Real-world mapping:** Same concept as Level 1, escalated — 
shell argument parsing is a constant source of both bugs and 
deliberate evasion in scripting.

--------- Level 3 -> 4 ----------

Change the 2 to a 3, enter the password from the previous level. 
Look for a file in the `inhere` directory. Running `ls` shows 
the directory exists; `cd inhere` moves into it. A plain `ls` 
inside shows nothing because the file is hidden — `ls -a` 
reveals it. The hidden file starts with `...Hidden-From-You`, 
so open it with `cat ./...Hidden-From-You`.

**Real-world mapping:** Hidden files (dotfiles) are a common 
place attackers stash persistence mechanisms or stolen data — 
`ls -a` is a reflex check during any filesystem investigation.

-------- Level 4 -> 5 --------

Change the 3 to a 4. Look in `inhere` again. Running `cat` 
against each file individually, `-file07` returned a permission 
denied error. Using the full path fixed it: `cat ~/inhere/-file07`.

**Real-world mapping:** Permission errors are informative, not 
just blockers — they tell you the file exists and is owned by 
someone else, which is itself useful intelligence during 
privilege escalation attempts.

-------- Level 5 -> 6 --------

Change the 4 to a 5. Used `find .` to search the current 
directory, with three flags: `-type f` (regular files only, 
excludes folders and symlinks), `-size 1033c` (exact size in 
bytes), and `! -executable` (excludes anything with execute 
permission, since the level specified a non-executable file). 
Full command: `find . -type f -size 1033c ! -executable`. 
Result: `./maybehere07/.file2`. Opened with 
`cat ~/inhere/maybehere07/.file2`.

**Real-world mapping:** Searching by size and permission 
attributes rather than filename is exactly how you'd hunt for 
suspicious files during an incident — malware often hides under 
innocuous names but stands out by size or permission pattern.

-------- Level 6 -> 7 --------

Change the 5 to a 6. The target file is owned by user `bandit7`, 
group `bandit6`, 33 bytes. `ls` in the current directory returned 
nothing, so the search had to span the entire filesystem with 
`find /`. Flags used: `-size 33c`, `-user bandit7`, 
`-group bandit6`. Running the search without filtering errors 
returned every file on the system including ones I didn't have 
permission to read, which buried the result in noise. Adding 
`2>/dev/null` suppressed the permission-denied errors. Full 
command: `find / -size 33c -user bandit7 -group bandit6 2>/dev/null`. 
Result: `/var/lib/dpkg/info/bandit7.password`, opened with `cat`.

**Real-world mapping:** Filesystem-wide search filtered by 
ownership is a core technique for finding misconfigured files 
during a penetration test — `2>/dev/null` is a habit every 
analyst builds quickly to cut signal from noise.

-------- Level 7 -> 8 --------

Change the 6 to a 7. The password sits next to the word 
"millionth" in `data.txt`. Used `grep "millionth" data.txt` to 
pull the matching line directly.

**Real-world mapping:** `grep` is the single most-used tool in 
log analysis — searching gigabytes of log data for one keyword 
is exactly this pattern at scale.

-------- Level 8 -> 9 --------------

Change the 7 to a 8. The password is the one line in `data.txt` 
that appears exactly once. Used `sort data.txt | uniq -u` — 
`sort` groups duplicate lines together, `uniq -u` then shows 
only lines with no duplicates.

**Real-world mapping:** Same logic used to spot anomalies in 
log files — one unique event among thousands of repeated, 
routine ones is often the line worth investigating.

-------- Level 9 -> 10 --------------

Change the 8 to a 9. The password is one of the few human-readable 
strings in `data.txt`, preceded by several `=` characters. Used 
`strings data.txt | grep "="` — `strings` extracts printable text 
from a binary file, piped into `grep` to filter for the `=` marker.

**Real-world mapping:** `strings` is a first-pass tool in malware 
analysis for pulling readable text — URLs, error messages, 
hardcoded credentials — out of an otherwise unreadable binary.

--------- Level 10 -> 11 --------------

Change the 9 to a 10. `data.txt` contains base64-encoded data. 
Used `base64 -d data.txt` (`-d` for decode; encoding uses the 
same command without the flag).

**Real-world mapping:** Base64 is a common obfuscation layer in 
malicious scripts and phishing payloads — recognizing and 
decoding it is a routine step in any analysis.

--------- Level 11 -> 12 --------

Change the 10 to an 11. The letters in `data.txt` have each been 
rotated 13 positions — a Caesar cipher, specifically ROT13. Used 
`tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt` — `tr` substitutes one 
character set for another; mapping A-Z/a-z onto N-Z,A-M/n-z,a-m 
reverses a 13-position shift (13 being exactly half of the 
26-letter alphabet, which is what makes ROT13 self-reversing — 
running it twice returns the original text).

**Real-world mapping:** Simple substitution ciphers like this 
still show up in obfuscated malware strings and CTF-style 
challenges; recognizing the pattern by eye is a skill worth 
building.

-------- Level 12 -> 13 ------------

Change the 11 to a 12. `data.txt` is a hexdump of a file that's 
been compressed multiple times. Created a scratch directory with 
`cd $(mktemp -d)`, copied the file in with `cp ~/data.txt .`, then 
reversed the hexdump with `xxd -r data.txt myfile`.

From there it was a repeated cycle: run `file myfile` to identify 
the compression type, rename to match the correct extension with 
`mv`, then decompress.

- First pass: `file` reported gzip → renamed to `myfile.gz`, 
  ran `gzip -d myfile.gz`
- Second pass: `file` reported bzip2 → ran `bzip2 -d myfile`, 
  then renamed the output back to `myfile`
- Third pass: `file` reported gzip again → same gzip rename/decompress 
  cycle
- Fourth pass: `file` reported a POSIX tar archive → ran `tar -xf myfile`, 
  which extracted `data5.bin`; renamed it back to `myfile`
- This tar/bzip2/gzip cycle repeated a few more times — each time, 
  `file` told me what to do next
- Final pass: `file` reported ASCII text — fully decompressed. 
  Ran `cat myfile` to read the password.

**Real-world mapping:** Identifying file type by signature rather 
than trusting the extension is exactly how malware analysts catch 
files disguised to evade extension-based filters — the technique 
is identical, only the stakes differ.

------- Level 13 -> 14 ----------

Change the 12 to a 13. This level doesn't hand you a password — 
it hands you a private SSH key (`sshkey.private`) and expects you 
to use it to authenticate as bandit14.

Exited the current shell, then on the local host created a working 
directory: `mkdir overthewire && cd overthewire`. Used `scp` (secure 
copy) to pull the key down: 
`scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private .` 
— note the capital `-P` for the port flag in `scp`, which differs 
from the lowercase `-p` used in `ssh`. The trailing `.` tells `scp` 
to save the file in the current directory.

Once downloaded, the key's permissions needed tightening before 
SSH would accept it: `sudo chmod 700 sshkey.private`. Then 
authenticated with the key directly instead of a password: 
`ssh -p 2220 -i sshkey.private bandit14@bandit.labs.overthewire.org`. 
Once logged in, navigated to `/etc/bandit_pass` and ran 
`cat bandit14` to read the password.

**Real-world mapping:** This is the exact authentication method 
used for AWS EC2 instance access — every cloud engineer does this 
routinely. It's also a primary lateral movement technique in real 
breaches: a stolen private key is often more valuable to an 
attacker than a stolen password, since it usually isn't rotated 
or monitored as closely.

------ Level 14 -> 15 --------

Change the 13 to a 14, enter the password from the previous level. 
This password is retrieved by submitting the current level's 
password to port 30000 on localhost. Used `nc localhost 30000` 
(netcat) to open a raw connection to that port, then pasted in 
the current password to receive the next one.

**Real-world mapping:** Netcat is a staple tool for manually 
testing whether a service is actually listening on a given port 
and how it responds — the same technique used to verify firewall 
rules are enforcing what they claim to.
