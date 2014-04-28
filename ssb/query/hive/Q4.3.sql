--Q4.3
select d_year, s_city, p_brand,
sum(lo_revenue - lo_supplycost) as profit
from lineorder
join dim_date 
  on lineorder.lo_orderdatekey = dim_date.d_datekey
join customer
  on lineorder.lo_custkey = customer.c_customerkey
join supplier
  on lineorder.lo_suppkey =  supplier.s_suppkey
join part
  on lineorder.lo_partkey = part.p_partkey
where
s_nation = 'UNITED STATES'
and (d_year = 1997 or d_year = 1998)
and p_category = 'MFGR#14'
group by d_year, s_city, p_brand
order by d_year, s_city, p_brand;