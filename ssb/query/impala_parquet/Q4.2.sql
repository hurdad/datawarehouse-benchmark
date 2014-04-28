--Q4.2
select d_year, s_nation, p_category,
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
and (d_year = 1997 or d_year = 1998)
and (p_mfgr = 'MFGR#1'
or p_mfgr = 'MFGR#2')
group by d_year, s_nation, p_category
order by d_year, s_nation, p_category
limit 1000;