set hive.execution.engine=mr;
--Q1.3
select sum(lo_extendedprice*lo_discount) as
revenue
from lineorder_parquet join  dim_date_parquet on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where 
d_weeknuminyear = 6
and d_year = 1994
and lo_discount between 5 and 7
and lo_quantity between 26 and 35;