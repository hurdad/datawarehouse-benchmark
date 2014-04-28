--Q4.3
select d_year, s_city, p_brand,
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
s_nation = 'UNITED STATES'
and (d_year = 1997 or d_year = 1998)
and p_category = 'MFGR#14'
group by d_year, s_city, p_brand
order by d_year, s_city, p_brand
limit 1000;