-- Dados consistentes: todas as verificações devem retornar 0 linhas.
INSERT INTO customers (id, name, email) VALUES
  (1, 'Ana Souza',  'ana@example.com'),
  (2, 'Bruno Lima', 'bruno@example.com'),
  (3, 'Carla Dias', 'carla@example.com');

INSERT INTO accounts (id, customer_id, type, balance_cents) VALUES
  (1, 1, 'CHECKING', 50000),
  (2, 1, 'SAVINGS',  65000),
  (3, 2, 'CHECKING', 40000),
  (4, 3, 'CHECKING', 65000);

INSERT INTO transactions (id, account_id, kind, amount_cents, transfer_id, created_at) VALUES
  (1, 1, 'DEPOSIT',      100000, NULL,    '2026-01-02 09:00:00'),
  (2, 1, 'WITHDRAWAL',    20000, NULL,    '2026-01-03 10:00:00'),
  (3, 1, 'TRANSFER_OUT',  30000, 'T-001', '2026-01-04 11:00:00'),
  (4, 3, 'TRANSFER_IN',   30000, 'T-001', '2026-01-04 11:00:00'),
  (5, 2, 'DEPOSIT',       50000, NULL,    '2026-01-05 12:00:00'),
  (6, 3, 'DEPOSIT',       10000, NULL,    '2026-01-06 08:30:00'),
  (7, 4, 'DEPOSIT',       80000, NULL,    '2026-01-07 14:00:00'),
  (8, 4, 'TRANSFER_OUT',  15000, 'T-002', '2026-01-08 15:00:00'),
  (9, 2, 'TRANSFER_IN',   15000, 'T-002', '2026-01-08 15:00:00');
