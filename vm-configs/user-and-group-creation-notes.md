#These are my notes I took along with the commands 
#of my creation and user assignment as well as group assignment 
#when creating a service account for my lab

# -----------------User and group management ---------------------------
# Setup the Linux machine VM
 Create a service account - this is the same as the Wazuh will create its own(the '-m' is there to Tell the system
to automatically build a personal home folder for the user )
sudo useradd -m -s /bin/bash svcaccount 

# Then set the password for the new user
sudo password svcaccount

# Create a security group
sudo groupadd secops

# Add the user to the new group
sudo usermod -aG secops svcaccount

# To verify - this command is used constantly in forensics
id svcaccount - to check userID and groupIDs

cat /etc/passwd | grep svcaccount 
- searches for the config details of the user inside password file and the grep narrows down the search,
the file is the user registry file

cat /etc/group | grep secops
- searches for the config details of the user inside group registry file and the grep narrows down the search

# --------------------File permissions - chmod/chown-----------------
# Create a sensitive file
sudo mkdir /opt/sensitive - creates the drive
sudo touch /opt/sensitive/data.txt - if not yet exists, then touch used to create file at path location

# Set ownership to svcaccount
sudo chown svcaccount:secops /opt/sensitive/data.txt  
- user:group followed by file path. secops is assigned as group owner of the file

# Set permissions - owner read/write, group read, others nothing
sudo chmod 640 /opt/sensitive/data.txt


# Verify - this is to see permissions of sed file/folder
ls -la /opt/sensitive/data.txt
