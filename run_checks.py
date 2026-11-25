"""Uso: python run_checks.py [--defects]
Monta a base em memória e imprime o relatório de integridade."""
import sys

from qa_sql.checks import run_all
from qa_sql.db import build_db

with_defects = "--defects" in sys.argv
conn = build_db(with_defects=with_defects)
results = run_all(conn)

print(f"Base: {'COM defeitos' if with_defects else 'limpa'}\n")
failed = 0
for name, rows in results.items():
    status = "OK  " if not rows else "FALHA"
    failed += bool(rows)
    print(f"[{status}] {name}: {len(rows)} achado(s)")
    for row in rows:
        print(f"         {row}")
sys.exit(1 if failed else 0)
