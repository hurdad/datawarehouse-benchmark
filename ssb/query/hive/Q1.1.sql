--Q1.1
select sum(lo_extendedprice*lo_discount) as
revenue
from lineorder join  dim_date on lineorder.lo_orderdatekey = dim_date.d_datekey
where
d_year = 1993
and lo_discount between 1 and 3
and lo_quantity < 25;