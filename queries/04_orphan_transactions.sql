-- Transações que apontam para uma conta inexistente.
SELECT t.id, t.account_id, t.kind, t.amount_cents
FROM transactions t
LEFT JOIN accounts a ON a.id = t.account_id
WHERE a.id IS NULL;
