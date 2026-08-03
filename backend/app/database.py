import psycopg2
from psycopg2.extras import RealDictCursor
from app.config import DATABASE_URL


def get_conn():
    return psycopg2.connect(DATABASE_URL)


def run_query(query, params=None, fetchone=False, fetchall=False, commit=False):
    conn = get_conn()
    try:
        with conn.cursor(cursor_factory=RealDictCursor) as cur:
            if params is None:
                cur.execute(query)
            else:
                cur.execute(query, params)

            if commit:
                conn.commit()
            if fetchone:
                return cur.fetchone()
            if fetchall:
                return cur.fetchall()
            return None
    finally:
        conn.close()
