-- Modelo simplificado de um banco digital (valores em centavos).
-- Propositalmente SEM constraints de CHECK/FK: simula uma base replicada/legada,
-- onde a validação de integridade precisa ser feita por consultas.
CREATE TABLE customers (
    id    INTEGER PRIMARY KEY,
    name  TEXT NOT NULL,
    email TEXT NOT NULL
);

CREATE TABLE accounts (
    id            INTEGER PRIMARY KEY,
    customer_id   INTEGER NOT NULL,
    type          TEXT NOT NULL,      -- CHECKING | SAVINGS
    balance_cents INTEGER NOT NULL
);

CREATE TABLE transactions (
    id           INTEGER PRIMARY KEY,
    account_id   INTEGER NOT NULL,
    kind         TEXT NOT NULL,       -- DEPOSIT | WITHDRAWAL | TRANSFER_OUT | TRANSFER_IN
    amount_cents INTEGER NOT NULL,
    transfer_id  TEXT,                -- liga as duas pontas de uma transferência
    created_at   TEXT NOT NULL
);
