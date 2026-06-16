------level 0 -------
1) open the klai terminal and type ssh and connect to the shell 'ssh bandit0@bandit.labs.overthewire.org -p 2220'
2) It will ask you for the password which will be 'bandit0' and hit enter
3) After you entered the password you can go to lvl 0 -> 1
4) XXXXXXXXXXXXXXXXXXXXXXXXX

-------- Level 0 -> 1 ---------
1) firstly enter the 'ls' command to see which files or dr are located where you are
2) you will see the readme file is there that you are looking for
3) I then enter the 'cat readme' command to view the contents of the file
4) there it will have a short message as well as the password for the next level

---------- Level 1 -> 2 ---------
1) again enter the ssh address but change the 0 to a 1 
2) enter the 'ls' command to see which files or dr are located where you are
3) You will then see the file is there you are looking for
4) Enter the 'cat ~/ -' command, and a note is the ~ symbole is used to symbolize the home dir.
5) inside the file you will find your next psw: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

------------Level 2 -> 3--------------
1) again enter the ssh address but change the 1 to a 2
2) when you have entered your password then enter the 'ls' command
3) you will then see the name (--spaces in this filename--)
4) you will not be able to cat command this file as normal because cat will think you are trying to pass a command because of the double dashes.
5) Now instead you will need to use ' ./ ' like so 'cat "./ --spaces in this filename--" so this will tell cat that you are actually looking for a file in the current dir and not doing something else.
6)  XXXXXXXXXXXXXXXXXXXXXX

---------Level 3 -> 4 ----------
1) again enter the ssh address but change the 2 to a 3 
2) Then copy the psw which you found in the prev level and paste it in
3) now you must look for a file in the inhere dir
4) i will use the 'ls' command to see where in which docs are in the current dir
5) You will see the dir is there, i then used the 'cd inhere' command to change the dir to the inhere dir.
6) When you 'ls' in the inhere dir you will see no file, because it is a hidden file. To then view the hidden file use the 'ls-a' command. This will then show the name of the hidden file to open/view it.
7) The hidden file's name starts with '...Hidden-From-You'. So in order to open the file you need to type 'cat ./...Hidden-From-You'.
8) The psw in the file XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 4 -> 5 --------
1) again enter the ssh address but change the 3 to a 4
2) Then copy the psw which you found in the prev level and paste it in
3) now you must look for a file in the inhere dir (but use the reset command if there is an issue)
4) use the 'ls' command to see which docs are in the current dir
5) I tried the cat command with each file but at -file07 it said it did not have premission
6) so I then tried to use along with the filepath 'cat ~/inhere/-file07' which then open the file to reviel the psw
7) the psw fo the next level: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 5 -> 6 --------
1) again enter the ssh address but change the 4 to a 5
2) Then copy the psw which you found in the prev level and paste it in
3) I had use the find command but also i had to use the 'find .' to search for files in the current dir. Also added the flag '-type f' this is to look for only regular files, thus ignoring any folders or symlinks. Another flag is the '-size 1033c', this flag tells the command to also look for files that are a certian size in this case use 'c' to tell it look for bytes in size. Also add the '! -executable' flag which tells the command to look for files that have execute permissions, which will only then show non-executable files as the level instructions spesified.  
4) the result of the command 'find . -type f -size 1033c ! -excecutable' was '.maybehere07/.file2'
5) I then ran the 'cat ~/inhere/maybehere07/.file2' to open the file that was resulted by the find command
6) the psw found in the file was: XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 6 -> 7 --------
1) again enter the ssh address but change the 5 to a 6
2) Then copy the psw which you found in the prev level and paste it in 
3) You must find a file that is stored in the dir 'somewhere on the server'. The file you are looking for is owned by user bandit7 that belongs to the group bandit6 and it is 33 bytes in size.
4) So when running the 'ls' command I found no results. 
5) This means I then had to use the 'find' command however since the 'ls' command did not return anything I would have the search the entire system so I would have to use 'find /' for the command search. 
6) The flags for the attributes of the file I am looking for '-size 33c' which is the size of the file which is 33 bytes which is symbolizes by the 'c' letter. 
7) The flag for looking for the user attribute is '-user bandit7' which tells the command to look for a file that has been permissioned by the bandit7 user. 
8) The flag for the group is '-group bandit6' which tells the command to look for a file that has been permissioned by the bandit6 group along with the user attribute. 
9) Now when I only ran the command 'find / -size 33c -user bandit7 -group6'. It then returned all of the files on the entire system that I have permissions to as well as the files that I do not have permissions to. 
10) Now use an extra filter to find the file with all the attributes but to filter to show only the files that you would have permissions to access, I added the '2>/dev/null' flag.  
11) so the full command to find the file 'find / -size 33c -user bandit7 -group bandit6 2>/dev/null'. The results of the command is '/var/lib/dpkg/info/bandit7.password'
12) Now after finding the filepath I used 'cat /var/lib/dpkg/info/bandit7/.password' command to then open/view the file.
13) The psw I found: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

