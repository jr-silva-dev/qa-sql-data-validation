-- Transferências sem as duas pontas (saída e entrada) ou com valores diferentes.
SELECT transfer_id,
       SUM(CASE WHEN kind = 'TRANSFER_OUT' THEN 1 ELSE 0 END) AS out_legs,
       SUM(CASE WHEN kind = 'TRANSFER_IN'  THEN 1 ELSE 0 END) AS in_legs
FROM transactions
WHERE transfer_id IS NOT NULL
GROUP BY transfer_id
HAVING out_legs <> 1
    OR in_legs <> 1
    OR SUM(CASE WHEN kind = 'TRANSFER_OUT' THEN amount_cents ELSE 0 END)
       <> SUM(CASE WHEN kind = 'TRANSFER_IN' THEN amount_cents ELSE 0 END);
