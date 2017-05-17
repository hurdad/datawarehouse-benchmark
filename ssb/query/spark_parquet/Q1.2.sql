--Q1.2
select sum(lo_extendedprice*lo_discount) as
revenue
from ssb600.lineorder_parquet join ssb600.dim_date_parquet on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where 
d_yearmonthnum = 199401
and lo_discount between 4 and 6
and lo_quantity between 26 and 35