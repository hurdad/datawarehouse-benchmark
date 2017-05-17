--Q3.2
select c_city, s_city, d_year, sum(lo_revenue)
as revenue
from ssb600.lineorder_parquet
join ssb600.customer_parquet
  on lineorder_parquet.lo_custkey = customer_parquet.c_customerkey
join ssb600.supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
join ssb600.dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where
c_nation = 'UNITED STATES'
and s_nation = 'UNITED STATES'
and d_year >= 1992 and d_year <= 1997
group by c_city, s_city, d_year
order by d_year asc, revenue desc
limit 1000