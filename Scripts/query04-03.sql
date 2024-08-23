select strftime('%Y-%m', soldDate) AS soldMonth,
    count(sales.salesId) as numberCarsSold
from sales
GROUP BY soldMonth;

select strftime('%Y-%m', soldDate) AS soldMonth,
    count(*) as numberCarsSold,
    LAG (count(*), 1 , 0) OVER calMonth as lastMonthCarsSold
from sales
GROUP BY soldMonth
WINDOW calMonth AS (ORDER BY strftime('%Y-%m', soldDate))
;