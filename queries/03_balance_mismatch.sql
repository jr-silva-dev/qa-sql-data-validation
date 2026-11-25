-- Saldo armazenado diferente da soma das transações.
SELECT id, stored_cents, calculated_cents
FROM (
    SELECT a.id,
           a.balance_cents AS stored_cents,
           COALESCE(SUM(CASE
               WHEN t.kind IN ('DEPOSIT', 'TRANSFER_IN')     THEN  t.amount_cents
               WHEN t.kind IN ('WITHDRAWAL', 'TRANSFER_OUT') THEN -t.amount_cents
           END), 0) AS calculated_cents
    FROM accounts a
    LEFT JOIN transactions t ON t.account_id = a.id
    GROUP BY a.id, a.balance_cents
)
WHERE stored_cents <> calculated_cents;
