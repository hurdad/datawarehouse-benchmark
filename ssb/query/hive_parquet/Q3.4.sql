--Q3.4
select c_city, s_city, d_year, sum(lo_revenue)
as revenue
from lineorder_parquet
join customer_parquet
  on lineorder_parquet.lo_custkey = customer_parquet.c_customerkey
join supplier_parquet
  on lineorder_parquet.lo_suppkey = supplier_parquet.s_suppkey
join dim_date_parquet
  on lineorder_parquet.lo_orderdatekey = dim_date_parquet.d_datekey
where
(c_city='UNITED KI1' or c_city='UNITED KI5')
and (s_city='UNITED KI1' or s_city='UNITED KI5')
and d_yearmonth = 'Dec1997'
group by c_city, s_city, d_year
order by d_year asc, revenue desc
limit 1000;
