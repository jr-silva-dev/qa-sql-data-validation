-- Transações idênticas (mesma conta, tipo, valor, transferência e horário).
SELECT account_id, kind, amount_cents, created_at, COUNT(*) AS occurrences
FROM transactions
GROUP BY account_id, kind, amount_cents, created_at, COALESCE(transfer_id, '')
HAVING COUNT(*) > 1;
