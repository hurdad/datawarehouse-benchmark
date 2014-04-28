--Q2.1
select sum(lo_revenue), d_year, p_brand
from lineorder_parquet
join dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
join part_parquet
  on lineorder_parquet.lo_partkey = part_parquet.p_partkey
join supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
where 
p_category = 'MFGR#12'
and s_region = 'AMERICA'
group by d_year, p_brand
order by d_year, p_brand
limit 1000;