-------Level 7 -> 8 --------
1) again enter the ssh address but change the 6 to a 7
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level will be the in the data.txt file next to the word millionth
4) So to find the word millionth in the text file I used the 'grep' command. So to find the word 'millionth' in the data.txt file I used the full command 'grep "millionth" data.txt'
5) Then the password i found in the data.txt file is: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 8 -> 9 --------------
1) again enter the ssh address but change the 7 to a 8
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level is stored in the file data.txt and is the only line of text that occurs only once
4) So to find the line that only occurs once in the data.txt file I used the 'sort' command followed by the file/folder/dir name you are looking inside of. Then the 'uniq' command and then follow it with '-u' to find the only line that does not have any duplicates. So the final command to find the psw for the next level is 'sort data.txt | uniq -u'.
5) Then the result of the command which being the psw: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 9 -> 10 --------------
1) again enter the ssh address but change the 8 to a 9
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level is stored in the file data.txt in one of the few human readable strings, preceded by several '=' charcters.
4) So to find the human readable string I used the 'strings' command also followed by the file name which is data.txt. With this I piped it with the 'grep' command and as mentioned in the question the psw is followed by '='.
5) so the full command I used was 'strings data.txt | grep "="'
6) So the result of the command search which is the psw: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

---------Level 10 -> 11 --------------
1) again enter the ssh address but change the 9 to a 10
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level is stored in the file data.txt, which contains base64 encoded data
4) So when opened the data.txt file with the encoded base64 psw. I used the base64 command with the flag -d or (--decode) followed by the filename. And also if you want to encode a file with base 64 you use the 'base64' command followed by the filename. 
5) so the full command I used was 'base64 -d data.txt'
6) So the result of the command search which is the psw: XXXXXXXXXXXXXXXXXXXXXXXXX

---------Level 11 -> 12 --------
1) again enter the ssh address but change the 10 to an 11
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level is stored in the file data.txt, where all lowercase(a-z)and uppercase(A-Z) letters have been rotated by 13 positions.
4) So what is used is the Ceaser Cipher or ROT rotation. Which in this case they use ROT13 for the reason it is rotating by 13. 
5) So i am going to use the 'tr' command for the reason it will swap out one set of charcters for another set. Then I will flag it with the alphabet to turn it back to readable/normal 'A-Za-z' 'N-ZA-Mn-za-m' also because they mention ROT13 it is the exact half of the alphabet so I only swap the letters at half way point. Then I follow up the command with '< data.txt' this feeds the requested document into the 'tr' command.
6) So the full command I used is 'tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt'
7) So the result of the command search which is the psw: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

