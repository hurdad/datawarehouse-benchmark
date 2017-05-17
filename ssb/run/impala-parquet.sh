#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}

#check for args
[ "$#" -eq 2 ] || die "Missing arguments required: impala.sh <impalad> <db>"

#save arg
IMPALAD=$1
DB=$2 

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
fab drop_caches
echo "Q1.1-COLD---------------------------------------------------- "
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.1.sql
echo "Q1.1-HOT---------------------------------------------------- "
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.1.sql
fab drop_caches
echo "Q1.2-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.2.sql
echo "Q1.2-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.2.sql
fab drop_caches
echo "Q1.3-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.3.sql
echo "Q1.3-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q1.3.sql
fab drop_caches
echo "Q2.1-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.1.sql
echo "Q2.1-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.1.sql
fab drop_caches
echo "Q2.2-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.2.sql
echo "Q2.2-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.2.sql
fab drop_caches
echo "Q2.3-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.3.sql
echo "Q2.3-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q2.3.sql
fab drop_caches
echo "Q3.1-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.1.sql
echo "Q3.1-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.1.sql
fab drop_caches
echo "Q3.2-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.2.sql
echo "Q3.2-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.2.sql
fab drop_caches
echo "Q3.3-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.3.sql
echo "Q3.3-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.3.sql
fab drop_caches
echo "Q3.4-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.4.sql
echo "Q3.4-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q3.4.sql
fab drop_caches
echo "Q4.1-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.1.sql
echo "Q4.1-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.1.sql
fab drop_caches
echo "Q4.2-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.2.sql
echo "Q4.2-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.2.sql
fab drop_caches
echo "Q4.3-COLD----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.3.sql
echo "Q4.3-HOT----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" impala-shell -i $IMPALAD -d $DB -f ../query/impala_parquet/Q4.3.sql

