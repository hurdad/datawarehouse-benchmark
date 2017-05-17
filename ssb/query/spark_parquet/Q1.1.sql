--Q1.1
select sum(lo_extendedprice*lo_discount) as
revenue
from ssb600.lineorder_parquet join ssb600.dim_date_parquet on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where
d_year = 1993
and lo_discount between 1 and 3
and lo_quantity < 25