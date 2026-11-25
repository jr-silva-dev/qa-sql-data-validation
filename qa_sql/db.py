"""Cria bases SQLite a partir dos scripts em db/."""
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DB_DIR = ROOT / "db"


def build_db(path=":memory:", with_defects=False):
    """Retorna uma conexão com schema + dados limpos (+ defeitos, se pedido)."""
    conn = sqlite3.connect(path)
    scripts = ["schema.sql", "seed_clean.sql"]
    if with_defects:
        scripts.append("seed_defects.sql")
    for name in scripts:
        conn.executescript((DB_DIR / name).read_text(encoding="utf-8"))
    conn.commit()
    return conn
