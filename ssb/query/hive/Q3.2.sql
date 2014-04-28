--Q3.2
select c_city, s_city, d_year, sum(lo_revenue)
as revenue
from lineorder
join customer
  on lineorder.lo_custkey = customer.c_customerkey
join supplier
  on lineorder.lo_suppkey = supplier.s_suppkey
join dim_date
  on lineorder.lo_orderdatekey = dim_date.d_datekey
where
c_nation = 'UNITED STATES'
and s_nation = 'UNITED STATES'
and d_year >= 1992 and d_year <= 1997
group by c_city, s_city, d_year
order by d_year asc, revenue desc;