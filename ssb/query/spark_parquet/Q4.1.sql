--Q4.1
select d_year, c_nation,
sum(lo_revenue - lo_supplycost) as profit
from ssb600.lineorder_parquet
join ssb600.dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
join ssb600.customer_parquet
  on lineorder_parquet.lo_custkey = customer_parquet.c_customerkey
join ssb600.supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
join ssb600.part_parquet
  on lineorder_parquet.lo_partkey = part_parquet.p_partkey
where
c_region = 'AMERICA'
and s_region = 'AMERICA'
and (p_mfgr = 'MFGR#1'
or p_mfgr = 'MFGR#2')
group by d_year, c_nation
order by d_year, c_nation
limit 1000