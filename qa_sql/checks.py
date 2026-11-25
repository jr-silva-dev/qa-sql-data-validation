"""Executa as consultas de validação em queries/ e devolve os achados."""
from pathlib import Path

QUERIES_DIR = Path(__file__).resolve().parent.parent / "queries"


def list_checks():
    return sorted(QUERIES_DIR.glob("*.sql"))


def run_check(conn, sql_file):
    cur = conn.execute(Path(sql_file).read_text(encoding="utf-8"))
    return cur.fetchall()


def run_all(conn):
    return {f.stem: run_check(conn, f) for f in list_checks()}
