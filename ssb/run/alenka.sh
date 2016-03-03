#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
echo "Q1.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss11.sql
echo "Q1.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss12.sql
echo "Q1.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss13.sql
echo "Q2.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss21.sql
echo "Q2.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss22.sql
echo "Q2.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss23.sql
echo "Q3.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss31.sql
echo "Q3.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss32.sql
echo "Q3.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss33.sql
echo "Q3.4-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss34.sql
echo "Q4.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss41.sql
echo "Q4.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss42.sql
echo "Q4.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" ./alenka ss43.sql