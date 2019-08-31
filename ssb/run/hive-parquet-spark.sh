#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}

#check for args
[ "$#" -eq 1 ] || die "Missing arguments required: hive-parquet-spark.sh <db>"

#save arg
DB=$1

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
echo "Q1.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q1.1.sql
echo "Q1.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q1.2.sql
echo "Q1.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q1.3.sql
echo "Q2.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q2.1.sql
echo "Q2.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q2.2.sql
echo "Q2.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q2.3.sql
echo "Q3.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q3.1.sql
echo "Q3.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q3.2.sql
echo "Q3.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q3.3.sql
echo "Q3.4-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q3.4.sql
echo "Q4.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q4.1.sql
echo "Q4.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q4.2.sql
echo "Q4.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" hive --database $DB -f ../query/hive_parquet_spark/Q4.3.sql