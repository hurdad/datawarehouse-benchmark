set hive.execution.engine=spark;
set spark.executor.instances=30;
--Q2.3
select sum(lo_revenue), d_year, p_brand
from lineorder_parquet
join dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
join part_parquet
  on lineorder_parquet.lo_partkey = part_parquet.p_partkey
join supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
where 
p_brand= 'MFGR#2239'
and s_region = 'EUROPE'
group by d_year, p_brand
order by d_year, p_brand
limit 1000;