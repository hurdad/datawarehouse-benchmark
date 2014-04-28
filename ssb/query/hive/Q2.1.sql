--Q2.1
select sum(lo_revenue), d_year, p_brand
from lineorder
join dim_date
  on lineorder.lo_orderdatekey = dim_date.d_datekey
join part
  on lineorder.lo_partkey = part.p_partkey
join supplier
  on lineorder.lo_suppkey = supplier.s_suppkey
where 
p_category = 'MFGR#12'
and s_region = 'AMERICA'
group by d_year, p_brand
order by d_year, p_brand;