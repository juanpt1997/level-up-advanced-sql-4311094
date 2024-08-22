select sum(sls.salesAmount) as salesPerYear, strftime('%Y', sls.soldDate) AS year
from sales sls
group by year;

with cte AS (
SELECT strftime('%Y', sls.soldDate) AS year, sls.salesAmount
FROM sales sls
)
SELECT cte.year,
  FORMAT("$%.2f", sum(cte.salesAmount)) as annualSales
FROM cte
GROUP by cte.year
ORDER BY cte.year;