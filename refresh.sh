sqlite3=`which sqlite3` 
DB_FILE=~/vebinar5.db
SQLITE_OPTIONS=" -column -header "
$sqlite3 $DB_FILE " delete from computer where resource >= 1; "
$sqlite3 $SQLITE_OPTIONS $DB_FILE " delete from sqlite_sequence where seq>=1;"
