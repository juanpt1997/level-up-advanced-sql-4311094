-- First, getting necessay data
SELECT e.firstName, e.lastName, m.model, sls.salesId
FROM sales sls
INNER JOIN employee e 
  ON e.employeeId = sls.employeeId
INNER JOIN inventory inv 
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model m 
  ON m.modelId = inv.modelId;

-- second apply grouping to get number of models sold per employee
SELECT e.firstName, e.lastName, m.model, count(m.modelId) as numberSold
FROM sales sls
INNER JOIN employee e 
  ON e.employeeId = sls.employeeId
INNER JOIN inventory inv 
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model m 
  ON m.modelId = inv.modelId
GROUP BY e.employeeId, m.modelId
ORDER BY e.lastName, e.firstName, m.model;

-- windowing function
-- parts: 
-- 1st is the PARTITION BY, it separates results into partitions 
-- 2nd is the ORDER BY, to rank rows we need to know which order to arrange them in
-- 3rd is the function to apply, in this case is rank()
SELECT e.firstName, e.lastName, m.model, count(m.modelId) as numberSold,
  rank() OVER (PARTITION BY sls.employeeId
              ORDER BY count(m.modelId) DESC) AS Rank
FROM sales sls
INNER JOIN employee e 
  ON e.employeeId = sls.employeeId
INNER JOIN inventory inv 
  ON inv.inventoryId = sls.inventoryId
INNER JOIN model m 
  ON m.modelId = inv.modelId
GROUP BY e.employeeId, m.modelId
ORDER BY e.lastName, e.firstName, m.model;