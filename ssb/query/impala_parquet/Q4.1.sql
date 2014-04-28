--Q4.1
select d_year, c_nation,
sum(lo_revenue - lo_supplycost) as profit
from lineorder_parquet
join dim_date_parquet
  on lo_orderdatekey = d_datekey
join customer_parquet
  on lo_custkey = c_customerkey
join supplier_parquet
  on lo_suppkey = s_suppkey
join part_parquet
  on lo_partkey = p_partkey
where
c_region = 'AMERICA'
and s_region = 'AMERICA'
and (p_mfgr = 'MFGR#1'
or p_mfgr = 'MFGR#2')
group by d_year, c_nation
order by d_year, c_nation
limit 1000;