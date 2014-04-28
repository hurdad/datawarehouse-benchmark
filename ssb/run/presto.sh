#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}

#check for args
[ "$#" -eq 3 ] || die "Missing arguments required: presto.sh <server:port> <catalog> <db>"

#save arg
SERVER=$1
CATALOG=$2
DB=$3 

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
echo "Q1.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q1.1.sql
echo "Q1.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q1.2.sql
echo "Q1.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q1.3.sql
echo "Q2.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q2.1.sql
echo "Q2.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q2.2.sql
echo "Q2.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q2.3.sql
echo "Q3.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q3.1.sql
echo "Q3.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q3.2.sql
echo "Q3.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q3.3.sql
echo "Q3.4-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q3.4.sql
echo "Q4.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q4.1.sql
echo "Q4.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q4.2.sql
echo "Q4.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" presto --server $SERVER --catalog $CATALOG --schema $DB -f ../query/presto/Q4.3.sql
