set hive.execution.engine=spark;
set spark.executor.instances=30;
--Q1.1
select sum(lo_extendedprice*lo_discount) as
revenue
from lineorder_parquet join  dim_date_parquet on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where
d_year = 1993
and lo_discount between 1 and 3
and lo_quantity < 25;