-- Transações com valor zero ou negativo.
SELECT id, account_id, kind, amount_cents
FROM transactions
WHERE amount_cents <= 0;
