--Q2.2
select sum(lo_revenue), d_year, p_brand
from lineorder
join dim_date
  on lineorder.lo_orderdatekey = dim_date.d_datekey
join part
  on lineorder.lo_partkey = part.p_partkey
join supplier
  on lineorder.lo_suppkey = supplier.s_suppkey
where 
p_brand between 'MFGR#2221' and 'MFGR#2228'
and s_region = 'ASIA'
group by d_year, p_brand
order by d_year, p_brand;