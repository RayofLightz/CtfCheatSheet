#Cheat Sheet

##Index
1. Reverse
    1. r2
    2. gdb
2. Scanning
    1. nmap
    2. dirb
3. Bash
    1. grep and regex
    2. filesystem navigation
        1. wildcards
    3. text manipulation and redirection

##Reverse
This section contains references to popular RE tools used in ctfs.

###r2
Radare2 is an open source disassembler and hex editor.

open up a file

`r2 <filename>`

grep in r2
`<command>  ~ <search string>`

analyze all the things ALWAYS RUN WHEN FIRST STARTING

`aaa`

list all functions in the binary

`afl`

seek to a function or memory address

`s <address or function name>`

print the disassembly for the function

`pdf`

enter disassembly graph view

`VV`

enter hex viewer

`V`

####gdb

Gdb (GNU debugger) is an open source debugger.

open up a file

`gdb <filename>`

changes disassembly flavor to Intel syntax (Because at&t syntax is garbage)

`set disassembly-flavor intel`

disassemble a function

`disas <functionname>`

set a breakpoint

```b *<address>```

run the program

`r <optional args>`

single step

`si`

step over function

`n`

continue until next breakpoint

`c`

###Scanning
This category is for all your web scanning needs

####nmap
Nmap is a popular port scanner. 

The "quick and simple scan" This runs version detection, script scanning, traceroute and os detection on the top 1000 ports at the second to fastest speed.
The reason `-T5` is not used is because it can produce unreliable results.

`nmap -T4 -A --top-ports 1000 <targetaddress>`

Scan all the things with version detection

`nmap -T4 -sV -p1-65535 <targetaddress>`

Output to scan to file, personally I use the grepable format

`nmap <scanoptions> -oG <filename>`

Scan address from a file

`nmap <scanoptions> -iL <filename>`

####Dirb
Dirb is a scanning tool for website directory bruteforcing

Get wordlists installed with dirb

`ls /usr/share/dirb/wordlists/`

scan with a specified wordlist

`dirb http://example.com/ <pathtowordlist>`

add extensions to the end of words

`dirb http://example.com/ -X <extension>`

or from a file

`dirb http://example.com/ -x <extensionsfile>`

Save output to file

`dirb http://example.com -o <filename>`

###Bash
This is not a tutorial on bash, but a cheatsheet. If you want a good bash tutorial I would suggest The Linux Command Line by William Shotts.
The most important command in bash is `man` When in trouble remember man pages are your best friend.

####grep and regex
Grep and regex (regular expressions) are two awesomely powerful tools that make searching through text easy.

Search a file for the text SWISSCHEESE

`grep 'SWISSCHEESE' <file>`

Search for possible flags: note this will not pickup special characters

`grep 'FLAG\{[A-Z0-9a-z]\}' <file>`

Use extended regex with grep. Sometimes the command `egrep` is an alias to this already

`grep -E`

####filesystem navigation
Quick ways to get around your system

go to your HOME directory

`cd ~/` or `cd $HOME`

list all files and perms with adjusted file size

`ls -lah`

#####wildcards
Wildcards are special characters to make bulk file processing easier

long list all png files

`ls -l *\.png`

for more information run

`man 7 glob`

####text manipulation and redirection
Helpful bash redirections

Search the contents of a website using a pipeline and grep

`curl http://example.com/ | grep "DUCK"`

Get the number of unique lines in a text file and sort by number of occurrences

`uniq -c <file> | sort -n`
