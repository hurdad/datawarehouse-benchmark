set hive.execution.engine=spark;
set spark.executor.instances=30;
--Q4.1
select d_year, c_nation,
sum(lo_revenue - lo_supplycost) as profit
from lineorder_parquet
join dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
join customer_parquet
  on lineorder_parquet.lo_custkey = customer_parquet.c_customerkey
join supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
join part_parquet
  on lineorder_parquet.lo_partkey = part_parquet.p_partkey
where
c_region = 'AMERICA'
and s_region = 'AMERICA'
and (p_mfgr = 'MFGR#1'
or p_mfgr = 'MFGR#2')
group by d_year, c_nation
order by d_year, c_nation
limit 1000;