-- Contas com saldo negativo.
SELECT id, type, balance_cents
FROM accounts
WHERE balance_cents < 0;
