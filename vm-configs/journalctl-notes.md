# These are my notes of the commands
# as well as the logs from each command 
# when I looked at the journalctl command

-----------------------------------journalctl log review----------------------
# View all logs since last boot
journalctl -b
- When I ran this command I saw all enteries from the system when it comes to commands ran as well as what happened behind the screen in the sense of what happend in the system when running each command
# example output:
# ‹pre>Jun 21 13:44:59 LinuxVM-LAB systend[1305]: Queued start job for default target Main User Target.
Jun 21 13:44:59 LinuxVM-LAB systend[1305]: Created slice User
Application Slice.
Jun 21 13:44:59 LinuxVM-LAB systemd[1305]: Created slice User Core
Session Slice.
Jun 21 13:44:59 LinuxVM-LAB systend[1305]: Started Pending report trigger for Ubuntu Report.
Jun 21 13:44:59 LinuxVM-LAB systemd[1305]: Reached target Paths.
Jun 21 13:44:59 LinuxVM-LAB systemd[1305]: Reached target Timers.
</pre>

# View logs for a specific service
journalctl -u ssh
- There where no entries for the reason that there were no means of using ssh to any ports or user shells
# The output said '--No enteries--' for the reason there were no ssh sessions that were live or requests that took place

# View logs in a time window
journalctl --since "1 hour ago"
- This command showed me when user sessions where started as well as on which user and then which background processes/jobs were running 
# example output:
root@LinuxVM-LAB:-# journalctl --since "1 hour ago"
 Jun 21 14:37:01 LinuxMM-LAB CRON[2704]: pam_unixcron:sesston): session opened for user svcaccount (uid=1001) by (uid=0)
 Jun 21 14:37:01 LinuxVM-LAB CRON[2705]: (svcaccount) CMD (echo "cron check $(date)" >>/tmp/crontest. log)
 Jun 21 14:37:01 LinuxV-LAB CRON[2704]: pam_unix(cron:session): session closed for user svcaccount
 Jun 41 14:35:01 -nUXVM-LAB CRONL2/08 pam unix (cronisession): session opened tor user svcaccount(ud=1001 by uld=0)

# Filter by priority — errors only
journalctl -p err -b
- This command showed system-level errors unrelated to anything 
  I executed — VirtualBox graphics driver incompatibility warnings 
  and a GNOME session library assertion failure. Useful finding: 
  not every "error" in a log is actionable; distinguishing 
  environmental noise from a real incident is itself a skill.
# example output:
root@LinuxVM-LAB: -# journalctl -p err -b
Jun 21 13:34:23 LinuxVM-LAB kernel vmwgfx 0000:00:02.0: [drm] ERROR vmwgfx seems to be running on an unsupported hyp>
Jun 21 13:34:23 LinuxV-LAB kernel| vmwgfx 0000:00:02.0: [drm] ERROR
This configuration is Likely broken.
Jun 21 13:34:23 LinuxVM-LAB kernel: vmwgf× 0000:00:02.0: [drm] ERROR
Please switch to a supported graphics device to >
Jun 21 13:34:51 LinuxVM-LAB gnome-session-binary[810]: GLib-GIO-
CRITICAL: g_bus_get_sync: assertion 'error == NULL || *>
Jun 21 13:34:51 LinuxVM-LAB gnome-session-binary[810]: GLib-GIO-
CRITICAL: 9_bus_get_sync: assertion error == NULL || *>


