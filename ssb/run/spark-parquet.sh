#!/bin/bash
die () {
    echo >&2 "$@"
    exit 1
}

#check for args
[ "$#" -eq 2 ] || die "Missing arguments required: spark-parquet.sh <executor-core> <num-executors>"

#save arg
COREEXECUTORS=$1
NUMEXECUTORS=$2

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
echo "Q1.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q1.1.sql
echo "Q.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q1.2.sql
echo "Q1.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q1.3.sql
echo "Q2.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q2.1.sql
echo "Q2.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q2.2.sql
echo "Q2.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q2.3.sql
echo "Q3.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q3.1.sql
echo "Q3.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q3.2.sql
echo "Q3.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q3.3.sql
echo "Q3.4-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q3.4.sql
echo "Q4.1-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q4.1.sql
echo "Q4.2-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q4.2.sql
echo "Q4.3-----------------------------------------------------"
/usr/bin/time -f "\n%e seconds elapsed" python ssb-pyspark.py $COREEXECUTORS $NUMEXECUTORS ../query/spark_parquet/Q4.3.sql
