from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker

DATABASE_URL="postgresql+psycopg://postgres:123456@localhost:5432/insighthub"

engine = create_engine(DATABASE_URL, echo=False, pool_pre_ping=True,)

SessionLocal = sessionmaker(engine, expire_on_commit=False)

class Base(DeclarativeBase):
    pass
