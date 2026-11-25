-- Aplicado SOBRE o seed_clean.sql: injeta um defeito de cada tipo.

-- 1) Transação duplicada (mesma conta, tipo, valor e horário da transação 6).
INSERT INTO transactions VALUES (10, 3, 'DEPOSIT', 10000, NULL, '2026-01-06 08:30:00');
UPDATE accounts SET balance_cents = 50000 WHERE id = 3;

-- 2) Saldo negativo (conta 5 saca sem ter fundos).
INSERT INTO accounts VALUES (5, 3, 'CHECKING', -5000);
INSERT INTO transactions VALUES (11, 5, 'WITHDRAWAL', 5000, NULL, '2026-01-09 09:00:00');

-- 3) Saldo divergente (conta 6 tem saldo 99999, mas as transações somam 20000).
INSERT INTO accounts VALUES (6, 2, 'SAVINGS', 99999);
INSERT INTO transactions VALUES (12, 6, 'DEPOSIT', 20000, NULL, '2026-01-09 10:00:00');

-- 4) Transação órfã (conta 99 não existe).
INSERT INTO transactions VALUES (13, 99, 'DEPOSIT', 1000, NULL, '2026-01-10 11:00:00');

-- 5) Transferência sem contrapartida (saiu da conta 1, nunca entrou em outra).
INSERT INTO transactions VALUES (14, 1, 'TRANSFER_OUT', 7000, 'T-900', '2026-01-10 12:00:00');
UPDATE accounts SET balance_cents = 43000 WHERE id = 1;

-- 6) Valor inválido (depósito com valor zero).
INSERT INTO transactions VALUES (15, 2, 'DEPOSIT', 0, NULL, '2026-01-10 13:00:00');
