#!/bin/bash

#change to script directory so relative paths work below
cd "$(dirname "$0")"

#run queries
impala-shell -i ziox1 -d ssb600 < ../query/ssb_query_impala.sql 
impala-shell -i ziox1 -d ssb1000 < ../query/ssb_query_impala.sql 
impala-shell -i ziox1 -d ssb1400 < ../query/ssb_query_impala.sql 
