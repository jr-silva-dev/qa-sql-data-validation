import pytest

from qa_sql.checks import QUERIES_DIR, list_checks, run_check

# Para cada verificação: valores esperados da 1ª coluna na base com defeitos.
EXPECTED_DEFECTS = {
    "01_duplicate_transactions": [3],      # account_id da transação duplicada
    "02_negative_balance": [5],            # id da conta com saldo negativo
    "03_balance_mismatch": [6],            # id da conta com saldo divergente
    "04_orphan_transactions": [13],        # id da transação órfã
    "05_unpaired_transfers": ["T-900"],    # transferência sem contrapartida
    "06_invalid_amounts": [15],            # id da transação com valor 0
}


def first_column(rows):
    return sorted(row[0] for row in rows)


def test_every_query_has_an_expectation():
    names = {f.stem for f in list_checks()}
    assert names == set(EXPECTED_DEFECTS), "nova verificação sem expectativa de teste"


@pytest.mark.parametrize("name", sorted(EXPECTED_DEFECTS))
def test_clean_database_has_no_findings(clean_db, name):
    assert run_check(clean_db, QUERIES_DIR / f"{name}.sql") == []


@pytest.mark.parametrize("name,expected", sorted(EXPECTED_DEFECTS.items()))
def test_defects_are_detected(defect_db, name, expected):
    rows = run_check(defect_db, QUERIES_DIR / f"{name}.sql")
    assert first_column(rows) == expected
