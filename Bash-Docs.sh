#Every thing about bash scripting
# Auther : Tauseed Zaman 


# some basic commands:
> ls	 #list elements of the current directory
> pwd 	# shows the path from the root directory
> cd 	# change directory 
> ps 	#shows running processes, 

#variable 
we can create variables in bash 
I.e: x=hello,  
x=10, 
x="hello world"
ip=192.111.111.1

# variables usage
echo "Hello $name"
nmap $ip

#declare variable methods

> declare -i x=123 	#integer value
> declare -r x=123	#read-only
> declare -l x="LOVE"	#lower case
> declare -u x="love"  	#upper case
 


 # execute bash scripts saved in a file
 # bash script file has the .sh extension 
 > bash mybashfile.sh
 > ./mybashfile.sh


#default variables 
$machtype
$home
$pwd 
$hostname
$bash_version
$seconds
$0


# to know what they are used for just echo them in the command prompt 


#save bash command result to a variables in bash file 
 
 #! bin/bash
 # just a simple bash script
 x=$(pwd)
 echo $x
 #will print the result of > pwd command


#more complex variables in bash

#! bin/bash
# just a simple bash script
x=$(ping -c 1 example.com | grep "bytes from"  | cut -d = f 4)
echo "the king takes $x seconds"

# arthematic operations with bash

declare x=4
declare y=4
#Exponention z = $(($x ** $y))
#Diviston z = $(($x / $y))
#Multiply z = $(($x * $y))
#subtraction z = $(($x - $y))
#Addition z = $(($x + $y))
#Module z = $(($x ÷ $y))
#Increment $(($x++))
#Decrement $(($x--))


#Comparison operator

#equal [[ $a==$b ]] or for numbers [[ 22 -eq 22 ]] 	>returbs true
#LessOrEqual[[ $a<=$b ]] or -ge
#GreaterOrEqual[[ $a>=$b ]] or -le
#Less[[ $a<$b ]] or -gt
#Greater [[ $a>$b ]] or -lt
#NotEqual [[ $a!=$b ]] or -ne
# Comparison expression return true,1 and false, 0
#to view the result try this way
[[ $a!=$b ]]
> echo $?
true or 1

#logical operators
> [[ $a && $b ]] 
> [[ $b || $b ]]
> [[ ! $a ]]



# still working in this 