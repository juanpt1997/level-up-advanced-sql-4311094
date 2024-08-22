select * from sales sls
inner join inventory inv on inv.inventoryId = sls.inventoryId
INNER JOIN model m on m.modelId = inv.modelId
where m.EngineType='Electric';

-- One alternative
select * from sales sls
inner join inventory inv on inv.inventoryId = sls.inventoryId
INNER JOIN model m on m.modelId = inv.modelId
where m.EngineType='Electric';

-- second alternative
select * from sales sls
inner join inventory inv on inv.inventoryId = sls.inventoryId
where inv.modelId IN (
  SELECT m.modelId from model m
  where m.EngineType='Electric'
);