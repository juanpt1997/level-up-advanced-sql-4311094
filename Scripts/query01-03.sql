-- List all customers & their sales, even if some data is gone

SELECT cus.firstName, cus.lastName, cus.email, s.salesAmount, s.soldDate
FROM customer cus
INNER JOIN sales s ON s.customerId = cus.customerId

-- UNION WITH CUSTOMERS WHO HAVE NO SALES
UNION
SELECT cus.firstName, cus.lastName, cus.email, s.salesAmount, s.soldDate
FROM customer cus
LEFT JOIN sales s ON s.customerId = cus.customerId
where s.salesId is NULL

-- UNION WITH SALES MISSING CUSTOMER DATA
UNION
SELECT cus.firstName, cus.lastName, cus.email, s.salesAmount, s.soldDate
FROM customer cus
RIGHT JOIN sales s ON s.customerId = cus.customerId
WHERE cus.customerId is NULL
;