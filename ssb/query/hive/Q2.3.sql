--Q2.3
select sum(lo_revenue), d_year, p_brand
from lineorder
join dim_date
  on lineorder.lo_orderdatekey = dim_date.d_datekey
join part
  on lineorder.lo_partkey = part.p_partkey
join supplier
  on lineorder.lo_suppkey = supplier.s_suppkey
where 
p_brand= 'MFGR#2239'
and s_region = 'EUROPE'
group by d_year, p_brand
order by d_year, p_brand;