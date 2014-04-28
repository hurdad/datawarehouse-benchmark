--Q3.2
select c_city, s_city, d_year, sum(lo_revenue)
as revenue
from lineorder_parquet
join customer_parquet
  on lo_custkey = c_customerkey
join supplier_parquet
  on lo_suppkey = s_suppkey
join dim_date_parquet
  on lo_orderdatekey = d_datekey
where
c_nation = 'UNITED STATES'
and s_nation = 'UNITED STATES'
and d_year >= 1992 and d_year <= 1997
group by c_city, s_city, d_year
order by d_year asc, revenue desc
limit 1000;