--Q4.1
select d_year, c_nation,
sum(lo_revenue - lo_supplycost) as profit
from lineorder
join dim_date 
  on lineorder.lo_orderdatekey = dim_date.d_datekey
join customer
  on lineorder.lo_custkey = customer.c_customerkey
join supplier
  on lineorder.lo_suppkey = supplier.s_suppkey
join part
  on lineorder.lo_partkey = part.p_partkey
where
c_region = 'AMERICA'
and s_region = 'AMERICA'
and (p_mfgr = 'MFGR#1'
or p_mfgr = 'MFGR#2')
group by d_year, c_nation
order by d_year, c_nation;