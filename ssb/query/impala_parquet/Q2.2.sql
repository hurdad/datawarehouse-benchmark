--Q2.2
select sum(lo_revenue), d_year, p_brand
from lineorder_parquet
join dim_date_parquet
  on lo_orderdatekey = d_datekey
join part_parquet
  on lo_partkey = p_partkey
join supplier_parquet
  on lo_suppkey = s_suppkey
where 
p_brand between 'MFGR#2221' and 'MFGR#2228'
and s_region = 'ASIA'
group by d_year, p_brand
order by d_year, p_brand
limit 1000;