--Q1.1
select sum(lo_extendedprice*lo_discount) as
revenue
from lineorder_parquet join  dim_date_parquet on lo_orderdatekey = d_datekey
where
d_year = 1993
and lo_discount between 1 and 3
and lo_quantity < 25;