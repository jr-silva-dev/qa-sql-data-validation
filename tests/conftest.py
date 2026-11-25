import pytest

from qa_sql.db import build_db


@pytest.fixture
def clean_db():
    conn = build_db()
    yield conn
    conn.close()


@pytest.fixture
def defect_db():
    conn = build_db(with_defects=True)
    yield conn
    conn.close()
