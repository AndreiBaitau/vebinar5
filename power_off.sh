#!/bin/bash

sqlite3=`which sqlite3`
DB_FILE=~/vebinar5.db
SQLITE_OPTIONS=" -column -header "
random=`echo $(($RANDOM % 3))`
stat=`$sqlite3 $DB_FILE "select status from computer order by resource DESC LIMIT 1;"`  
res=`$sqlite3 $DB_FILE "select resource from computer order by resource DESC LIMIT 1;"`

off="Off"
on="On"
killed="Killed"
value=$1
 

function boot(){
 
if [ $random -eq $value ]
then
 $sqlite3 $SQLITE_OPTIONS $DB_FILE "insert into computer values ('"Off"',null);"
 echo "PC is successfuly powered OFF!"
else
 $sqlite3 $DB_FILE "insert into computer values ('"Killed"',null);"
 echo "You killed PC"
fi
}





function check(){
if [ "$stat" = $on ]
then
 echo "Checking your value"
 boot
elif [ "$stat" = $off ] 
then
 echo "Your PC is already powered OFF"
  exit 0
else 
 echo "Your PC is KILLED"
 exit 0
fi
}

if [ "$random" -eq 2 ]
then
 echo " Kernel PANIC "
 exit 0
else 
 echo "Proccesing..."
fi

if [ "$res" -gt 10 ]
then
 echo "The resource is exhausted"
 exit 0
elif [ "$stat" = "" ] 
then 
 echo "First you need to power on your PC"
 exit 0
else
 check
fi

echo "Random value was $random"