--------Level 12 -> 13 ------------
1) again enter the ssh address but change the 11 to a 12
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level is stored in the file data.txt, which is a hexadump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory name. Or better, use the command "mktemp -d". Then copy the datafile using cp, and rename it using mv. 
4) So I started off by creating a temp directory called using the 'mktemp -d' command however to instantly change to the temp directory I use the command 'cd $(mktemp -d)'. Then because I need to copy the file and rename it I started off by firstly copying the file using the 'cp ~/data.txt .' command and the ~ symbol represents the home dir and the dot is to say to look in that folder/dir. Then as spesified the data.txt file is a hexadump file which contains hex codes, to reverse this I used the 'xxd -r data.txt myfile' command, the 'xxd' command is used to turn or reverse files to and from hexadump files.
5) For the reason that the file has been compressed multiple times using different tools I needed to run the 'file' command to find out what type of compression was used.
6) So for the first attemps at running 'file myfile' after renaming it 'myfile' the results were - 'myfile: gzip compressed data, was "data2.bin", last modified: Fri Apr  3 15:17:36 2026, max compression, from Unix, original size modulo 2^32 576' - which tells me that it has been compressed using 'gzip' firstly. So now the command will be 'mv myfile myfile.gz' this is to rename it to the compression used. Then to decrypt the file using gzip i used the command 'gzip -d myfile.gz'.
7) So for the second time running 'file myfile' the results were - 'myfile: bzip2 compressed data, block size = 900k' - which tells me that the second sort of compression/encryption used was bzip2. Now to then decrypt the bzip 2 file I used the 'bzip2 -d myfile'. And i renamed it back to myfile using the 'mv myfile.out myfile' command.
8) So for the 3rd time running the 'file myfile' command the results were - 'myfile: gzip compressed data, was "data4.bin", last modified: Fri Apr  3 15:17:36 2026, max compression, from Unix, original size modulo 2^32 20480' - which tells me that gzip was used to encrypt/compress the file. Now to then decrypt the file I used the 'mv myfile myfile.gz' to firstly rename as a gzip file and then to decrypt it i used the 'gzip -d myfile.gz' command.
9) So now when I ran the 'file myfile' command it gave me the result of - 'myfile: POSIX tar archive (GNU)' - this means now that the file has been unpacked and now for me to see what file is newly extracted I used the 'tar -xf myfile' command and then when running ls it showed the new file was data5.bin. Now to rename the file to make it easier to work with 'mv data5.bin myfile'. Then when I ran the 'file myfile' command it said it is still encrypted using POSIX. So now I needed to repeat the 'tar -xf myfile' steps.
10) After that it said 'bzip2', POSIX, gzip, and then when I ran 'file myfile' is finally said - 'myfile: ASCII text' - which meant it was fully decrypted. So I just ran 'cat myfile' to open and view the password.
11) The decrypted password was: XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

-------Level 13 -> 14 ----------
1) again enter the ssh address but change the 12 to a 13
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level /etc/bandit_pass/bandit14 and can only be read by under bandit14. For ths level, you dont get the next password, but you get a private SSh key that can be used to loginto the next level. Look at the previous commands that logged you into the previous bandit levels, and find out how to use the key for this level. If you need help with this level: a hint file can be found in the home directory. Make sure you read the error messages as they are informative.
4) So for this I will use the public key that is avaliable when in the home dir you run the ls -lah command you see 'sshkey.private' listed as a file that contains the private key as well as it will show the permissions assosiated with the file (it shoes the read,write, execute permissions as well as the user and group). To use the private key I will need to exit the shell using the 'exit' command   
5) The main protocol that will be used is 'scp - secure copy protocol'. So to start here on my main host I create a directory called 'mkdir overthewire' and then 'cd' into the dir. when in the dir I make use of the 'scp' command, however there are a few important notes. The full command - 'scp -P 2220 bandit13@bandit.labs.overthewire.org:/home/bandit13/sshkey.private .' -  its important to note that the port flag '-p' must be a capital letter when using the 'scp' command as well it is important to note that using the '.' fullstop is to tell the command to use the file in that dir and not look for a dir with that name there.
6) After running the command successfully it will open the shell of bandit13, enter the password and then the download for the sshkey.private file will begin into the dir you created as I created the 'overthewire' dir. However now to use the file the permissions of the file will need to be altered. To do this will make use of the 'chmod' but to execute with highest privelidge you will need to make use of 'sudo' with the 'chmod' command as well. So the full command to alter the permissions to make give me the full permissions of the file - 'sudo chmod 700 sshkey.private'. 
7) Now after the permissions have been altered to use the file key to access the next bandit level you will have to itterate the file into the command - 'ssh -p 2220 -i sshkey.private bandit14@bandit.labs.overthewire.org' - when done successfully you will not be prompted for a password as well as it will automatically log you into bandit level 14. 
8) Now the location of the password file as said in the instructions '/etc/bandit_pass' so then use 'cd'. When in the dir use cat to open and read the file 'cat bandit14'
9) The password for level 14 is :XXXXXXXXXXXXXXXXXXXXXXXXXXX

------Level 14 -> 15 --------
1) again enter the ssh address but change the 12 to a 13
2) Then copy the psw which you found in the prev level and paste it in
3) The password for the next level can be retrieved by submitting the password of the current level to port 30000 on local host.
4) So to run the command to access the localhost port 30000 I used the netcad command, so the full command i used was - 'nc localhost 30000' - and then I copied the password I got previously and pasted it in.
5) Which in return I got the password: XXXXXXXXXXXXXXXXXXXXXXXXXXXX
