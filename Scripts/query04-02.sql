SELECT 
    strftime('%Y', soldDate) AS soldYear,
    strftime('%m', soldDate) AS soldMonth,
    salesAmount
FROM sales;

SELECT 
    strftime('%Y', soldDate) AS soldYear,
    strftime('%m', soldDate) AS soldMonth,
    sum(salesAmount)
FROM sales
GROUP BY soldYear, soldMonth
ORDER BY soldYear, soldMonth
;

with cte_sales as (
SELECT 
    strftime('%Y', soldDate) AS soldYear,
    strftime('%m', soldDate) AS soldMonth,
    sum(salesAmount) as salesAmount
FROM sales
GROUP BY soldYear, soldMonth
ORDER BY soldYear, soldMonth
)
SELECT soldYear, soldMonth, salesAmount,
    sum(salesAmount) OVER (
    PARTITION BY soldYear
    ORDER BY soldYear, soldMonth) AS annualSalesRunningTotal
FROM cte_sales
ORDER BY soldYear, soldMonth
;