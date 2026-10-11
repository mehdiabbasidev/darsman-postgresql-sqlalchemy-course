from collections.abc import Sequence

from sqlalchemy import or_, select
from sqlalchemy.orm import Session

from app.models import Document

# -------------------------------------------------------------------------
def search_documents(
    session: Session,
    keyword: str | None = None,
    page: int = 1,
    page_size: int = 5,
) -> Sequence[Document]:
    
    stmt = select(Document)

    if keyword:
        pattern = f"%{keyword}%"
        stmt = stmt.where(
            or_(Document.title.ilike(pattern), Document.content.ilike(pattern))
        )

    stmt = (
        stmt.order_by(Document.created_at.desc(), Document.id.desc())
        .limit(page_size)
        .offset((page - 1) * page_size)
    )
    return session.scalars(stmt).all()

