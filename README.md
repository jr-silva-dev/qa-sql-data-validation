# Validação de dados com SQL e pytest

![CI](https://github.com/SEU-USUARIO/qa-sql-data-validation/actions/workflows/ci.yml/badge.svg)

Projeto de QA que valida a **integridade dos dados de um banco digital fictício** usando consultas SQL, automatizadas com Python e pytest. Mostra como um QA usa SQL para validar massa de dados, saldos e transferências, que é uma rotina comum em times de produtos financeiros.

## O que é verificado

| Consulta | O que procura |
|---|---|
| `01_duplicate_transactions` | Transações idênticas (mesma conta, tipo, valor e horário) |
| `02_negative_balance` | Contas com saldo negativo |
| `03_balance_mismatch` | Saldo armazenado diferente da soma das transações |
| `04_orphan_transactions` | Transações de contas que não existem |
| `05_unpaired_transfers` | Transferências sem as duas pontas (saída e entrada) ou com valores diferentes |
| `06_invalid_amounts` | Transações com valor zero ou negativo |

## Como funciona

- `db/schema.sql`: tabelas `customers`, `accounts` e `transactions` (valores em centavos). O schema **não tem constraints de propósito**, para simular uma base replicada ou legada em que os problemas só aparecem com consultas.
- `db/seed_clean.sql`: dados consistentes. Todas as verificações devem retornar 0 linhas.
- `db/seed_defects.sql`: injeta um defeito de cada tipo. Cada verificação deve encontrar exatamente o defeito esperado.
- `tests/`: pytest confirma as duas coisas, ou seja, base limpa sem achados e base com defeitos com os achados certos.

## Como rodar

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt

pytest -v                      # testes automatizados
python run_checks.py           # relatório na base limpa
python run_checks.py --defects # relatório na base com defeitos
```

## Como adicionar uma nova verificação

1. Crie `queries/07_nome_da_verificacao.sql`.
2. Se necessário, adicione um defeito em `db/seed_defects.sql`.
3. Registre o resultado esperado em `EXPECTED_DEFECTS` no arquivo `tests/test_data_integrity.py`. Um teste falha se você esquecer.

## Tecnologias

SQL (SQLite), Python, pytest e GitHub Actions.
