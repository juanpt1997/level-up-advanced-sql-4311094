SELECT e.firstName, e.lastName, strftime('%m', sls.soldDate) AS month, sls.soldDate, sls.salesAmount
FROM sales sls
INNER JOIN employee e ON e.employeeId = sls.employeeId
where strftime('%Y', sls.soldDate) = '2021';

SELECT e.firstName, e.lastName, 
      CASE WHEN strftime('%m', soldDate) = '01'
        THEN salesAmount END as janSales,
      CASE WHEN strftime('%m', soldDate) = '02'
        THEN salesAmount END as febSales,
      CASE WHEN strftime('%m', soldDate) = '03'
        THEN salesAmount END as marSales,
      CASE WHEN strftime('%m', soldDate) = '04'
        THEN salesAmount END as aprSales,
      CASE WHEN strftime('%m', soldDate) = '05'
        THEN salesAmount END as maySales,
      CASE WHEN strftime('%m', soldDate) = '06'
        THEN salesAmount END as junSales,
      CASE WHEN strftime('%m', soldDate) = '07'
        THEN salesAmount END as julSales,
      CASE WHEN strftime('%m', soldDate) = '08'
        THEN salesAmount END as augSales,
      CASE WHEN strftime('%m', soldDate) = '09'
        THEN salesAmount END as sepSales,
      CASE WHEN strftime('%m', soldDate) = '10'
        THEN salesAmount END as octSales,
      CASE WHEN strftime('%m', soldDate) = '11'
        THEN salesAmount END as novSales,
      CASE WHEN strftime('%m', soldDate) = '12'
        THEN salesAmount END as decSales
FROM sales sls
INNER JOIN employee e ON e.employeeId = sls.employeeId
where strftime('%Y', sls.soldDate) = '2021'
order by e.lastName, e.firstName;

SELECT e.firstName, e.lastName, 
      SUM(CASE WHEN strftime('%m', soldDate) = '01'
        THEN salesAmount END) as janSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '02'
        THEN salesAmount END) as febSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '03'
        THEN salesAmount END) as marSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '04'
        THEN salesAmount END) as aprSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '05'
        THEN salesAmount END) as maySales,
      SUM(CASE WHEN strftime('%m', soldDate) = '06'
        THEN salesAmount END) as junSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '07'
        THEN salesAmount END) as julSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '08'
        THEN salesAmount END) as augSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '09'
        THEN salesAmount END) as sepSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '10'
        THEN salesAmount END) as octSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '11'
        THEN salesAmount END) as novSales,
      SUM(CASE WHEN strftime('%m', soldDate) = '12'
        THEN salesAmount END) as decSales
FROM sales sls
INNER JOIN employee e ON e.employeeId = sls.employeeId
where strftime('%Y', sls.soldDate) = '2021'
GROUP BY e.employeeId
order by e.lastName, e.firstName;